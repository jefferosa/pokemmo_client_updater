npcDialogWindow = nil
optionsPanel = nil

function init()
  npcDialogWindow = g_ui.displayUI('npcdialog')
  optionsPanel = npcDialogWindow:getChildById('optionsPanel')
  npcDialogWindow:hide()

  -- Registra as escutas
  ProtocolGame.registerExtendedOpcode(105, onNpcDialog)
  
  -- Escuta se o jogador tentar atacar algo (Clique Direito)
  connect(g_game, { onAttackingCreatureChange = onAttackCreature })
end

function terminate()
  ProtocolGame.unregisterExtendedOpcode(105, onNpcDialog)
  disconnect(g_game, { onAttackingCreatureChange = onAttackCreature })
  npcDialogWindow:destroy()
end

function onAttackCreature(creature)
  -- Se o alvo existir e for um NPC
  if creature and creature:isNpc() then
    g_game.cancelAttack() -- Bloqueia o erro "nao posso atacar"
    g_game.talk("hi")     -- Envia o cumprimento automaticamente
  end
end

function onNpcDialog(protocol, opcode, buffer)
  local data = string.split(buffer, "|")
  if #data < 3 then return end

  local npcName = data[1]
  local message = data[2]
  local optionsString = data[3]
  
  npcDialogWindow:getChildById('npcName'):setText(npcName)
  npcDialogWindow:getChildById('npcMessage'):setText(message)
  
  optionsPanel:destroyChildren()
  local options = string.split(optionsString, ",")
  
  for i = 1, #options do
    local btn = g_ui.createWidget('Button', optionsPanel)
    btn:setText(options[i])
    btn:setHeight(22)
    
    btn.onClick = function()
      local answer = options[i]
      
      -- Se for uma opção de encerramento, envia a palavra chave 'bye' para o servidor te soltar
      if answer == "Tchau" or answer == "Entendido" or answer == "Obrigado Professor" then
        g_game.talk("good bye")
      else
        g_game.talk(answer)
      end
      
      npcDialogWindow:hide()
    end
  end
  
  npcDialogWindow:show()
  npcDialogWindow:raise()
  npcDialogWindow:focus()
end