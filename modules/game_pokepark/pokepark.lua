local pokes = {
	["Milotic"] = 250,
	["Wailord"] = 250,
	["Hippowdon"] = 100,
	["Garchomp"] = 250,
	["Rampardos"] = 225,
	["Bastiodon"] = 225,
	["Rhyperior"] = 250,
	["Drapion"] = 200,
	["Flygon"] = 175,
	["Gliscor"] = 125,
	["Cradily"] = 100,
	["Armaldo"] = 100,
	["Vespiquen"] = 125,
	["Kricketune"] = 25,
	["Yanmega"] = 100,
	["Pachirisu"] = 50,
	["Roserade"] = 85,
	["Kecleon"] = 75,
	["Cherrim"] = 50,
	["Lopunny"] = 75,
	["Beautifly"] = 50,
	["Tropius"] = 125,
	["Breloom"] = 75,
	["Dustox"] = 50,
	["Toxicroak"] = 185,
	["Carnivine"] = 70,
	["Shiftry"] = 125,
	["Seviper"] = 75,
	["Tangrowth"] = 250,
	["Mothim"] = 65,
	["Pelipper"] = 120,
	["Ludicolo"] = 175,
	["Drifblim"] = 175,
}
		
local buyable = {}
		
function parse(protocol, opcode, buffer)
	buyable = {}
	for match in string.gmatch(buffer, "([^,]+),%s*") do
		buyable[#buyable + 1] = match
	end
	pokepark:show()
	showPokes(buyable)
end

function init()
pokepark = g_ui.displayUI('pokepark')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
pokepark:hide()

ProtocolGame.registerExtendedOpcode(64, parse)
end

function hide()
	buyable = {}
	if pokepark:isVisible() then
	  pokepark:hide()
	end
end

function show()
  pokepark:show()
  pokepark:raise()
  pokepark:focus()
end

function destroyApps()
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('poke'..i) ~= nil then pokepark:recursiveGetChildById('poke'..i):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('bg'..i) ~= nil then pokepark:recursiveGetChildById('bg'..i):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('func'..i) ~= nil then pokepark:recursiveGetChildById('func'..i):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('text'..i) ~= nil then pokepark:recursiveGetChildById('text'..i):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('plusbutton'..i) ~= nil then pokepark:recursiveGetChildById('plusbutton'..i):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('minusbutton'..i) ~= nil then pokepark:recursiveGetChildById('minusbutton'..i):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('buyprice1') ~= nil then pokepark:recursiveGetChildById('buyprice1'):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('buyprice2') ~= nil then pokepark:recursiveGetChildById('buyprice2'):destroy() end
	end
	for i = 1, 50 do
		if pokepark:recursiveGetChildById('buybutton') ~= nil then pokepark:recursiveGetChildById('buybutton'):destroy() end
	end
end

function showPokes(buyable)
	destroyApps()
	local height = 1
	local width = 1
	for i = 1, #buyable do
		bg = g_ui.createWidget('TMButton',pokepark)
		bg:setId('bg'..i)
		local pathBG = "/images/ui/textedit.png"
		bg:setImageSource(pathBG)
		icon = g_ui.createWidget('TMButton',pokepark)
		icon:setId('poke'..i)
		local pathOn = "interface/"..buyable[i]:lower()..".png"
		icon:setImageSource(pathOn)
		if i <= 8 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(34)
			bg:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			bg:setMarginTop(36)
			height = 50 + 32
			width = (25 + ((math.fmod(i-1, 8)) * 36)) + 55
		elseif i > 8 and i <= 16 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(68)
			bg:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			bg:setMarginTop(70)
			height = 50 + 64
			width = 25 + (8 * 36) + 25
		elseif i > 16 and i <= 24 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(102)
			bg:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			bg:setMarginTop(104)
			height = 50 + 96
			width = 25 + (8 * 36) + 25
		elseif i > 24 and i <= 32 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(136)
			bg:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			bg:setMarginTop(138)
			height = 50 + 128
			width = 25 + (8 * 36) + 25
		elseif i > 32 and i <= 40 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(170)
			bg:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			bg:setMarginTop(172)
			height = 50 + 160
			width = 25 + (8 * 36) + 25
		elseif i > 40 and i <= 48 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(204)
			bg:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			bg:setMarginTop(206)
			height = 50 + 192
			width = 25 + (8 * 36) + 25
		end
		icon:setTooltip(buyable[i])
		bg:setPhantom(true)
		icon.onClick = function() showOpt(buyable[i]) end
	end
	pokepark:recursiveGetChildById('returnbutton'):hide()
	pokepark:setHeight(height)
	pokepark:setWidth(width) 
	pokepark:setSize(pokepark:getSize())
	pokepark:setImageSize(pokepark:getSize())
end

function showOpt(pokename)
	destroyApps()
	local options = {"Level", "Tera"}
	if pokename == "Garchomp" or pokename == "Lopunny" then	table.insert(options, "Mega") end
	icon = g_ui.createWidget('TMButton',pokepark)
	icon:setId('poke1')
	local pathOn = "interface/"..pokename..".png"
	icon:setImageSource(pathOn)
	icon:setMarginTop(30)
	local width
	if #options == 2 then
		icon:setMarginLeft(80)
	else
		icon:setMarginLeft(115)
	end
	icon:setVisible(true)
	icon:setTooltip(pokename)
	for i = 1, #options do
		func = g_ui.createWidget('TextUI',pokepark)
		func:setText(options[i])
		func:setId('func'..i)
		text = g_ui.createWidget('TextUI',pokepark)
		text:setId('text'..i)
		plusbutton = g_ui.createWidget('TMButton',pokepark)
		minusbutton = g_ui.createWidget('TMButton',pokepark)
		plusbutton:setId('plusbutton'..i)
		minusbutton:setId('minusbutton'..i)
		plusbutton:rotate(180)
		plusbutton:setWidth(16)
		minusbutton:setWidth(16)
		plusbutton:setHeight(16)
		minusbutton:setHeight(16)
		plusbutton:setSize(plusbutton:getSize())
		minusbutton:setSize(minusbutton:getSize())
		plusbutton:setImageSize(plusbutton:getSize())
		minusbutton:setImageSize(minusbutton:getSize())
		pathOn = "interface/returnbutton.png"
		plusbutton:setImageSource(pathOn)
		minusbutton:setImageSource(pathOn)
		plusbutton:addAnchor(AnchorRight, pokepark:recursiveGetChildById('app'..i), AnchorLeft)
		minusbutton:addAnchor(AnchorRight, pokepark:recursiveGetChildById('app'..i), AnchorLeft)
		plusbutton:addAnchor(AnchorBottom, pokepark:recursiveGetChildById('app'..i), AnchorTop)
		minusbutton:addAnchor(AnchorBottom, pokepark:recursiveGetChildById('app'..i), AnchorTop)
		func:setMarginTop(68)
			func:setMarginLeft(51 + ((i-1) * 64))
			func:setWidth(30)
			text:setMarginTop(85)
			text:setMarginLeft(61 + ((i-1) * 64))
			plusbutton:setMarginLeft(80 + ((i-1) * 64))
			minusbutton:setMarginLeft(40 + ((i-1) * 64))
			plusbutton:setMarginTop(85)
			minusbutton:setMarginTop(83)
		if i == 1 then
			text:setText(1)
			plusbutton.onClick = function() if tonumber(pokepark:recursiveGetChildById('text'..i):getText()) <= 49 then pokepark:recursiveGetChildById('text'..i):setText(tonumber(pokepark:recursiveGetChildById('text'..i):getText())+1) pokepark:recursiveGetChildById('buyprice2'):setText(tonumber(pokepark:recursiveGetChildById('buyprice2'):getText())+2) end end
			minusbutton.onClick = function() if tonumber(pokepark:recursiveGetChildById('text'..i):getText()) >= 2 then pokepark:recursiveGetChildById('text'..i):setText(tonumber(pokepark:recursiveGetChildById('text'..i):getText())-1) pokepark:recursiveGetChildById('buyprice2'):setText(tonumber(pokepark:recursiveGetChildById('buyprice2'):getText())-2) end end
		else
			text:setText("NO")
			text:setMarginLeft(59 + ((i-1) * 64))
			text:setWidth(30)
			plusbutton.onClick = function() if pokepark:recursiveGetChildById('text'..i):getText() == "YES" then pokepark:recursiveGetChildById('text'..i):setText("NO") pokepark:recursiveGetChildById('buyprice2'):setText(tonumber(pokepark:recursiveGetChildById('buyprice2'):getText())-500) else pokepark:recursiveGetChildById('text'..i):setText("YES") pokepark:recursiveGetChildById('buyprice2'):setText(tonumber(pokepark:recursiveGetChildById('buyprice2'):getText())+500) end end
			minusbutton.onClick = function() if pokepark:recursiveGetChildById('text'..i):getText() == "YES" then pokepark:recursiveGetChildById('text'..i):setText("NO") pokepark:recursiveGetChildById('buyprice2'):setText(tonumber(pokepark:recursiveGetChildById('buyprice2'):getText())-500) else pokepark:recursiveGetChildById('text'..i):setText("YES") pokepark:recursiveGetChildById('buyprice2'):setText(tonumber(pokepark:recursiveGetChildById('buyprice2'):getText())+500) end end
			width = (80 * i) + 30
		end
		if i == 1 then
			plusbutton:setTooltip('Level que deseja no pokemon.')
			minusbutton:setTooltip('Level que deseja no pokemon.')
		elseif i == 2 then
			plusbutton:setTooltip('Deseja que ele venha com algum Tera Type aleatorio?')
			minusbutton:setTooltip('Deseja que ele venha com algum Tera Type aleatorio?')
		elseif i == 3 then
			plusbutton:setTooltip('Deseja que seja Mega?')
			minusbutton:setTooltip('Deseja que seja Mega?')
		end
	end
	
	buy = g_ui.createWidget('TMButton',pokepark)
	buy:setId('buybutton')
	local path1 = "interface/removebutton.png"
	buy:setImageSource(path1)
	buy:setMarginTop(129)
	if width > 190 then buy:setMarginLeft(115) else buy:setMarginLeft(80) end	
	buy:setWidth(32)
	buy:setHeight(24)
	buy:setSize(buy:getSize())
	buy:setImageSize(buy:getSize())
	buy:setText('BUY')
	text = g_ui.createWidget('TextUI',pokepark)
	text:setId('buyprice1')
	text:setMarginTop(111)
	if width > 190 then text:setMarginLeft(116) else text:setMarginLeft(81) end	
	text:setText("PRICE")
	text:setWidth(30)
	text = g_ui.createWidget('TextUI',pokepark)
	text:setId('buyprice2')
	text:setMarginTop(122)
	if width > 190 then text:setMarginLeft(120) else text:setMarginLeft(85) end	
	text:setText(pokes[pokename])
	text:setWidth(30)
	if pokepark:recursiveGetChildById('text3') then
		buy.onClick = function() buyPoke(pokename, pokepark:recursiveGetChildById('text1'):getText(), pokepark:recursiveGetChildById('text2'):getText(), pokepark:recursiveGetChildById('text3'):getText(), pokepark:recursiveGetChildById('buyprice2'):getText()) end
	else
		buy.onClick = function() buyPoke(pokename, pokepark:recursiveGetChildById('text1'):getText(), pokepark:recursiveGetChildById('text2'):getText(), 0, pokepark:recursiveGetChildById('buyprice2'):getText()) end
	end
	local returnbutton = pokepark:recursiveGetChildById('returnbutton')
	returnbutton:show()
	returnbutton.onClick = function() showPokes(buyable) end
	pokepark:setHeight(160)
	pokepark:setWidth(width) 
	pokepark:setSize(pokepark:getSize())
	pokepark:setImageSize(pokepark:getSize())
end

function buyPoke(name, level, tera, mega, price)
  if acceptWindow then
    return true
  end
  if tera == "YES" then tera = 1 else tera = 0 end
  if mega == "YES" then mega = 1 else mega = 0 end
  local acceptFunc = function()
    g_game.talk("#pokepark "..name.."|"..level.."|"..tera.."|"..mega.."|"..price)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('PokePark Shop'), tr("Deseja comprar o pokemon: "..name.."?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end