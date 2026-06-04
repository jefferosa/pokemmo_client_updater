minimapWidget = nil
minimapButton = nil
minimapWindow = nil
otmm = true
preloaded = false
fullmapView = false
oldZoom = nil
oldPos = nil

local MAP_COMPOSITIONS, COMPOSITIONS = {}, {}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Viridian", position = {x = 715, y = 793, z = 7}}
-- MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Pallet", position = {x = 3292, y = 799, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Pewter", position = {x = 720, y = 879, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Cerulean", position = {x = 1024, y = 840, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Saffron", position = {x = 1018, y = 1017, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Celadon", position = {x = 889, y = 999, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Lavender", position = {x = 1195, y = 975, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Vermilion", position = {x = 1010, y = 1177, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Fuchsia", position = {x = 1017, y = 1329, z = 7}}
MAP_COMPOSITIONS[#MAP_COMPOSITIONS + 1] = {text = "Cinnabar", position = {x = 511, y = 1394, z = 7}}

MAPMARK_TICK = 0
MAPMARK_QUESTION = 1
MAPMARK_EXCLAMATION = 2
MAPMARK_STAR = 3
MAPMARK_CROSS = 4
MAPMARK_TEMPLE = 5
MAPMARK_KISS = 6
MAPMARK_SHOVEL = 7
MAPMARK_SWORD = 8
MAPMARK_FLAG = 9
MAPMARK_LOCK = 10
MAPMARK_BAG = 11
MAPMARK_SKULL = 12
MAPMARK_DOLLAR = 13
MAPMARK_REDNORTH = 14
MAPMARK_REDSOUTH = 15
MAPMARK_REDEAST = 16
MAPMARK_REDWEST = 17
MAPMARK_GREENNORTH = 18
MAPMARK_GREENSOUTH = 19

local GUIDES = {}

GUIDES["Saffron"] = { -- Guide Andie
    -- {position = {x = 1069, y = 1027, z = 7}, type = MAPMARK_DOLLAR, description = "Poke Mart and Bank"},
    -- {position = {x = 1066, y = 1027, z = 7}, type = MAPMARK_DOLLAR, description = "Market venda de pokemons e itens"},
    -- {position = {x = 1029, y = 1018, z = 7}, type = MAPMARK_DOLLAR, description = "Task 3 horas"},
    -- {position = {x = 1029, y = 1011, z = 7}, type = MAPMARK_DOLLAR, description = "Comprador de Pokemons"},
    -- {position = {x = 1019, y = 1014, z = 7}, type = MAPMARK_TEMPLE, description = "Pokemon Center"},
	-- {position = {x = 1038, y = 1018, z = 7}, type = MAPMARK_STAR, description = "Compra Stone de Player"},
	-- {position = {x = 1037, y = 1012, z = 7}, type = MAPMARK_STAR, description = "Nick e Aura"},
    -- {position = {x = 3964, y = 448, z = 7}, type = MAPMARK_BAG, description = "Food Shop and Furniture Shop"},
    -- {position = {x = 3969, y = 462, z = 7}, type = MAPMARK_SWORD, description = "GYM"},
    -- {position = {x = 3876, y = 487, z = 7}, type = MAPMARK_STAR, description = "Silph Co."},
    -- {position = {x = 4006, y = 464, z = 7}, type = MAPMARK_STAR, description = "Guild House"},
    -- {position = {x = 3895, y = 464, z = 7}, type = MAPMARK_STAR, description = "Travel Fly"},
    -- {position = {x = 3886, y = 464, z = 7}, type = MAPMARK_STAR, description = "Travel Balloon"},
    -- {position = {x = 3945, y = 454, z = 7}, type = MAPMARK_BAG, description = "Berry Shop"},
}

local guideEnabled = true
local guideMarks = {}

local function removeGuides()
    for k, v in pairs(guideMarks) do
        v:destroy()
    end
    guideMarks = {}
end

local function addGuides()
    for k, city in pairs(GUIDES) do
        for _, mark in pairs(city) do
            guideMarks[#guideMarks + 1] = minimapWidget:addFlag(mark.position, mark.type, tr(mark.description))
        end
    end
end

function setGuidesDisplay(v)
    guideEnabled = v
    if (not guideEnabled) then
        removeGuides()
    end
end


function init()
  minimapButton = modules.client_topmenu.addRightGameToggleButton('minimapButton', 
    tr('Minimap') .. ' (Ctrl+M)', '/images/topbuttons/minimap', toggle)
  minimapButton:setOn(true)

  minimapWindow = g_ui.loadUI('minimap', modules.game_interface.getRightPanel())
  minimapWindow:setContentMinimumHeight(64)

  minimapWidget = minimapWindow:recursiveGetChildById('minimap')

  local gameRootPanel = modules.game_interface.getRootPanel()
  g_keyboard.bindKeyPress('Alt+Left', function() minimapWidget:move(1,0) end, gameRootPanel)
  g_keyboard.bindKeyPress('Alt+Right', function() minimapWidget:move(-1,0) end, gameRootPanel)
  g_keyboard.bindKeyPress('Alt+Up', function() minimapWidget:move(0,1) end, gameRootPanel)
  g_keyboard.bindKeyPress('Alt+Down', function() minimapWidget:move(0,-1) end, gameRootPanel)
  g_keyboard.bindKeyDown('Ctrl+M', toggle)
  g_keyboard.bindKeyDown('Ctrl+Tab', toggleFullMap)

  minimapWindow:setup()

  connect(g_game, {
    onGameStart = online,
    onGameEnd = offline,
  })

  connect(LocalPlayer, {
    onPositionChange = updateCameraPosition
  })

  if g_game.isOnline() then
    online()
  end

  -- Escuta o servidor para adicionar marcações de Quest no mapa
  ProtocolGame.registerExtendedOpcode(103, function(protocol, opcode, buffer)
    local params = string.split(buffer, "|")
    if #params == 5 then
      local pos = {x = tonumber(params[1]), y = tonumber(params[2]), z = tonumber(params[3])}
      local iconId = tonumber(params[4])
      local desc = params[5]

      -- Adiciona a marcação no minimapa do jogador
      minimapWidget:addFlag(pos, iconId, desc)
    end
  end)
end

function terminate()
  if g_game.isOnline() then
    saveMap()
  end

  disconnect(g_game, {
    onGameStart = online,
    onGameEnd = offline,
  })

  disconnect(LocalPlayer, {
    onPositionChange = updateCameraPosition
  })

  local gameRootPanel = modules.game_interface.getRootPanel()
  g_keyboard.unbindKeyPress('Alt+Left', gameRootPanel)
  g_keyboard.unbindKeyPress('Alt+Right', gameRootPanel)
  g_keyboard.unbindKeyPress('Alt+Up', gameRootPanel)
  g_keyboard.unbindKeyPress('Alt+Down', gameRootPanel)
  g_keyboard.unbindKeyDown('Ctrl+M')
  g_keyboard.unbindKeyDown('Ctrl+Shift+M')

  ProtocolGame.unregisterExtendedOpcode(103)
  minimapWindow:destroy()
  minimapButton:destroy()
end

function toggle()
  if minimapButton:isOn() then
    minimapWindow:close()
    minimapButton:setOn(false)
  else
    minimapWindow:open()
    minimapButton:setOn(true)
  end
end

function onMiniWindowClose()
  minimapButton:setOn(false)
end

function preload()
  loadMap(false)
  preloaded = true
end

function online()
  loadMap(not preloaded)
  updateCameraPosition()
end

function offline()
  saveMap()
end

local function loadCompositions()
    g_minimap.loadImage('map', {x = 0, y = 0, z = 7}, 0.5)

    for _, composition in pairs(MAP_COMPOSITIONS) do
        local flag = g_ui.createWidget('MinimapFlag')
        minimapWidget:insertChild(1, flag)
        flag.pos = composition.position
        flag:setText(composition.text)
        flag:setFont("sans-bold-16px")
        flag:setTextAutoResize(true)
        flag:setVisible(false)
        minimapWidget:centerInPosition(flag, flag.pos)
        COMPOSITIONS[#COMPOSITIONS + 1] = flag
    end
end

function loadMap(clean)
  local clientVersion = g_game.getClientVersion()

  if clean then
    g_minimap.clean()
  end

  if otmm then
    local minimapFile = '/minimap.otmm'
    if g_resources.fileExists(minimapFile) then
      g_minimap.loadOtmm(minimapFile)
    end
  else
    local minimapFile = '/minimap_' .. clientVersion .. '.otcm'
    if g_resources.fileExists(minimapFile) then
      g_map.loadOtcm(minimapFile)
    end
  end
  loadCompositions()
  removeGuides()
  if (guideEnabled) then
    addGuides()
  end
  minimapWidget:load()
end

function saveMap()
  local clientVersion = g_game.getClientVersion()
  if otmm then
    local minimapFile = '/minimap.otmm'
    g_minimap.saveOtmm(minimapFile)
  else
    local minimapFile = '/minimap_' .. clientVersion .. '.otcm'
    g_map.saveOtcm(minimapFile)
  end
  minimapWidget:save()
end

function updateCameraPosition()
  local player = g_game.getLocalPlayer()
  if not player then return end
  local pos = player:getPosition()
  if not pos then return end
  if not minimapWidget:isDragging() then
    if not fullmapView then
      minimapWidget:setCameraPosition(player:getPosition())
    end
    minimapWidget:setCrossPosition(player:getPosition())
  end
	minimapPos = minimapWindow:recursiveGetChildById('posLabel')
	minimapPos:setText('X:'..pos.x..' Y:'..pos.y..' Z:'..pos.z)
end

function toggleFullMap()
  if not fullmapView then
    fullmapView = true
    minimapWidget:setColor('#000000AA')
    minimapWindow:hide()
    minimapWidget:setParent(modules.game_interface.getRootPanel())
    minimapWidget:fill('parent')
    minimapWidget:setAlternativeWidgetsVisible(true)
  else
    fullmapView = false
    minimapWidget:setColor('#1F007A')
    minimapWidget:setParent(minimapWindow:getChildById('contentsPanel'))
    minimapWidget:fill('parent')
    minimapWindow:show()
    minimapWidget:setAlternativeWidgetsVisible(false)
	local player = g_game.getLocalPlayer()
  end

  local zoom = oldZoom or 0
  local pos = oldPos or minimapWidget:getCameraPosition()
  oldZoom = minimapWidget:getZoom()
  oldPos = minimapWidget:getCameraPosition()
  minimapWidget:setZoom(zoom)
  minimapWidget:setCameraPosition(pos)
  player = g_game.getLocalPlayer()  
end