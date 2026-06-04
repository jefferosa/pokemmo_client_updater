-- Public functions
function init()
  NewPokemon = g_ui.displayUI('newPokemon')

  -- Se a função getParams estiver mais para baixo no seu arquivo original, ela continuará funcionando!
  connect(g_game, 'onTextMessage', getParams) 
  connect(g_game, { onGameEnd = hide } )
  
  NewPokemon:hide()
  ProtocolGame.registerExtendedOpcode(69, function(protocol, opcode, buffer) parse(buffer) end)
end

function parse(buffer)
  -- Em vez de apenas dar :show(), agora ele chama a função completa abaixo
  show() 
end

function hide()
  if NewPokemon and NewPokemon:isVisible() then
    NewPokemon:hide()
  end
end

function show()
  if NewPokemon then
    NewPokemon:show()
    NewPokemon:raise() -- Puxa para a frente de tudo
    NewPokemon:focus() -- Foca o mouse nela
  end
end

function firstpoke(poke)
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#firstpoke "..poke.."")
    acceptWindow:destroy()
    acceptWindow = nil
    NewPokemon:hide()
  end
  
  local cancelFunc = function() 
    acceptWindow:destroy() 
    acceptWindow = nil 
  end

  acceptWindow = displayGeneralBox(tr('Escolher pokemon'), tr("Voce deseja escolher "..poke.." como seu inicial? Essa decisao e irreversivel."),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end