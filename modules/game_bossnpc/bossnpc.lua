local item = {"gholdengo", "kleavor", "wyrdeer", "ursaluna", "basculegion", "sneasler", "overqwil", "wugtrio", "farigiraf", "dudunsparce", "toedscruel", "annihilape", "clodsire", "iron bundle"} --, 
local items = {
	["kleavor"] = {name = "Ovo de Kleavor", coin = "Otherworldly Essences", price = 100, desc = "Uma evolucao do pokemon Scyther.\nNatural da regiao de Hisui.\nBug/Rock."},
	["wyrdeer"] = {name = "Ovo de Wyrdeer", coin = "Otherworldly Essences", price = 100, desc = "Uma evolucao do pokemon Stantler.\nNatural da regiao de Hisui.\nNormal/Psychic."},
	["ursaluna"] = {name = "Ovo de Ursaluna", coin = "Otherworldly Essences", price = 100, desc = "Uma evolucao do pokemon Ursaring.\nNatural da regiao de Hisui.\nGround/Normal."},
	["basculegion"] = {name = "Ovo de Basculegion", coin = "Otherworldly Essences", price = 100, desc = "Uma evolucao do pokemon Basculin.\nNatural da regiao de Hisui.\nWater/Ghost."},
	["sneasler"] = {name = "Ovo de Sneasler", coin = "Otherworldly Essences", price = 100, desc = "Uma evolucao do pokemon Sneasel.\nNatural da regiao de Hisui.\nPoison/Fighting."},
	["overqwil"] = {name = "Ovo de Overqwil", coin = "Otherworldly Essences", price = 100, desc = "Uma evolucao do pokemon Qwilfish.\nNatural da regiao de Hisui.\nDark/Poison."},
	["toedscruel"] = {name = "Ovo de Toedscruel", coin = "Otherworldly Essences", price = 200, desc = "Uma evolucao do pokemon Toedscool.\nForma regional de Tentacruel de Paldea.\nGround/Grass."},
	["wugtrio"] = {name = "Ovo de Wugtrio", coin = "Otherworldly Essences", price = 200, desc = "Uma evolucao do pokemon Wiglett.\nForma regional de Dugtrio de Paldea.\nWater."},
	["annihilape"] = {name = "Ovo de Annihilape", coin = "Otherworldly Essences", price = 200, desc = "Uma evolucao do pokemon Primeape.\nNatural da regiao de Paldea.\nFighting/Ghost."},
	["clodsire"] = {name = "Ovo de Clodsire", coin = "Otherworldly Essences", price = 200, desc = "Uma evolucao do pokemon Wooper.\nNatural da regiao de Paldea.\nPoison/Ground."},
	["farigiraf"] = {name = "Ovo de Farigiraf", coin = "Otherworldly Essences", price = 200, desc = "Uma evolucao do pokemon Girafarig.\nNatural da regiao de Paldea.\nNormal/Psychic."},
	["dudunsparce"] = {name = "Ovo de Dudunsparce", coin = "Otherworldly Essences", price = 200, desc = "Uma evolucao do pokemon Dunsparce.\nNatural da regiao de Paldea.\nNormal."},
	["iron bundle"] = {name = "Ovo de Iron Bundle", coin = "Otherworldly Essences", price = 300, desc = "Uma versao futuristica do pokemon Delibird.\nIce/Water."},
	["gholdengo"] = {name = "Ovo de Gholdengo", coin = "Crystal Coins", price = 9999, desc = "Um pokemon extremamente raro.\nDizem que este pokemon ira trazer fortunas para o jogador.\nGhost/Steel."},
}


function init()
bossnpc = g_ui.displayUI('bossnpc')

connect(g_game, 'onTextMessage', getParams)
connect(g_game, { onGameEnd = hide } )
bossnpc:hide()

ProtocolGame.registerExtendedOpcode(74, showApps)
end

function hide()
	if bossnpc:isVisible() then
	  bossnpc:hide()
		destroyApps()
	end
end

function show()
  bossnpc:show()
  bossnpc:raise()
  bossnpc:focus()
end

