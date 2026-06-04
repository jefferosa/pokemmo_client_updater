local item = {"bagbox", "heldbox", "expshare", "linkingcord", "celular", "heavyball", "duskball", "loveball", "netball", "premierball"}
local items = {
	["bagbox"] = {name = "Bag Box", id = 35819, price = 25, desc = "Contem uma mochila aleatoria.\nPode ser de 20, 50 ou 100 slots."},
	["heldbox"] = {name = "Held Box", id = 35820, price = 100, desc = "Contem um held aleatorio.\nLista de possiveis helds:\nAttack - Aumenta o ataque em 15%.\nDefense - Aumenta a defesa em 10%.\nExperience - Aumenta a experiencia em 25%.\nBurn - Aumenta o dano do burn em 300%.\nPoison - Aumenta o dano do poison em 300%.\nWing - Aumenta a velocidade de voo em 500."},
	["expshare"] = {name = "Exp. Share", id = 35821, price = 250, desc = "O pokemon que segurar o exp. share recebera\nexperiencia dentro de sua mochila."},
	["linkingcord"] = {name = "Linking Cord", id = 35823, price = 10, desc = "Evolui pokemons que evoluiriam com troca.\nGraver > Golem\nHaunter > Gengar\nKadabra > Alakazam\nMachoke > Machamp"},
	["celular"] = {name = "Celular", id = 35822, price = 500, desc = "Uma ferramenta necessaria para o treinador.\nPossui diversas funcoes como:\nRemover Held\nRemover Exp. Share\nComprar comida especial\nMudar forma de pokemons\nUSO ILIMITADO."},
	["heavyball"] = {name = "Heavy Ball", id = 39201, price = 5, desc = "Uma pokebola que melhora a chance de captura quanto mais pesado for o pokemon."},
	["duskball"] = {name = "Dusk Ball", id = 39201, price = 5, desc = "Uma pokebola que funciona somente a noite\n(18h ~ 4h, horario do jogo)\nMais forte que a ultra ball."},
	["loveball"] = {name = "Love Ball", id = 39201, price = 5, desc = "Uma pokebola que so funciona nos mesmos pokemons que o seu.\nMais forte que a ultra ball."},
	["netball"] = {name = "Net Ball", id = 39201, price = 5, desc = "Uma pokebola que so funciona em pokemons inseto ou agua.\nMais forte que a ultra ball."},
	["premierball"] = {name = "Premier Ball", id = 39201, price = 5, desc = "Uma pokebola que adiciona aura ao pokemon quando capturado.\nPossui a mesma chance que uma pokebola comum."},
}


function init()
token = g_ui.displayUI('token')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
token:hide()

ProtocolGame.registerExtendedOpcode(73, showApps)
end

function hide()
	if token:isVisible() then
	  token:hide()
		destroyApps()
	end
end

function show()
  token:show()
  token:raise()
  token:focus()
end

function showApps()
	-- destroyApps()
	token:show()
	for i = 1, #item do
		icon = g_ui.createWidget('FuncButton',token)
		icon:setId('app'..i)
		local pathOn = "interface/"..item[i]..".png"
		icon:setImageSource(pathOn)
		icon:setMarginTop(30)
		icon:setMarginLeft(35 + ((i-1) * 32))
		icon:setWidth(38)
		icon:setHeight(38)
		icon:setSize(icon:getSize())
		icon:setVisible(true)
		icon:setTooltip(items[item[i]].name.."\n"..items[item[i]].desc.."\n"..items[item[i]].price.." Tokens por Unid.")
		text = g_ui.createWidget('TextUI',token)
		text:setText(1)
		text:setId('text'..i)
		text:setMarginTop(88)
		text:setMarginLeft(51 + ((i-1) * 32))
		plusbutton = g_ui.createWidget('FuncButton',token)
		minusbutton = g_ui.createWidget('FuncButton',token)
		plusbutton:setId('plusbutton'..i)
		minusbutton:setId('minusbutton'..i)
		plusbutton:setWidth(16)
		minusbutton:setWidth(16)
		plusbutton:setHeight(16)
		minusbutton:setHeight(16)
		plusbutton:setSize(plusbutton:getSize())
		minusbutton:setSize(minusbutton:getSize())
		local path1 = "interface/plus.png"
		local path2 = "interface/minus.png"
		plusbutton:setImageSource(path1)
		minusbutton:setImageSource(path2)
		plusbutton:addAnchor(AnchorRight, token:recursiveGetChildById('app'..i), AnchorLeft)
		minusbutton:addAnchor(AnchorRight, token:recursiveGetChildById('app'..i), AnchorLeft)
		plusbutton:addAnchor(AnchorBottom, token:recursiveGetChildById('app'..i), AnchorTop)
		minusbutton:addAnchor(AnchorBottom, token:recursiveGetChildById('app'..i), AnchorTop)
		plusbutton:setMarginLeft(47 + ((i-1) * 32))
		minusbutton:setMarginLeft(45 + ((i-1) * 32))
		plusbutton:setMarginTop(68)
		minusbutton:setMarginTop(105)
		plusbutton.onClick = function() token:recursiveGetChildById('text'..i):setText(tonumber(token:recursiveGetChildById('text'..i):getText())+1) end
		minusbutton.onClick = function() if tonumber(token:recursiveGetChildById('text'..i):getText()) >= 2 then token:recursiveGetChildById('text'..i):setText(tonumber(token:recursiveGetChildById('text'..i):getText())-1) end end
		buy = g_ui.createWidget('FuncButton',token)
		buy:setId('buybutton'..i)
		local path1 = "interface/removebutton.png"
		buy:setImageSource(path1)
		buy:setMarginTop(125)
		buy:setMarginLeft(37 + ((i-1) * 32))
		buy:setWidth(32)
		buy:setHeight(24)
		buy:setSize(buy:getSize())
		buy:setText('BUY')
		buy.onClick = function() buyItem(tonumber(token:recursiveGetChildById('text'..i):getText()), item[i]) end
	end
	token:setMarginTop(160)
	token:setMarginLeft(256)
	token:setHeight(28 * 6)
	token:setWidth(30 * 13)  
	token:setSize(token:getSize())
end

function destroyApps()
  for i = 1, 50 do
    if token:recursiveGetChildById('app'..i) ~= nil then
      token:recursiveGetChildById('app'..i):destroy()
	end
	if token:recursiveGetChildById('text'..i) ~= nil then
      token:recursiveGetChildById('text'..i):destroy()
	end
	if token:recursiveGetChildById('minusbutton'..i) ~= nil then
      token:recursiveGetChildById('minusbutton'..i):destroy()
    end
	if token:recursiveGetChildById('plusbutton'..i) ~= nil then
      token:recursiveGetChildById('plusbutton'..i):destroy()
    end
	if token:recursiveGetChildById('buybutton'..i) ~= nil then
      token:recursiveGetChildById('buybutton'..i):destroy()
    end
  end
  if token:recursiveGetChildById('miniwindow') ~= nil then
    token:recursiveGetChildById('miniwindow'):hide()
  end
end

function buyItem(qt, name)
  if acceptWindow then
    return true
  end
  if qt <= 0 then
	return true
  end

  local acceptFunc = function()
    g_game.talk("#tokenitem "..name.."|"..qt)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Token Collector'), tr("Voce deseja comprar "..qt.."x "..name..", isso ira custar "..(items[name].price * qt).." tokens."),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end