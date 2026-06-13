EnterGame = { }

-- private variables
local loadBox
local enterGame
local motdWindow
local motdButton
local enterGameButton
local clientBox
local protocolLogin
local motdEnabled = false

-- SEU IP E VERSÃO AQUI
local serverIp = 'pokemmo.zapto.org'
local serverPort = 7171
local serverProtocol = 1098

-- private functions
local function onError(protocol, message, errorCode)
  if loadBox then
    loadBox:destroy()
    loadBox = nil
  end

  if not errorCode then
    EnterGame.clearAccountFields()
  end

  local errorBox = displayErrorBox(tr('Login Error'), message)
  connect(errorBox, { onOk = EnterGame.show })
end

local function onMotd(protocol, motd)
  G.motdNumber = tonumber(motd:sub(0, motd:find("\n")))
  G.motdMessage = motd:sub(motd:find("\n") + 1, #motd)
  if motdEnabled then
    motdButton:show()
  end
end

local function onSessionKey(protocol, sessionKey)
  G.sessionKey = sessionKey
end

local function onCharacterList(protocol, characters, account, otui)
  ServerList.add(G.host, G.port, g_game.getClientVersion())

  -- Save 'Stay logged in' setting (se existir)
  local stayLoggedBox = enterGame:getChildById('stayLoggedBox')
  if stayLoggedBox then
      g_settings.set('staylogged', stayLoggedBox:isChecked())
  end

  if enterGame:getChildById('rememberPasswordBox'):isChecked() then
    local encAccount = g_crypt.encrypt(G.account)
    local encPassword = g_crypt.encrypt(G.password)

    g_settings.set('account', encAccount)
    g_settings.set('password', encPassword)

    ServerList.setServerAccount(G.host, encAccount)
    ServerList.setServerPassword(G.host, encPassword)

    g_settings.set('autologin', enterGame:getChildById('autoLoginBox'):isChecked())
  else
    ServerList.setServerAccount(G.host, '')
    ServerList.setServerPassword(G.host, '')
    EnterGame.clearAccountFields()
  end

  if loadBox then
      loadBox:destroy()
      loadBox = nil
  end

  for _, characterInfo in pairs(characters) do
    if characterInfo.previewState and characterInfo.previewState ~= PreviewState.Default then
      characterInfo.worldName = characterInfo.worldName .. ', Preview'
    end
  end

  CharacterList.create(characters, account, otui)
  CharacterList.show()

  if motdEnabled then
    local lastMotdNumber = g_settings.getNumber("motd")
    if G.motdNumber and G.motdNumber ~= lastMotdNumber then
      g_settings.set("motd", G.motdNumber)
      motdWindow = displayInfoBox(tr('Message of the day'), G.motdMessage)
      connect(motdWindow, { onOk = function() CharacterList.show() motdWindow = nil end })
      CharacterList.hide()
    end
  end
end

local function onUpdateNeeded(protocol, signature)
  if loadBox then
      loadBox:destroy()
      loadBox = nil
  end

  if EnterGame.updateFunc then
    local continueFunc = EnterGame.show
    local cancelFunc = EnterGame.show
    EnterGame.updateFunc(signature, continueFunc, cancelFunc)
  else
    local errorBox = displayErrorBox(tr('Update needed'), tr('Your client needs updating, try redownloading it.'))
    connect(errorBox, { onOk = EnterGame.show })
  end
end

-- public functions
function EnterGame.init()
  enterGame = g_ui.displayUI('entergame')
  enterGameButton = modules.client_topmenu.addLeftButton('enterGameButton', tr('Login') .. ' (Ctrl + G)', '/images/topbuttons/login', EnterGame.openWindow)
  motdButton = modules.client_topmenu.addLeftButton('motdButton', tr('Message of the day'), '/images/topbuttons/motd', EnterGame.displayMotd)
  motdButton:hide()
  g_keyboard.bindKeyDown('Ctrl+G', EnterGame.openWindow)

  local account = g_settings.get('account')
  local password = g_settings.get('password')
  local host = g_settings.get('host')
  local port = g_settings.get('port')
  local stayLogged = g_settings.getBoolean('staylogged')
  local autologin = g_settings.getBoolean('autologin')
  local clientVersion = g_settings.getInteger('client-version')
  
  if clientVersion == 0 then clientVersion = serverProtocol end
  if port == nil or port == 0 then port = serverPort end
  if host == nil or host == "" then host = serverIp end

  EnterGame.setAccountName(account)
  EnterGame.setPassword(password)

  enterGame:getChildById('serverHostTextEdit'):setText(host)
  enterGame:getChildById('serverPortTextEdit'):setText(port)
  enterGame:getChildById('autoLoginBox'):setChecked(autologin)
  
  local stayBox = enterGame:getChildById('stayLoggedBox')
  if stayBox then stayBox:setChecked(stayLogged) end

  clientBox = enterGame:getChildById('clientComboBox')
  for _, proto in pairs(g_game.getSupportedClients()) do
    clientBox:addOption(proto)
  end
  clientBox:setCurrentOption(clientVersion)

  connect(clientBox, { onOptionChange = EnterGame.onClientVersionChange })

  enterGame:hide()

  if g_app.isRunning() and not g_game.isOnline() then
    enterGame:show()
  end
  
  -- Preenche os campos ocultos do OTUI com o IP real sem quebrar o layout
  EnterGame.setUniqueServer(serverIp, serverPort, serverProtocol)
end

function EnterGame.firstShow()
  EnterGame.show()

  local account = g_crypt.decrypt(g_settings.get('account'))
  local password = g_crypt.decrypt(g_settings.get('password'))
  local host = g_settings.get('host')
  local autologin = g_settings.getBoolean('autologin')
  
  if #host > 0 and #password > 0 and #account > 0 and autologin then
    addEvent(function()
      if not g_settings.getBoolean('autologin') then return end
      EnterGame.doLogin()
    end)
  end
end

function EnterGame.terminate()
  g_keyboard.unbindKeyDown('Ctrl+G')
  disconnect(clientBox, { onOptionChange = EnterGame.onClientVersionChange })
  enterGame:destroy()
  enterGame = nil
  enterGameButton:destroy()
  enterGameButton = nil
  clientBox = nil
  if motdWindow then
    motdWindow:destroy()
    motdWindow = nil
  end
  if motdButton then
    motdButton:destroy()
    motdButton = nil
  end
  if loadBox then
    loadBox:destroy()
    loadBox = nil
  end
  if protocolLogin then
    protocolLogin:cancelLogin()
    protocolLogin = nil
  end
  EnterGame = nil
end

function EnterGame.show()
  if loadBox then return end
  enterGame:show()
  enterGame:raise()
  enterGame:focus()
end

function EnterGame.hide()
  enterGame:hide()
end

function EnterGame.openWindow()
  if g_game.isOnline() then
    CharacterList.show()
  elseif not g_game.isLogging() and not CharacterList.isVisible() then
    EnterGame.show()
  end
end

function EnterGame.setAccountName(account)
  local decAccount = g_crypt.decrypt(account)
  local textEdit = enterGame:getChildById('accountNameTextEdit')
  textEdit:setText(decAccount)
  textEdit:setCursorPos(-1)
  enterGame:getChildById('rememberPasswordBox'):setChecked(#decAccount > 0)
end

function EnterGame.setPassword(password)
  local decPassword = g_crypt.decrypt(password)
  enterGame:getChildById('accountPasswordTextEdit'):setText(decPassword)
end

function EnterGame.clearAccountFields()
  enterGame:getChildById('accountNameTextEdit'):clearText()
  enterGame:getChildById('accountPasswordTextEdit'):clearText()
  
  local tokenEdit = enterGame:getChildById('authenticatorTokenTextEdit')
  if tokenEdit then tokenEdit:clearText() end
  
  enterGame:getChildById('accountNameTextEdit'):focus()
  g_settings.remove('account')
  g_settings.remove('password')
end

function EnterGame.onClientVersionChange(comboBox, text, data)
  local clientVersion = tonumber(text)
  -- Mantido apenas para compatibilidade de eventos caso existam
end

function EnterGame.doLogin()
  G.account = enterGame:getChildById('accountNameTextEdit'):getText()
  G.password = enterGame:getChildById('accountPasswordTextEdit'):getText()
  
  local tokenEdit = enterGame:getChildById('authenticatorTokenTextEdit')
  G.authenticatorToken = tokenEdit and tokenEdit:getText() or ""
  
  local stayBox = enterGame:getChildById('stayLoggedBox')
  G.stayLogged = stayBox and stayBox:isChecked() or false
  
  G.host = enterGame:getChildById('serverHostTextEdit'):getText()
  G.port = tonumber(enterGame:getChildById('serverPortTextEdit'):getText())
  
  local clientVersion = tonumber(clientBox:getText())
  EnterGame.hide()

  if g_game.isOnline() then
    local errorBox = displayErrorBox(tr('Login Error'), tr('Cannot login while already in game.'))
    connect(errorBox, { onOk = EnterGame.show })
    return
  end

  g_settings.set('host', G.host)
  g_settings.set('port', G.port)
  g_settings.set('client-version', clientVersion)

  protocolLogin = ProtocolLogin.create()
  protocolLogin.onLoginError = onError
  protocolLogin.onMotd = onMotd
  protocolLogin.onSessionKey = onSessionKey
  protocolLogin.onCharacterList = onCharacterList
  protocolLogin.onUpdateNeeded = onUpdateNeeded

  loadBox = displayCancelBox(tr('Please wait'), tr('Connecting to login server...'))
  connect(loadBox, { onCancel = function(msgbox)
                                  loadBox = nil
                                  protocolLogin:cancelLogin()
                                  EnterGame.show()
                                end })

  g_game.setClientVersion(clientVersion)
  g_game.setProtocolVersion(g_game.getClientProtocolVersion(clientVersion))
  g_game.chooseRsa(G.host)

  if modules.game_things.isLoaded() then
    protocolLogin:login(G.host, G.port, G.account, G.password, G.authenticatorToken, G.stayLogged)
  else
    if loadBox then
        loadBox:destroy()
        loadBox = nil
    end
    EnterGame.show()
  end
end

function EnterGame.displayMotd()
  if not motdWindow then
    motdWindow = displayInfoBox(tr('Message of the day'), G.motdMessage)
    motdWindow.onOk = function() motdWindow = nil end
  end
end

function EnterGame.setDefaultServer(host, port, protocol)
  local hostTextEdit = enterGame:getChildById('serverHostTextEdit')
  local portTextEdit = enterGame:getChildById('serverPortTextEdit')
  local accountTextEdit = enterGame:getChildById('accountNameTextEdit')
  local passwordTextEdit = enterGame:getChildById('accountPasswordTextEdit')
  local authenticatorTokenTextEdit = enterGame:getChildById('authenticatorTokenTextEdit')

  if hostTextEdit:getText() ~= host then
    hostTextEdit:setText(host)
    portTextEdit:setText(port)
    clientBox:setCurrentOption(protocol)
    accountTextEdit:setText('')
    passwordTextEdit:setText('')
    if authenticatorTokenTextEdit then authenticatorTokenTextEdit:setText('') end
  end
end

function EnterGame.setUniqueServer(host, port, protocol)
  -- Apenas injeta os valores técnicos ocultos. O OTUI cuida de esconder.
  local hostTextEdit = enterGame:getChildById('serverHostTextEdit')
  if hostTextEdit then hostTextEdit:setText(host) end
  
  local portTextEdit = enterGame:getChildById('serverPortTextEdit')
  if portTextEdit then portTextEdit:setText(port) end

  if clientBox then clientBox:setCurrentOption(protocol) end
end

function EnterGame.setServerInfo(message)
  local label = enterGame:getChildById('serverInfoLabel')
  if label then label:setText(message) end
end

function EnterGame.disableMotd()
  motdEnabled = false
  if motdButton then motdButton:hide() end
end