function showApps()
	-- destroyApps()
	bossnpc:show()
	for i = 1, #item do
		icon = g_ui.createWidget('FuncButton',bossnpc)
		icon:setId('app'..i)
		local pathOn = "interface/"..item[i]..".png"
		icon:setImageSource(pathOn)
		if i <= 7 then
			icon:setMarginTop(20)
			icon:setMarginLeft(30 + ((i-1) * 80))
			icon:setVisible(true)
		else
			icon:setMarginTop(150)
			icon:setMarginLeft(30 + ((math.fmod(i, 7)) * 80))
			icon:setVisible(true)
		end
		icon:setTooltip(items[item[i]].name.."\n"..items[item[i]].desc.."\n"..items[item[i]].price .. " " .. items[item[i]].coin.. " por ovo.")
		icon:setImageSize(icon:getSize())
		text = g_ui.createWidget('TextUI',bossnpc)
		text:setText(1)
		text:setId('text'..i)
		if i <= 7 then
			text:setMarginTop(110)
			text:setMarginLeft(65 + ((i-1) * 80))
		else
			text:setMarginTop(245)
			text:setMarginLeft(65 + (math.fmod(i, 7) * 80))
		end
		plusbutton = g_ui.createWidget('FuncButton',bossnpc)
		minusbutton = g_ui.createWidget('FuncButton',bossnpc)
		plusbutton:setId('plusbutton'..i)
		minusbutton:setId('minusbutton'..i)
		plusbutton:setWidth(24)
		minusbutton:setWidth(24)
		plusbutton:setHeight(24)
		minusbutton:setHeight(24)
		plusbutton:setSize(plusbutton:getSize())
		minusbutton:setSize(minusbutton:getSize())
		local path1 = "interface/plus.png"
		local path2 = "interface/minus.png"
		plusbutton:setImageSource(path1)
		minusbutton:setImageSource(path2)
		plusbutton:addAnchor(AnchorRight, bossnpc:recursiveGetChildById('app'..i), AnchorLeft)
		minusbutton:addAnchor(AnchorRight, bossnpc:recursiveGetChildById('app'..i), AnchorLeft)
		plusbutton:addAnchor(AnchorBottom, bossnpc:recursiveGetChildById('app'..i), AnchorTop)
		minusbutton:addAnchor(AnchorBottom, bossnpc:recursiveGetChildById('app'..i), AnchorTop)
		if i <= 7 then
			plusbutton:setMarginLeft(75 + ((i-1) * 80))
			minusbutton:setMarginLeft(38 + ((i-1) * 80))
			plusbutton:setMarginTop(105)
			minusbutton:setMarginTop(105)
		else
			plusbutton:setMarginLeft(75 + (math.fmod(i, 7) * 80))
			minusbutton:setMarginLeft(38 + (math.fmod(i, 7) * 80))
			plusbutton:setMarginTop(240)
			minusbutton:setMarginTop(240)
		end
		plusbutton.onClick = function() bossnpc:recursiveGetChildById('text'..i):setText(tonumber(bossnpc:recursiveGetChildById('text'..i):getText())+1) end
		minusbutton.onClick = function() if tonumber(bossnpc:recursiveGetChildById('text'..i):getText()) >= 2 then bossnpc:recursiveGetChildById('text'..i):setText(tonumber(bossnpc:recursiveGetChildById('text'..i):getText())-1) end end
		buy = g_ui.createWidget('FuncButton',bossnpc)
		buy:setId('buybutton'..i)
		local path1 = "interface/removebutton.png"
		buy:setImageSource(path1)
		if i <= 7 then
			buy:setMarginTop(130)
			buy:setMarginLeft(34 + ((i-1) * 80))
		else
			buy:setMarginTop(265)
			buy:setMarginLeft(34 + (math.fmod(i, 7) * 80))
		end
		buy:setWidth(70)
		buy:setHeight(24)
		buy:setSize(buy:getSize())
		buy:setText('COMPRAR')
		buy.onClick = function() buyItem(tonumber(bossnpc:recursiveGetChildById('text'..i):getText()), item[i]) end
	end
	bossnpc:setMarginTop(160)
	bossnpc:setMarginLeft(256)
	bossnpc:setHeight(62 * 5)
	bossnpc:setWidth(62 * 10)  
	bossnpc:setSize(bossnpc:getSize())
end

function destroyApps()
  for i = 1, 50 do
    if bossnpc:recursiveGetChildById('app'..i) ~= nil then
      bossnpc:recursiveGetChildById('app'..i):destroy()
	end
	if bossnpc:recursiveGetChildById('text'..i) ~= nil then
      bossnpc:recursiveGetChildById('text'..i):destroy()
	end
	if bossnpc:recursiveGetChildById('minusbutton'..i) ~= nil then
      bossnpc:recursiveGetChildById('minusbutton'..i):destroy()
    end
	if bossnpc:recursiveGetChildById('plusbutton'..i) ~= nil then
      bossnpc:recursiveGetChildById('plusbutton'..i):destroy()
    end
	if bossnpc:recursiveGetChildById('buybutton'..i) ~= nil then
      bossnpc:recursiveGetChildById('buybutton'..i):destroy()
    end
  end
  if bossnpc:recursiveGetChildById('miniwindow') ~= nil then
    bossnpc:recursiveGetChildById('miniwindow'):hide()
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
    g_game.talk("#bossnpcitem "..name.."|"..qt)
	hide()
	destroyApps()
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Egg Breeder'), tr("Voce deseja comprar "..qt.."x "..name..", isso ira custar "..(items[name].price * qt).. " " ..(items[name].coin).."."),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end