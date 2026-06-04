local dungeons = {"mew dungeon", "celebi dungeon", "jirachi dungeon", "deoxys dungeon", "darkrai dungeon", "shaymin dungeon", "arceus dungeon", "victini dungeon", "keldeo dungeon", "meloetta dungeon", "genesect dungeon", "diancie dungeon", "hoopa dungeon", "volcanion dungeon", "magearna dungeon", "marshadow dungeon", "zeraora dungeon", "melmetal dungeon", "zarude dungeon"}
local price = {
	["mew dungeon"] = 100,
	["celebi dungeon"] = 100,
	["jirachi dungeon"] = 100,
	["deoxys dungeon"] = 200,
	["darkrai dungeon"] = 300,
	["shaymin dungeon"] = 150,
	["arceus dungeon"] = 300,
	["victini dungeon"] = 100,
	["keldeo dungeon"] = 100,
	["meloetta dungeon"] = 150,
	["genesect dungeon"] = 200,
	["diancie dungeon"] = 300,
	["hoopa dungeon"] = 300,
	["volcanion dungeon"] = 300,
	["magearna dungeon"] = 300,
	["marshadow dungeon"] = 100,
	["zeraora dungeon"] = 100,
	["melmetal dungeon"] = 100,
	["zarude dungeon"] = 300,
}
function init()
dungeonsystem = g_ui.displayUI('dungeonsystem')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
dungeonsystem:hide()

ProtocolGame.registerExtendedOpcode(71, function(protocol, opcode, buffer) parse(buffer) end)
end

function parse(buffer)
	dungeonsystem:show()
	showDungeons(1)	
end

function hide()
	if dungeonsystem:isVisible() then
	  dungeonsystem:hide()
	end
	destroyApps()
end

function show()
  dungeonsystem:show()
  dungeonsystem:raise()
  dungeonsystem:focus()
  showDungeons()
end

function showDungeons(page)
	destroyApps()
	local thispage = 4 * page
	local showdgs = thispage
	if #dungeons < thispage then
		showdgs = #dungeons
	end
	for i = thispage - 3, showdgs do
		dungeonicon = g_ui.createWidget('DungeonButton',dungeonsystem)
		dungeonicon:setId('dungeonicon'..math.fmod(i-1, 4)+1)
		local pathOn = "interface/"..dungeons[i]:lower()..".png"
		dungeonicon:setImageSource(pathOn)
		dungeonicon:setWidth(310)
		dungeonicon:setHeight(110)
		dungeonicon:setMarginLeft(25)
		dungeonicon:setMarginTop(25 + ((math.fmod(i-1, 4)) * 110))
		dungeonicon:setVisible(true)
		dungeonicon:setFocusable(true)
		dungeonicon.onClick = function() showInfo(dungeons[i]) end
	end
	closebutton = g_ui.createWidget('DungeonButton',dungeonsystem)
	closebutton:setId('button3')
	local pathOn = "interface/close.png"
	closebutton:setImageSource(pathOn)
	closebutton:setWidth(112)
	closebutton:setHeight(56)
	closebutton:setMarginLeft(227)
	closebutton:removeAnchor(AnchorTop)
	closebutton:addAnchor(AnchorBottom, 'parent', AnchorBottom)
	closebutton:setMarginBottom(15)
	closebutton:setVisible(true)
	closebutton:setFocusable(true)
	closebutton.onClick = function() destroyApps() hide() end
	lastbutton = g_ui.createWidget('DungeonButton',dungeonsystem)
	lastbutton:setId('button1')
	local pathOn = "interface/last.png"
	lastbutton:setImageSource(pathOn)
	lastbutton:setWidth(112)
	lastbutton:setHeight(56)
	lastbutton:setMarginLeft(32)
	lastbutton:removeAnchor(AnchorTop)
	lastbutton:addAnchor(AnchorBottom, 'parent', AnchorBottom)
	lastbutton:setMarginBottom(15)
	lastbutton:setVisible(true)
	lastbutton:setFocusable(false)
	if page ~= 1 then lastbutton.onClick = function() showDungeons(page - 1) end end
	nextbutton = g_ui.createWidget('DungeonButton',dungeonsystem)
	nextbutton:setId('button2')
	local pathOn = "interface/next.png"
	nextbutton:setImageSource(pathOn)
	nextbutton:setWidth(112)
	nextbutton:setHeight(56)
	nextbutton:setMarginLeft(129)
	nextbutton:removeAnchor(AnchorTop)
	nextbutton:addAnchor(AnchorBottom, 'parent', AnchorBottom)
	nextbutton:setMarginBottom(15)
	nextbutton:setVisible(true)
	nextbutton:setFocusable(false)
	if page * 4 < #dungeons then nextbutton.onClick = function() showDungeons(page + 1) end end
