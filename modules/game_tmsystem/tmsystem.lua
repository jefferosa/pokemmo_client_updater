local learnable = {}
local cd = {}
local quantity = {}
local target = {}
local range = {}
local element = {}
local nivel = {}
local tipo = {}

function parse(protocol, opcode, buffer)
	local counter = -1
	for match in string.gmatch(buffer, "([^|]+)") do
		counter = counter + 1
		if math.fmod(counter, 7) == 0 then
			learnable[#learnable + 1] = match
		elseif math.fmod(counter, 7) == 1 then
			cd[#cd + 1] = match
		elseif math.fmod(counter, 7) == 2 then
			quantity[#quantity + 1] = match
		elseif math.fmod(counter, 7) == 3 then
			target[#target + 1] = match
		elseif math.fmod(counter, 7) == 4 then
			range[#range + 1] = match
		elseif math.fmod(counter, 7) == 5 then
			nivel[#nivel + 1] = match
		elseif math.fmod(counter, 7) == 6 then
			tipo[#tipo + 1] = match
		end
	end
	tmsystem:show()
	showTms(learnable)
end

function init()
tmsystem = g_ui.displayUI('tmsystem')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
tmsystem:hide()

ProtocolGame.registerExtendedOpcode(66, parse)
end

function hide()
	learnable = {}
	cd = {}
	quantity = {}
	target = {}
	range = {}
	element = {}
	nivel = {}
	tipo = {}
	if tmsystem:isVisible() then
	  tmsystem:hide()
	end
end

function show()
  tmsystem:show()
  tmsystem:raise()
  tmsystem:focus()
end

function destroyApps()
	for i = 1, 50 do
		if tmsystem:recursiveGetChildById('tm'..i) ~= nil then tmsystem:recursiveGetChildById('tm'..i):destroy() end
	end
	for i = 1, 50 do
		if tmsystem:recursiveGetChildById('m'..i) ~= nil then tmsystem:recursiveGetChildById('m'..i):destroy() end
	end
end

function showTms(tmtable)
	destroyApps()
	local height = 1
	local width = 1
	for i = 1, #tmtable do
		icon = g_ui.createWidget('TMButton',tmsystem)
		icon:setId('tm'..i)
		local pathOn = "interface/"..(tipo[i]:lower())..".png"
		icon:setImageSource(pathOn)
		if i <= 8 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(34)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = (25 + ((math.fmod(i-1, 8)) * 36)) + 55
		elseif i > 8 and i <= 16 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(68)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 16 and i <= 24 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(102)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 24 and i <= 32 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(136)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 32 and i <= 40 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(170)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 40 and i <= 48 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(204)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 48 and i <= 56 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(238)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 56 and i <= 64 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(272)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 64 and i <= 72 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(306)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 72 and i <= 80 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(340)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 80 and i <= 88 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(374)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 88 and i <= 96 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(408)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		elseif i > 96 and i <= 104 then
			icon:setMarginLeft(25 + ((math.fmod(i-1, 8)) * 36))
			icon:setMarginTop(442)
			height = 50 + (32 * math.ceil(i / 8)) + 32
			width = 25 + (8 * 36) + 25
		end
		local move = tmtable[i]
		local stg = 'Nome: '..move..'\nLevel: '..nivel[i]..'\nCooldown: '..(tonumber(cd[i]) / 1000).."s"
		if target[i] ~= "0" then
			stg = stg..'\nTarget: Sim'
		end
		if range[i] ~= "0" then
			stg = stg..'\nRange: '..range[i]
		end
		stg = stg..'\nTipo: '..tipo[i]..'\nCusto: '..quantity[i]
		icon:setTooltip(stg)
		icon.onClick = function() showSlots(tmtable[i]) end
	end
	tmsystem:recursiveGetChildById('returnbutton'):hide()
	tmsystem:setHeight(height)
	tmsystem:setWidth(width) 
end

function showSlots(tmid)
	destroyApps()
	local height = 1
	local width = 1
	for i = 1, 12 do
		icon = g_ui.createWidget('TMButton',tmsystem)
		icon:setId('m'..i)
		local pathOn = "interface/m"..i..".png"
		icon:setImageSource(pathOn)
		icon:setHeight(42)
		icon:setWidth(42) 
		icon:setImageSize(icon:getSize())
		if i <= 4 then
			icon:setMarginLeft(15 + ((math.fmod(i-1, 4)) * 50))
			icon:setMarginTop(30)
			height = 30 + 60
			width = (25 + ((math.fmod(i-1, 4)) * 50)) + 50
		elseif i > 4 and i <= 8 then
			icon:setMarginLeft(15 + ((math.fmod(i-1, 4)) * 50))
			icon:setMarginTop(75)
			height = 75 + 60
			width = (25 + ((math.fmod(i-1, 4)) * 50)) + 50
		elseif i > 8 and i <= 12 then
			icon:setMarginLeft(15 + ((math.fmod(i-1, 4)) * 50))
			icon:setMarginTop(120)
			height = 120 + 60
			width = (25 + ((math.fmod(i-1, 4)) * 50)) + 50
		end
		icon.onClick = function() acceptTm(tmid, i) end
	end
	local returnbutton = tmsystem:recursiveGetChildById('returnbutton')
	returnbutton:show()
	returnbutton.onClick = function() showTms(learnable) end
	tmsystem:setHeight(height)
	tmsystem:setWidth(width) 
end

function acceptTm(tmid, slot)
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#tmsystem "..tmid.."|"..slot)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Ensinar TM'), tr("Voce deseja ensinar o TM "..tmid.." no slot M"..slot.."?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end