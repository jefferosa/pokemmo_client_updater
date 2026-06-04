local apps = {"Poke Food", "Held Remove", "Exp Share", "Rotom Appliances", "Deoxys Form", "Talisman Remover"}
local food = {"mariburger", "wobburger", "natburger", "snorburger", "mewburger", "french fries", "pizza"}
local rotom = {"Heat", "Fan", "Mow", "Wash", "Frost", "Normal"}
local rotoms = {
	["Heat"] = {desc = "Se funde com um micro-ondas,\nse tornando do tipo ELECTRIC/FIRE.", type2 = "fire"},
	["Fan"] = {desc = "Se funde com um ventilador,\nse tornando do tipo ELECTRIC/FLYING.", type2 = "flying"},
	["Mow"] = {desc = "Se funde com um cortador de grama,\nse tornando do tipo ELECTRIC/GRASS.", type2 = "grass"},
	["Wash"] = {desc = "Se funde com uma maquina de lavar,\nse tornando do tipo ELECTRIC/WATER.", type2 = "water"},
	["Frost"] = {desc = "Se funde com uma geladeira,\nse tornando do tipo ELECTRIC/ICE.", type2 = "ice"},
	["Normal"] = {desc = "Retornar a forma original de Rotom\ndo tipo ELECTRIC/GHOST.", type2 = "ghost"},
}
local deoxys = {"Attack", "Defense", "Speed", "Base"}
local deoxies = {
	["Attack"] = "Assume posicao de ataque\nreduzindo todos os status\ne aumentando o ataque.",
	["Defense"] = "Assume posicao de defesa\nreduzindo todos os status\ne aumentando a defesa.",
	["Speed"] = "Assume posicao de velocidade\nreduzindo todos os status\ne aumentando a velocidade e esquiva.",
	["Base"] = "Retorna a forma base\nneutralizando todas as mudancas de status.",
}
local info
local foods = {
	["mariburger"] = {name = "Mariburger", id = 35819, price = 10000, desc = "Duration: 6h. Heals 10hp/s."},
	["wobburger"] = {name = "Wobburger", id = 35820, price = 12500, desc = "Duration: 6h. Heals 15hp/s."},
	["natburger"] = {name = "Natburger", id = 35821, price = 15000, desc = "Duration: 6h. Heals 20hp/s."},
	["snorburger"] = {name = "Snorburger", id = 35823, price = 50000, desc = "Duration: 1 dia. Heals 15hp/s."},
	["mewburger"] = {name = "Mewburger", id = 35822, price = 100000, desc = "Duration: 1 dia. Heals 50hp/s."},
	["french fries"] = {name = "French Fries", id = 39201, price = 500, desc = "Duration: 1h. Heals 2hp/s."},
	["pizza"] = {name = "Pizza", id = 39222, price = 1000, desc = "Duration: 2h. Heals 3hp/s."},
}


function init()
computersystem = g_ui.displayUI('computersystem')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
computersystem:hide()

ProtocolGame.registerExtendedOpcode(17, parse)
end

function parse(protocol, opcode, buffer)
	info = buffer
	show()
	showApps(buffer)
end

function hide()
	if computersystem:isVisible() then
	  computersystem:hide()
		destroyApps()
	end
end

function show()
  computersystem:show()
  computersystem:raise()
  computersystem:focus()
end

function showApps(number)
	destroyApps()
	for i = 1, 6 do
		icon = g_ui.createWidget('FuncButton',computersystem)
		icon:setId('app'..i)
		local pathOn = "interface/"..apps[i]:lower()..".png"
		icon:setImageSource(pathOn)
		if i <= 5 then
			icon:setMarginLeft(32)
			icon:setMarginTop((i-1) * 72 + 12)
		else
			icon:setMarginLeft(98)
			icon:setMarginTop((i-6) * 72 + 12)
		end
		icon:setWidth(48)
		icon:setHeight(48)
		icon:setSize(icon:getSize())
		icon:setVisible(true)
		local text = apps[i]
		if #text > 10 then
			text = text:split(" ")[1].."\n"..text:split(" ")[2]
		end
		icon:recursiveGetChildById('textdesc'):setText(text)
		icon:recursiveGetChildById('textdesc'):setTextAlign(AlignCenter)
		icon:recursiveGetChildById('textdesc'):setMarginTop(46)
		icon:recursiveGetChildById('textdesc'):setMarginLeft(-18)
		icon:recursiveGetChildById('textdesc'):setHeight(25)
		icon.onClick = function() displayApp(apps[i]) end
	end
	-- closebutton = g_ui.createWidget('CloseButton',computersystem)
