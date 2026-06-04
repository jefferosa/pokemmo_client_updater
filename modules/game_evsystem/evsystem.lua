local evs = {}
local ev = {"EV HP: ", "EV ATK: ", "EV DEF: ", "EV PTS: "}
		
function parse(protocol, opcode, buffer)
	for match in string.gmatch(buffer, "([^,]+),%s*") do
		evs[#evs + 1] = match
	end
	evsystem:show()
	showEvs(evs)
end

function init()
evsystem = g_ui.displayUI('evsystem')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
evsystem:hide()

ProtocolGame.registerExtendedOpcode(65, parse)
end

function hide()
	evs = {}
	if evsystem:isVisible() then
	  evsystem:hide()
	end
end

function show()
  evsystem:show()
  evsystem:raise()
  evsystem:focus()
end

function destroyApps()
	for i = 1, 5 do
		if evsystem:recursiveGetChildById('ev'..i) ~= nil then evsystem:recursiveGetChildById('ev'..i):destroy() end
		if evsystem:recursiveGetChildById('text'..i) ~= nil then evsystem:recursiveGetChildById('text'..i):destroy() end
		if evsystem:recursiveGetChildById('plusbutton'..i) ~= nil then evsystem:recursiveGetChildById('plusbutton'..i):destroy() end
		if evsystem:recursiveGetChildById('minusbutton'..i) ~= nil then evsystem:recursiveGetChildById('minusbutton'..i):destroy() end
		if evsystem:recursiveGetChildById('buybutton'..i) ~= nil then evsystem:recursiveGetChildById('buybutton'..i):destroy() end
	end
end

function showEvs(evs)
	destroyApps()
	for i = 1, 3 do
		icon = g_ui.createWidget('TextUI',evsystem)
		icon:setId('ev'..i)
		icon:setText(ev[i])
		-- icon:setFont('sans-bold-16px')
		icon:setMarginLeft(15)
		icon:setMarginTop(35 + ((math.fmod(i-1, 3)) * 24))
		-- icon:setTextAlign(AlignCenter)
		icon:setWidth(75)
		icon:setPhantom(true)
		text = g_ui.createWidget('TextUI',evsystem)
		text:setId('text'..i)
		text:setText(evs[i])
		text:setWidth(75)
		text:setMarginLeft(80)
		text:setMarginTop(35 + ((math.fmod(i-1, 3)) * 24))
		text:setPhantom(true)
		plusbutton = g_ui.createWidget('TMButton',evsystem)
		minusbutton = g_ui.createWidget('TMButton',evsystem)
		plusbutton:setId('plusbutton'..i)
		minusbutton:setId('minusbutton'..i)
		plusbutton:rotate(180)
		plusbutton:setWidth(16)
		minusbutton:setWidth(16)
		plusbutton:setHeight(16)
		minusbutton:setHeight(16)
		plusbutton:setSize(plusbutton:getSize())
		minusbutton:setSize(minusbutton:getSize())
		local path2 = "interface/returnbutton.png"
		plusbutton:setImageSource(path2)
		minusbutton:setImageSource(path2)
		plusbutton:setImageSize(plusbutton:getSize())
		minusbutton:setImageSize(minusbutton:getSize())
		plusbutton:addAnchor(AnchorRight, evsystem:recursiveGetChildById('text'..i), AnchorLeft)
		minusbutton:addAnchor(AnchorRight, evsystem:recursiveGetChildById('text'..i), AnchorLeft)
		plusbutton:addAnchor(AnchorBottom, evsystem:recursiveGetChildById('text'..i), AnchorTop)
		minusbutton:addAnchor(AnchorBottom, evsystem:recursiveGetChildById('text'..i), AnchorTop)
		plusbutton:setMarginLeft(100)
		minusbutton:setMarginLeft(60)
		plusbutton:setMarginTop(35 + ((i-1) * 24))
		minusbutton:setMarginTop(33 + ((i-1) * 24))
		plusbutton.onClick = function() if tonumber(evsystem:recursiveGetChildById('text4'):getText()) >= 1 and tonumber(evsystem:recursiveGetChildById('text'..i):getText()) < 150 then evsystem:recursiveGetChildById('text'..i):setText(tonumber(evsystem:recursiveGetChildById('text'..i):getText())+1)	evsystem:recursiveGetChildById('text4'):setText(tonumber(evsystem:recursiveGetChildById('text4'):getText())-1) end end
		minusbutton.onClick = function() if tonumber(evsystem:recursiveGetChildById('text'..i):getText()) > tonumber(evs[i]) then evsystem:recursiveGetChildById('text'..i):setText(tonumber(evsystem:recursiveGetChildById('text'..i):getText())-1) evsystem:recursiveGetChildById('text4'):setText(tonumber(evsystem:recursiveGetChildById('text4'):getText())+1) end end
	end
	icon = g_ui.createWidget('TextUI',evsystem)
	icon:setId('ev4')
	icon:setText(ev[4])
	icon:setWidth(75)
	icon:setMarginLeft(37)
	icon:setMarginTop(10 + (4 * 24))
	icon:setPhantom(true)
	text = g_ui.createWidget('TextUI',evsystem)
	text:setId('text4')
	text:setText(evs[4])
	text:setMarginLeft(82)
	text:setMarginTop(10 + (4 * 24))
	text:setPhantom(true)
	buy = g_ui.createWidget('TMButton',evsystem)
	buy:setId('buybutton4')
	local path = "interface/button.png"
	buy:setImageSource(path)
	buy:setMarginTop(120)
	buy:setMarginLeft(35)
	buy:setWidth(68)
	buy:setHeight(22)
	buy:setSize(buy:getSize())
	buy:setImageSize(buy:getSize())
	buy:setText('CONFIRM')
	buy:setVisible(true)
	buy.onClick = function() sendEvs(tonumber(evsystem:recursiveGetChildById('text1'):getText()), tonumber(evsystem:recursiveGetChildById('text2'):getText()), tonumber(evsystem:recursiveGetChildById('text3'):getText()), tonumber(evsystem:recursiveGetChildById('text4'):getText()), evs[5]) end
	evsystem:recursiveGetChildById('returnbutton'):hide()
	evsystem:setHeight(150)
	evsystem:setWidth(130) 
end

function sendEvs(evhp, evatk, evdef, evpts, name)
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#evsystem "..evhp.."|"..evatk.."|"..evdef.."|"..evpts.."|"..name)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Atribuir EVs'), tr("Voce deseja adicionar ao seu "..name..":\n"..(evhp - evs[1]).." pontos em HP\n"..(evatk - evs[2]).." pontos em ATK\n"..(evdef - evs[3]).." pontos em DEF\nVoce vai gastar: "..(evs[4] - evpts).." pontos."),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end