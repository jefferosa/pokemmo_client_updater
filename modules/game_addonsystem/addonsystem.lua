local addons = {}
		
function parse(protocol, opcode, buffer)
	for match in string.gmatch(buffer, "([^,]+),%s*") do
		addons[#addons + 1] = match
	end
	addonsystem:show()
	showAddons(addons)
end

function init()
addonsystem = g_ui.displayUI('addonsystem')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
addonsystem:hide()

ProtocolGame.registerExtendedOpcode(63, parse)
end

function hide()
	addons = {}
	if addonsystem:isVisible() then
	  addonsystem:hide()
	end
end

function show()
  addonsystem:show()
  addonsystem:raise()
  addonsystem:focus()
end

function destroyApps()
	for i = 1, 10 do
		if addonsystem:recursiveGetChildById('addon'..i) ~= nil then addonsystem:recursiveGetChildById('addon'..i):destroy() end
	end
end

function showAddons(addons)
	destroyApps()
	local height = 1
	local width = 1
	for i = 1, #addons do
		icon = g_ui.createWidget('Addon',addonsystem)
		icon:setId('addon'..i)
		icon:setOutfit({type = tonumber(addons[i])})
		icon:setMarginLeft(25)
		icon:setMarginTop(34)
		icon:setVisible(true)
		if i <= 4 then
			icon:setMarginLeft(20 + ((math.fmod(i-1, 4)) * 68))
			icon:setMarginTop(34)
			height = 50 + 64
			width = (50 + ((math.fmod(i-1, 4)) * 64)) + 75
		elseif i > 4 and i <= 8 then
			icon:setMarginLeft(20 + ((math.fmod(i-1, 4)) * 68))
			icon:setMarginTop(68)
			height = 50 + 64
			width = 50 + (4 * 64) + 75
		elseif i > 8 and i <= 12 then
			icon:setMarginLeft(20 + ((math.fmod(i-1, 4)) * 68))
			icon:setMarginTop(102)
			height = 50 + 96
			width = 50 + (4 * 64) + 75
		elseif i > 12 and i <= 16 then
			icon:setMarginLeft(20 + ((math.fmod(i-1, 4)) * 68))
			icon:setMarginTop(136)
			height = 50 + 128
			width = 50 + (4 * 64) + 75
		elseif i > 16 and i <= 20 then
			icon:setMarginLeft(20 + ((math.fmod(i-1, 4)) * 68))
			icon:setMarginTop(170)
			height = 50 + 160
			width = 50 + (4 * 64) + 75
		elseif i > 20 and i <= 24 then
			icon:setMarginLeft(20 + ((math.fmod(i-1, 4)) * 68))
			icon:setMarginTop(204)
			height = 50 + 192
			width = 50 + (4 * 64) + 75
		end
		icon.onClick = function() changeAddon(addons[i]) end
	end
	addonsystem:setHeight(height)
	addonsystem:setWidth(width) 
end

function changeAddon(addonid)
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk("#addonsystem "..addonid)
	
	destroyApps()
	hide()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Addons'), tr("Deseja mudar o Addon do seu pokemon?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end