end

function destroyApps()
  for i = 1, 50 do
    if computersystem:recursiveGetChildById('app'..i) ~= nil then
      computersystem:recursiveGetChildById('app'..i):destroy()
	end
	if computersystem:recursiveGetChildById('text'..i) ~= nil then
      computersystem:recursiveGetChildById('text'..i):destroy()
	end
	if computersystem:recursiveGetChildById('minusbutton'..i) ~= nil then
      computersystem:recursiveGetChildById('minusbutton'..i):destroy()
    end
	if computersystem:recursiveGetChildById('plusbutton'..i) ~= nil then
      computersystem:recursiveGetChildById('plusbutton'..i):destroy()
    end
	if computersystem:recursiveGetChildById('buybutton'..i) ~= nil then
      computersystem:recursiveGetChildById('buybutton'..i):destroy()
    end
  end
  if computersystem:recursiveGetChildById('miniwindow') ~= nil then
    computersystem:recursiveGetChildById('miniwindow'):hide()
  end
end

function displayApp(app)
	destroyApps()
	local width = 64
    local height = 64
	miniwindow = computersystem:recursiveGetChildById('miniwindow')
	if app == apps[1] then
		miniwindow:show()
		for i = 1, #food do
			icon = g_ui.createWidget('FuncButton',miniwindow)
			icon:setId('app'..i)
			local pathOn = "interface/"..food[i]..".png"
			icon:setImageSource(pathOn)
			icon:setMarginTop(10)
			icon:setMarginLeft(35 + ((i-1) * 32))
			icon:setVisible(true)
			icon:setTooltip(foods[food[i]].name.."\n"..foods[food[i]].desc.."\n$"..foods[food[i]].price)
			text = g_ui.createWidget('TextUI',miniwindow)
			text:setText(1)
			text:setId('text'..i)
			text:setMarginTop(68)
			text:setMarginLeft(51 + ((i-1) * 32))
			plusbutton = g_ui.createWidget('FuncButton',miniwindow)
			minusbutton = g_ui.createWidget('FuncButton',miniwindow)
			plusbutton:setId('plusbutton'..i)
			minusbutton:setId('minusbutton'..i)
			plusbutton:rotate(90)
			minusbutton:rotate(-90)
			plusbutton:setWidth(16)
			minusbutton:setWidth(16)
			plusbutton:setHeight(16)
			minusbutton:setHeight(16)
			plusbutton:setSize(plusbutton:getSize())
			minusbutton:setSize(minusbutton:getSize())
			local path2 = "interface/plusminus.png"
			plusbutton:setImageSource(path2)
			minusbutton:setImageSource(path2)
			plusbutton:addAnchor(AnchorRight, miniwindow:recursiveGetChildById('app'..i), AnchorLeft)
			minusbutton:addAnchor(AnchorRight, miniwindow:recursiveGetChildById('app'..i), AnchorLeft)
			plusbutton:addAnchor(AnchorBottom, miniwindow:recursiveGetChildById('app'..i), AnchorTop)
			minusbutton:addAnchor(AnchorBottom, miniwindow:recursiveGetChildById('app'..i), AnchorTop)
			plusbutton:setMarginLeft(47 + ((i-1) * 32))
			minusbutton:setMarginLeft(45 + ((i-1) * 32))
			plusbutton:setMarginTop(48)
			minusbutton:setMarginTop(85)
			plusbutton.onClick = function() miniwindow:recursiveGetChildById('text'..i):setText(tonumber(miniwindow:recursiveGetChildById('text'..i):getText())+1) end
			minusbutton.onClick = function() if tonumber(miniwindow:recursiveGetChildById('text'..i):getText()) >= 2 then miniwindow:recursiveGetChildById('text'..i):setText(tonumber(miniwindow:recursiveGetChildById('text'..i):getText())-1) end end
			buy = g_ui.createWidget('FuncButton',miniwindow)
			buy:setId('buybutton'..i)
			local path1 = "interface/removebutton.png"
			buy:setImageSource(path1)
			buy:setMarginTop(105)
			buy:setMarginLeft(37 + ((i-1) * 32))
			buy:setWidth(32)
			buy:setHeight(24)
			buy:setSize(buy:getSize())
			buy:setText('BUY')
			buy.onClick = function() buyFood(tonumber(miniwindow:recursiveGetChildById('text'..i):getText()), food[i]) end
		end
		returnbutton = g_ui.createWidget('FuncButton',miniwindow)
		returnbutton:setId('return')
		local pathOn = "interface/returnbutton.png"
		returnbutton:setImageSource(pathOn)
		returnbutton:setMarginTop(5)
		returnbutton:setMarginLeft(5)
		returnbutton:setVisible(true)
		returnbutton:setTooltip('Voltar')
		returnbutton:setWidth(24)
		returnbutton:setHeight(24)
		returnbutton:setSize(returnbutton:getSize())
		returnbutton.onClick = function() showApps(info) end
		
		miniwindow:setMarginTop(140)
		miniwindow:setMarginLeft(50)
		miniwindow:setHeight(28 * 5)
		miniwindow:setWidth(30 * 10)  
		miniwindow:setSize(miniwindow:getSize())
		miniwindow:setImageSize(miniwindow:getSize())
	elseif app == apps[2] then
		miniwindow:show()
		icon = g_ui.createWidget('FuncButton',miniwindow)
		icon:setId('app1')
		local pathOn = "interface/removebutton.png"
		icon:setImageSource(pathOn)
		icon:setMarginTop(110)
		icon:setMarginLeft(85)
		icon:setHeight(32)
		icon:setWidth(128)
		icon:setSize(icon:getSize())
		icon:setVisible(true)
		icon:setText('Remover')
		icon.onClick = function() removeheld() end
		text = g_ui.createWidget('TextUI',miniwindow)
		text:setId('text1')
		text:setText('Para remover um held seu\npokemon deve estar para fora \nda pokebola.')
		text:setFont('sans-bold-16px')
		text:setMarginLeft(-100)
		text:setMarginTop(-35)
		text:setHeight(200)
		text:setWidth(500)
		text:setTextAlign(AlignCenter)
		returnbutton = g_ui.createWidget('FuncButton',miniwindow)
		returnbutton:setId('return')
		local pathOn = "interface/returnbutton.png"
		returnbutton:setImageSource(pathOn)
		returnbutton:setMarginTop(5)
		returnbutton:setMarginLeft(5)
		returnbutton:setVisible(true)
		returnbutton:setTooltip('Voltar')
		returnbutton:setWidth(24)
		returnbutton:setHeight(24)
		returnbutton:setSize(returnbutton:getSize())
		returnbutton.onClick = function() showApps(info) end
		miniwindow:setMarginTop(140)
		miniwindow:setMarginLeft(50)
		miniwindow:setHeight(32 * 5)
		miniwindow:setWidth(30 * 10)  
		miniwindow:setSize(miniwindow:getSize())
		miniwindow:setImageSize(miniwindow:getSize())
	elseif app == apps[3] then
		miniwindow:show()
		icon = g_ui.createWidget('FuncButton',miniwindow)
		icon:setId('app1')
		local pathOn = "interface/removebutton.png"
		icon:setImageSource(pathOn)
		icon:setMarginTop(110)
		icon:setMarginLeft(85)
		icon:setHeight(32)
		icon:setWidth(128)
		icon:setSize(icon:getSize())
		icon:setVisible(true)
		icon:setText('Remover')
		icon.onClick = function() removeexp() end
		text = g_ui.createWidget('TextUI',miniwindow)
		text:setId('text1')
		text:setText('Para remover o exp share seu\npokemon deve estar para fora \nda pokebola.')
		text:setFont('sans-bold-16px')
		text:setMarginLeft(-100)
		text:setMarginTop(-35)
		text:setHeight(200)
		text:setWidth(500)
		text:setTextAlign(AlignCenter)
		returnbutton = g_ui.createWidget('FuncButton',miniwindow)
		returnbutton:setId('return')
		local pathOn = "interface/returnbutton.png"
		returnbutton:setImageSource(pathOn)
		returnbutton:setMarginTop(5)
		returnbutton:setMarginLeft(5)
		returnbutton:setVisible(true)
		returnbutton:setTooltip('Voltar')
		returnbutton:setWidth(24)
		returnbutton:setHeight(24)
		returnbutton:setSize(returnbutton:getSize())
		returnbutton.onClick = function() showApps(info) end
		miniwindow:setMarginTop(140)
		miniwindow:setMarginLeft(50)
		miniwindow:setHeight(32 * 5)
		miniwindow:setWidth(30 * 10)  
		miniwindow:setSize(miniwindow:getSize())
		miniwindow:setImageSize(miniwindow:getSize())
	elseif app == apps[4] then
		miniwindow:show()
		for i = 1, #rotom do
			icon = g_ui.createWidget('FuncButton',miniwindow)
			icon:setId('app'..i)
			local pathOn = "interface/"..rotom[i]:lower()..".png"
			icon:setImageSource(pathOn)
			if i <= 3 then
				icon:setMarginTop(-6)
				icon:setMarginLeft(24 + ((i-1) * 64))
			else
				icon:setMarginTop(85)
				icon:setMarginLeft(20 + ((math.fmod(i-1, 3)) * 64))
			end
			icon:setVisible(true)
			icon:setTooltip(rotom[i].." Rotom\n"..rotoms[rotom[i]].desc.."\n\nPARA TRANSFORMAR O ROTOM\nELE DEVE ESTAR\nFORA DA POKEBOLA.")
			icon:setWidth(64)
			icon:setHeight(64)
			icon:setSize(icon:getSize())
			icon:setImageSize(icon:getSize())
			icon.onClick = function() transformrotom(rotom[i]:lower()) end
			type1st = g_ui.createWidget('FuncButton',miniwindow)
			type2nd = g_ui.createWidget('FuncButton',miniwindow)
			type1st:setId('plusbutton'..i)
			type2nd:setId('minusbutton'..i)
			type1st:setWidth(60)
			type2nd:setWidth(60)
			type1st:setHeight(13)
			type2nd:setHeight(13)
			type1st:setSize(type1st:getSize())
			type2nd:setSize(type2nd:getSize())
			local path1 = "interface/electric.png"
			local path2 = "interface/"..rotoms[rotom[i]].type2..".png"
			type1st:setImageSource(path1)
			type2nd:setImageSource(path2)
			type1st:addAnchor(AnchorRight, miniwindow:recursiveGetChildById('app'..i), AnchorLeft)
			type2nd:addAnchor(AnchorRight, miniwindow:recursiveGetChildById('app'..i), AnchorLeft)
			type1st:addAnchor(AnchorBottom, miniwindow:recursiveGetChildById('app'..i), AnchorTop)
			type2nd:addAnchor(AnchorBottom, miniwindow:recursiveGetChildById('app'..i), AnchorTop)
			if i <= 3 then
				type1st:setMarginLeft(24 + ((i-1) * 64))
				type2nd:setMarginLeft(24 + ((i-1) * 64))
				type1st:setMarginTop(55)
				type2nd:setMarginTop(70)
			else
				type1st:setMarginLeft(24 + ((math.fmod(i-1, 3)) * 64))
				type2nd:setMarginLeft(24 + ((math.fmod(i-1, 3)) * 64))
				type1st:setMarginTop(150)
				type2nd:setMarginTop(165)
			end
			type1st:setPhantom(true)
			type2nd:setPhantom(true)
		end
		returnbutton = g_ui.createWidget('FuncButton',miniwindow)
		returnbutton:setId('return')
		local pathOn = "interface/returnbutton.png"
		returnbutton:setImageSource(pathOn)
		returnbutton:setMarginTop(5)
		returnbutton:setMarginLeft(5)
		returnbutton:setVisible(true)
		returnbutton:setTooltip('Voltar')
		returnbutton:setWidth(24)
		returnbutton:setHeight(24)
		returnbutton:setSize(returnbutton:getSize())
		returnbutton.onClick = function() showApps(info) end
		miniwindow:setMarginTop(140)
		miniwindow:setMarginLeft(80)
		miniwindow:setHeight(32 * 6)
		miniwindow:setWidth(30 * 8)  
		miniwindow:setSize(miniwindow:getSize())
		miniwindow:setImageSize(miniwindow:getSize())
	elseif app == apps[5] then
		miniwindow:show()
		for i = 1, #deoxys do
			icon = g_ui.createWidget('FuncButton',miniwindow)
			icon:setId('app'..i)
			local pathOn = "interface/"..deoxys[i]:lower()..".png"
			icon:setImageSource(pathOn)
			if i <= 2 then
				icon:setMarginTop(1)
				icon:setMarginLeft(24 + ((i-1) * 96))
			else
				icon:setMarginTop(90)
				icon:setMarginLeft(20 + ((math.fmod(i-1, 2)) * 96))
			end
			icon:setVisible(true)
			icon:setTooltip(deoxys[i].." Deoxys\n"..deoxies[deoxys[i]].."\n\nPARA TRANSFORMAR O DEOXYS\nELE DEVE ESTAR\nFORA DA POKEBOLA.")
			icon.onClick = function() transformdeoxys(deoxys[i]:lower()) end
		end
		returnbutton = g_ui.createWidget('FuncButton',miniwindow)
		returnbutton:setId('return')
		local pathOn = "interface/returnbutton.png"
		returnbutton:setImageSource(pathOn)
		returnbutton:setMarginTop(5)
		returnbutton:setMarginLeft(5)
		returnbutton:setVisible(true)
		returnbutton:setTooltip('Voltar')
		returnbutton:setWidth(24)
		returnbutton:setHeight(24)
		returnbutton:setSize(returnbutton:getSize())
		returnbutton.onClick = function() showApps(info) end
		miniwindow:setMarginTop(140)
		miniwindow:setMarginLeft(80)
		miniwindow:setHeight(32 * 6)
		miniwindow:setWidth(30 * 8)  
		miniwindow:setSize(miniwindow:getSize())
		miniwindow:setImageSize(miniwindow:getSize())
	elseif app == apps[6] then
		miniwindow:show()
		icon = g_ui.createWidget('FuncButton',miniwindow)
		icon:setId('app1')
		local pathOn = "interface/removebutton.png"
		icon:setImageSource(pathOn)
		icon:setMarginTop(110)
		icon:setMarginLeft(85)
		icon:setHeight(32)
		icon:setWidth(128)
		icon:setSize(icon:getSize())
		icon:setVisible(true)
		icon:setText('Remover Talisman')
		icon.onClick = function() removetalisman() end
		text = g_ui.createWidget('TextUI',miniwindow)
		text:setId('text1')
		text:setText('Para remover o talisman seu\npokemon deve estar para fora \nda pokebola.')
		text:setFont('sans-bold-16px')
		text:setMarginLeft(-100)
		text:setMarginTop(-35)
		text:setHeight(200)
		text:setWidth(500)
		text:setTextAlign(AlignCenter)
		returnbutton = g_ui.createWidget('FuncButton',miniwindow)
		returnbutton:setId('return')
		local pathOn = "interface/returnbutton.png"
		returnbutton:setImageSource(pathOn)
		returnbutton:setMarginTop(5)
		returnbutton:setMarginLeft(5)
		returnbutton:setVisible(true)
		returnbutton:setTooltip('Voltar')
		returnbutton:setWidth(24)
		returnbutton:setHeight(24)
		returnbutton:setSize(returnbutton:getSize())
		returnbutton.onClick = function() showApps(info) end
		miniwindow:setMarginTop(140)
		miniwindow:setMarginLeft(50)
		miniwindow:setHeight(32 * 5)
		miniwindow:setWidth(30 * 10)  
		miniwindow:setSize(miniwindow:getSize())
		miniwindow:setImageSize(miniwindow:getSize())
	end
end

function buyFood(qt, name)
  if acceptWindow then
    return true
  end
  if qt <= 0 then
	return true
  end

  local acceptFunc = function()
    g_game.talk("#buyfood "..name.."|"..qt)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Comprar comida'), tr("Voce deseja comprar "..qt.."x "..name..", isso ira custar $"..(foods[name].price * qt).."."),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function transformrotom(rotom)
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#rotomsystem "..rotom)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Transformar Rotom'), tr("Tem certeza que deseja transformar seu Rotom para a forma "..rotom.."?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function transformdeoxys(deoxys)
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#deoxyssystem "..deoxys)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Transformar Deoxys'), tr("Tem certeza que deseja transformar seu Deoxys para a forma "..deoxys.."?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function removeheld()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#removeheld")
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Remover held'), tr("Tem certeza que deseja remover o held do seu pokemon?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function removeexp()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#expshare")
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Remover exp share'), tr("Tem certeza que deseja remover o exp share do seu pokemon?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function removetalisman()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#talisman")
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Remover talisman?'), tr("Tem certeza que deseja remover o talisman de seu pokemon?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end