end

function showInfo(dungeon)
	destroyApps()
	dungeonicon = g_ui.createWidget('DungeonButton',dungeonsystem)
	dungeonicon:setId('info')
	local pathOn = "interface/"..dungeon.." info.png"
	dungeonicon:setImageSource(pathOn)
	dungeonicon:setWidth(325)
	dungeonicon:setHeight(450)
	dungeonicon:setMarginLeft(20)
	dungeonicon:setMarginTop(25)
	dungeonicon:setVisible(true)
	dungeonicon:setPhantom(true)
	solobutton = g_ui.createWidget('DungeonButton',dungeonsystem)
	solobutton:setId('button1')
	local pathOn = "interface/solo.png"
	solobutton:setImageSource(pathOn)
	solobutton:setWidth(112)
	solobutton:setHeight(56)
	solobutton:setMarginLeft(80)
	solobutton:removeAnchor(AnchorTop)
	solobutton:addAnchor(AnchorBottom, 'parent', AnchorBottom)
	solobutton:setMarginBottom(28)
	solobutton:setVisible(true)
	solobutton:setFocusable(true)
	solobutton.onClick = function() sendInfo(dungeon, 1) end
	closebutton = g_ui.createWidget('DungeonButton',dungeonsystem)
	closebutton:setId('button2')
	local pathOn = "interface/close.png"
	closebutton:setImageSource(pathOn)
	closebutton:setWidth(112)
	closebutton:setHeight(56)
	closebutton:setMarginLeft(170)
	closebutton:removeAnchor(AnchorTop)
	closebutton:addAnchor(AnchorBottom, 'parent', AnchorBottom)
	closebutton:setMarginBottom(28)
	closebutton:setVisible(true)
	closebutton:setFocusable(true)
	closebutton.onClick = function() destroyApps() hide() end
end

function destroyApps()
  for i = 1, 4 do
    if dungeonsystem:recursiveGetChildById('dungeonicon'..i) == nil then break end
    dungeonsystem:recursiveGetChildById('dungeonicon'..i):destroy()
  end
  for i = 1, 1 do
    if dungeonsystem:recursiveGetChildById('info') == nil then break end
    dungeonsystem:recursiveGetChildById('info'):destroy()
  end
  for i = 1, 5 do
    if dungeonsystem:recursiveGetChildById('button'..i) == nil then break end
    dungeonsystem:recursiveGetChildById('button'..i):destroy()
  end
end

function sendInfo(dungeon, size)
	  if sendWindow then
		return true
	  end

	  local yesFunc = function() g_game.talk("#dungeonsystem "..dungeon.."|"..size) destroyApps() hide() sendWindow:destroy() sendWindow = nil end
	  local noFunc = function() sendWindow:destroy() sendWindow = nil end

	  sendWindow = displayGeneralBox(tr('Entrar na dungeon?'), tr("Voce deseja entrar na dungeon?\nCada pessoa do grupo deve ter "..price[dungeon].." tokens."),
	  { { text=tr('Yes'), callback=yesFunc },
		{ text=tr('No'), callback=noFunc },
		anchor=AnchorHorizontalCenter }, yesFunc, noFunc)
end
