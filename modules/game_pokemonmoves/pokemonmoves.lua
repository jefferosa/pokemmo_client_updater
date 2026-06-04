-- spell bar by Pota based on draky's

local spelltoicon = {
	["hyperspace fury"] = "dark.png",
	["hyperspace hole"] = "psychic.png",
	["false surrender"] = "dark.png",
	["foul play"] = "dark.png",
	["torment"] = "dark.png",
	["aromatic mist"] = "fairy.png",
	["diamond storm"] = "rock.png",
	["make it rain"] = "steel.png",
	["rage fist"] = "ghost.png",
	["karate chop"] = "fighting.png",
	["barb barrage"] = "poison.png",
	["dire claw"] = "poison.png",
	["stone axe"] = "rock.png",
	["dragon darts"] = "dragon.png",
	["pyro ball"] = "fire.png",
	["double slap"] = "normal.png",
	["mirror shot"] = "steel.png",
	["gear grind"] = "steel.png",
	["shift gear"] = "steel.png",
	["signal beam"] = "bug.png",
	["spider web"] = "bug.png",
	["steamroller"] = "bug.png",
	["night daze"] = "dark.png",
	["mountain gale"] = "ice.png",
	["meteor assault"] = "fighting.png",
	["strange steam"] = "fairy.png",
	["shadow bone"] = "ghost.png",
	["testmove"] = "psychic.png",
	["psybeam"] = "psychic.png",
	["disable"] = "normal.png",
	["poison fang"] = "poison.png",
	["quiver dance"] = "bug.png",
	["petal dance"] = "grass.png",
	["vine whip"] = "grass.png",
	["seed bomb"] = "grass.png",
	["spark"] = "electric.png",
	["screech"] = "normal.png",
	["charge beam"] = "electric.png",
	["electro ball"] = "electric.png",
	["incinerate"] = "fire.png",
	["flamethrower"] = "fire.png",
	["will-o-wisp"] = "ghost.png",
	["fire spin"] = "fire.png",
	["body slam"] = "normal.png",
	["play rough"] = "fairy.png",
	["hyper voice"] = "normal.png",
	["disarming voice"] = "fairy.png",
	["echoed voice"] = "normal.png",
	["round"] = "normal.png",
	["charge"] = "electric.png",
	["ancient power"] = "rock.png",
	["discharge"] = "electric.png",
	["thunder"] = "electric.png",
	["zap cannon"] = "electric.png",
	["drill peck"] = "flying.png",
	["detect"] = "fighting.png",
	["roost"] = "flying.png",
	["sky attack"] = "flying.png",
	["thunderbolt"] = "electric.png",
	["thunder wave"] = "electric.png",
	["supersonic"] = "normal.png",
	["absorb"] = "grass.png",
	["astonish"] = "ghost.png",
	["poison fang"] = "poison.png",
	["air cutter"] = "flying.png",
	["venoshock"] = "poison.png",
	["air slash"] = "flying.png",
	["rock slide"] = "rock.png",
	["stone edge"] = "rock.png",
	["hyper beam"] = "normal.png",
	["crunch"] = "dark.png",
	["wing attack"] = "flying.png",
	["giga impact"] = "normal.png",
	["rock throw"] = "rock.png",
	["scary face"] = "normal.png",
	["kinesis"] = "psychic.png",
	["confusion"] = "psychic.png",
	["psychic"] = "psychic.png",
	["psycho cut"] = "psychic.png",
	["psyshock"] = "psychic.png",
	["future sight"] = "psychic.png",
	["calm mind"] = "psychic.png",
	["fire fang"] = "fire.png",
	["thunder fang"] = "electric.png",
	["ice fang"] = "ice.png",
	["wrap"] = "normal.png",
	["acid spray"] = "poison.png",
	["gunk shot"] = "poison.png",
	["coil"] = "poison.png",
	["flame wheel"] = "fire.png",
	["flare blitz"] = "fire.png",
	["extreme speed"] = "normal.png",
	["burn up"] = "fire.png",
	["raging fury"] = "fire.png",
	["gust"] = "flying.png",
	["bug buzz"] = "bug.png",
	["tailwind"] = "flying.png",
	["silver wind"] = "bug.png",
	["light screen"] = "psychic.png",
	["helping hand"] = "normal.png",
	["heal pulse"] = "psychic.png",
	["life dew"] = "water.png",
	["soft-boiled"] = "normal.png",
	["dragon claw"] = "dragon.png",
	["ember"] = "fire.png",
	["heat wave"] = "fire.png",
	["dragon breath"] = "dragon.png",
	["growl"] = "normal.png",
	["inferno"] = "fire.png",
	["cosmic power"] = "psychic.png",
	["meteor mash"] = "steel.png",
	["moonlight"] = "fairy.png",
	["moonblast"] = "fairy.png",
	["stored power"] = "psychic.png",
	["water gun"] = "water.png",
	["ice shard"] = "ice.png",
	["shell smash"] = "normal.png",
	["razor shell"] = "water.png",
	["icicle crash"] = "ice.png",
	["ice beam"] = "ice.png",
	["iron defense"] = "steel.png",
	["whirlpool"] = "water.png",
	["tail whip"] = "normal.png",
	["headbutt"] = "normal.png",
	["stomping tantrum"] = "ground.png",
	["bonemerang"] = "ground.png",
	["bone club"] = "ground.png",
	["thrash"] = "normal.png",
	["bubble beam"] = "water.png",
	["icy wind"] = "ice.png",
	["aqua ring"] = "water.png",
	["aurora beam"] = "ice.png",
	["aqua jet"] = "water.png",
	["dive"] = "water.png",
	["sheer cold"] = "ice.png",
	["bulldoze"] = "ground.png",
	["slash"] = "normal.png",
	["dig"] = "ground.png",
	["earth power"] = "ground.png",
	["earthquake"] = "ground.png",
	["fissure"] = "ground.png",
	["flame charge"] = "fire.png",
	["agility"] = "psychic.png",
	["doom desire"] = "steel.png",
	["fire blast"] = "fire.png",
	["tri attack"] = "normal.png",
	["uproar"] = "normal.png",
	["quick attack"] = "normal.png",
	["twister"] = "dragon.png",
	["feather dance"] = "flying.png",
	["aerial ace"] = "flying.png",
	["hurricane"] = "flying.png",
	["leer"] = "normal.png",
	["dragon rush"] = "dragon.png",
	["dragon tail"] = "dragon.png",
	["dragon dance"] = "dragon.png",
	["outrage"] = "dragon.png",
	["self-destruct"] = "normal.png",
	["fury cutter"] = "bug.png",
	["leech life"] = "bug.png",
	["x-scissor"] = "bug.png",
	["assurance"] = "dark.png",
	["bite"] = "dark.png",
	["dark pulse"] = "dark.png",
	["fake tears"] = "dark.png",
	["nasty plot"] = "dark.png",
	["night slash"] = "dark.png",
	["dragon pulse"] = "dragon.png",
	["dual chop"] = "dragon.png",
	["eerie impulse"] = "electric.png",
	["electric terrain"] = "electric.png",
	["magnet rise"] = "electric.png",
	["shock wave"] = "electric.png",
	["thunder punch"] = "electric.png",
	["thunder shock"] = "electric.png",
	["charm"] = "fairy.png",
	["dazzling gleam"] = "fairy.png",
	["aura sphere"] = "fighting.png",
	["brick break"] = "fighting.png",
	["bulk up"] = "fighting.png",
	["close combat"] = "fighting.png",
	["cross chop"] = "fighting.png",
	["double kick"] = "fighting.png",
	["drain punch"] = "fighting.png",
	["dynamic punch"] = "fighting.png",
	["focus punch"] = "fighting.png",
	["high jump kick"] = "fighting.png",
	["low kick"] = "fighting.png",
	["low sweep"] = "fighting.png",
	["power-up punch"] = "fighting.png",
	["reversal"] = "fighting.png",
	["seismic toss"] = "fighting.png",
	["vital throw"] = "fighting.png",
	["blaze kick"] = "fire.png",
	["fire punch"] = "fire.png",
	["lava plume"] = "fire.png",
	["sunny day"] = "fire.png",
	["curse"] = "ghost.png",
	["hex"] = "ghost.png",
	["lick"] = "ghost.png",
	["night shade"] = "ghost.png",
	["nightmare"] = "ghost.png",
	["shadow ball"] = "ghost.png",
	["shadow punch"] = "ghost.png",
	["bullet seed"] = "grass.png",
	["energy ball"] = "grass.png",
	["leaf blade"] = "grass.png",
	["leaf tornado"] = "grass.png",
	["leech seed"] = "grass.png",
	["power whip"] = "grass.png",
	["solar beam"] = "grass.png",
	["bone rush"] = "ground.png",
	["mud shot"] = "ground.png",
	["sand tomb"] = "ground.png",
	["ice punch"] = "ice.png",
	["powder snow"] = "ice.png",
	["defense curl"] = "normal.png",
	["double team"] = "normal.png",
	["endure"] = "normal.png",
	["fake out"] = "normal.png",
	["feint"] = "normal.png",
	["guillotine"] = "normal.png",
	["lock-on"] = "normal.png",
	["minimize"] = "normal.png",
	["pay day"] = "normal.png",
	["perish song"] = "normal.png",
	["pound"] = "normal.png",
	["protect"] = "normal.png",
	["scratch"] = "normal.png",
	["sing"] = "normal.png",
	["smokescreen"] = "normal.png",
	["stomp"] = "normal.png",
	["super fang"] = "normal.png",
	["swords dance"] = "normal.png",
	["acid armor"] = "poison.png",
	["cross poison"] = "poison.png",
	["poison gas"] = "poison.png",
	["poison jab"] = "poison.png",
	["poison sting"] = "poison.png",
	["sludge"] = "poison.png",
	["sludge bomb"] = "poison.png",
	["sludge wave"] = "poison.png",
	["toxic"] = "poison.png",
	["amnesia"] = "psychic.png",
	["barrier"] = "psychic.png",
	["dream eater"] = "psychic.png",
	["extrasensory"] = "psychic.png",
	["guard swap"] = "psychic.png",
	["hypnosis"] = "psychic.png",
	["imprison"] = "psychic.png",
	["power swap"] = "psychic.png",
	["psystrike"] = "psychic.png",
	["psywave"] = "psychic.png",
	["reflect"] = "psychic.png",
	["rock blast"] = "rock.png",
	["rock polish"] = "rock.png",
	["rollout"] = "rock.png",
	["wide guard"] = "rock.png",
	["bullet punch"] = "steel.png",
	["flash cannon"] = "steel.png",
	["gyro ball"] = "steel.png",
	["metal claw"] = "steel.png",
	["metal sound"] = "steel.png",
	["aqua tail"] = "water.png",
	["crabhammer"] = "water.png",
	["hydro pump"] = "water.png",
	["liquidation"] = "water.png",
	["water pulse"] = "water.png",
	["waterfall"] = "water.png",
	["withdraw"] = "water.png",
	["power gem"] = "rock.png",
	["rapid spin"] = "normal.png",
	["megahorn"] = "bug.png",
	["tackle"] = "normal.png",
	["healing wish"] = "psychic.png",
	["horn attack"] = "normal.png",
	["zen headbutt"] = "psychic.png",
	["raging bull"] = "normal.png",
	["poison powder"] = "poison.png",
	["sleep powder"] = "grass.png",
	["stun spore"] = "grass.png",
	["mega drain"] = "grass.png",
	["power whip"] = "grass.png",
	["high horsepower"] = "ground.png",
	["metronome"] = "normal.png",
	["belch"] = "poison.png",
	["heavy slam"] = "steel.png",
	["rest"] = "psychic.png",
	["horn drill"] = "normal.png",
	["drill run"] = "ground.png",
	["harden"] = "normal.png",
	["acid"] = "poison.png",
	["smog"] = "poison.png",
	["blizzard"] = "ice.png",
	["peck"] = "flying.png",
	["razor leaf"] = "grass.png",
	["string shot"] = "bug.png",
	["slash"] = "normal.png",
	["petal blizzard"] = "grass.png",
	["giga drain"] = "grass.png",
	["dragon rage"] = "dragon.png",
	["recover"] = "normal.png",
	["surf"] = "water.png",
	["superpower"] = "fighting.png",
	["rain dance"] = "water.png",
	["leaf storm"] = "grass.png",
	["leafage"] = "grass.png",
	["magical leaf"] = "grass.png",
	["nature power"] = "normal.png",
	["aromatherapy"] = "grass.png",
	["eruption"] = "fire.png",
	["brine"] = "water.png",
	["wood hammer"] = "grass.png",
	["arm thrust"] = "fighting.png",
	["shadow sneak"] = "ghost.png",
	["water shuriken"] = "water.png",
	["bounce"] = "flying.png",
	["needle arm"] = "grass.png",
	["spiky shield"] = "grass.png",
	["mystical fire"] = "fire.png",
	["misty terrain"] = "fairy.png",
	["sparkling aria"] = "water.png",
	["spirit shackle"] = "ghost.png",
	["phantom force"] = "ghost.png",
	["synthesis"] = "grass.png",
	["darkest lariat"] = "dark.png",
	["sketch1"] = "normal.png",
	["sketch2"] = "normal.png",
	["sketch3"] = "normal.png",
	["sketch4"] = "normal.png",
	["sketch5"] = "normal.png",
	["sketch6"] = "normal.png",
	["sketch7"] = "normal.png",
	["sketch8"] = "normal.png",
	["sketch9"] = "normal.png",
	["sketch10"] = "normal.png",
	["steel wing"] = "steel.png",
	["me first"] = "normal.png",
	["bug bite"] = "bug.png",
	["struggle bug"] = "bug.png",
	["rock tomb"] = "rock.png",
	["head smash"] = "rock.png",
	["mirror coat"] = "psychic.png",
	["counter"] = "fighting.png",
	["fell stinger"] = "bug.png",
	["pin missile"] = "bug.png",
	["infestation"] = "bug.png",
	["refresh"] = "normal.png",
	["present"] = "normal.png",
	["follow me"] = "normal.png",
	["milk drink"] = "normal.png",
	["snarl"] = "dark.png",
	["throat chop"] = "dark.png",
	["fairy wind"] = "fairy.png",
	["hidden power"] = "normal.png",
	["triple kick"] = "fighting.png",
	["rolling kick"] = "fighting.png",
	["muddy water"] = "water.png",
	["octazooka"] = "water.png",
	["weather ball"] = "normal.png",
	["sacred fire"] = "fire.png",
	["boomburst"] = "normal.png",
	["sandstorm"] = "rock.png",
	["rain dance"] = "water.png",
	["sunny day"] = "fire.png",
	["hail"] = "ice.png",
	["draining kiss"] = "fairy.png",
	["knock off"] = "dark.png",
	["shadow claw"] = "ghost.png",
	["axe kick"] = "fighting.png",
	["smelling salts"] = "fighting.png",
	["wake-up slap"] = "fighting.png",
	["healing wish"] = "psychic.png",
	["eruption"] = "fire.png",
	["dual wingbeat"] = "dragon.png",
	["fly"] = "flying.png",
	["iron head"] = "steel.png",
	["iron tail"] = "steel.png",
	["autotomize"] = "steel.png",
	["metal burst"] = "steel.png",
	["wild charge"] = "electric.png",
	["hammer arm"] = "fighting.png",
	["punishment"] = "dark.png",
	["sucker punch"] = "dark.png",
	["flail"] = "normal.png",
	["chip away"] = "normal.png",
	["feint attack"] = "dark.png",
	["doom desire"] = "steel.png",
	["gravity"] = "psychic.png",
	["crush claw"] = "normal.png",
	["ingrain"] = "grass.png",
	["freeze-dry"] = "ice.png",
	["teeter dance"] = "normal.png",
	["dynamic punch"] = "fighting.png",
	["precipice blades"] = "ground.png",
	["origin pulse"] = "water.png",
	["dragon ascent"] = "flying.png",
	["mist ball"] = "psychic.png",
	["luster purge"] = "psychic.png",
	["attack order"] = "bug.png",
	["defense order"] = "bug.png",
	["twineedle"] = "bug.png",
	["aqua cutter"] = "water.png",
	["volt switch"] = "electric.png",
	["rock wrecker"] = "rock.png",
	["me first"] = "normal.png",
	["double hit"] = "normal.png",
	["wave crash"] = "water.png",
	["chatter"] = "flying.png",
	["lunar blessing"] = "psychic.png",
	["bad dreams"] = "dark.png",
	["roar of time"] = "dragon.png",
	["spacial rend"] = "dragon.png",
	["crush grip"] = "normal.png",
	["mega punch"] = "normal.png",
	["payback"] = "dark.png",
	["revenge"] = "fighting.png",
	["rock smash"] = "fighting.png",
	["magma storm"] = "fire.png",
	["seed flare"] = "grass.png",
	["shadow force"] = "ghost.png",
	["ominous wind"] = "ghost.png",
	["mystical power"] = "psychic.png",
	["wood hammer"] = "grass.png",
	["focus energy"] = "fighting.png",
	["icicle spear"] = "ice.png",
	["overheat"] = "fire.png",
	["aeroblast"] = "flying.png",
	["mach punch"] = "fighting.png",
	["force palm"] = "fighting.png",
	["body press"] = "fighting.png",
	["facade"] = "normal.png",
	["confuse ray"] = "ghost.png",
	["water spout"] = "water.png",
	["psycho boost"] = "psychic.png",
	["dark void"] = "dark.png",
	["poison tail"] = "poison.png",
	["normal judgement"] = "normal.png",
	["fire judgement"] = "fire.png",
	["water judgement"] = "water.png",
	["electric judgement"] = "electric.png",
	["grass judgement"] = "grass.png",
	["ice judgement"] = "ice.png",
	["fighting judgement"] = "fighting.png",
	["poison judgement"] = "poison.png",
	["ground judgement"] = "ground.png",
	["flying judgement"] = "flying.png",
	["psychic judgement"] = "psychic.png",
	["bug judgement"] = "bug.png",
	["rock judgement"] = "rock.png",
	["ghost judgement"] = "ghost.png",
	["dragon judgement"] = "dragon.png",
	["dark judgement"] = "dark.png",
	["steel judgement"] = "steel.png",
	["fairy judgement"] = "fairy.png",
}

local spells = {}
local spellsNumber = 12
local OPCODE_SKILLBAR = 52
local side = 'horizontal'
local sbw -- window widget
local spellBarWindow -- UIWindow
local hideLevel = false -- hide spells that can not be used due to level dependence
local level

function msgcontains(message, keyword)
  local message, keyword = message:lower(), keyword:lower()
  if message == keyword then
    return true
  end
  return message:find(keyword) and not message:find('(%w+)' .. keyword)
end

function string:split( inSplitPattern, outResults )
  if not outResults then
    outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  while theSplitStart do
    table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( self, theStart ) )
  return outResults
end

function getOpCode(protocol, opcode, buffer)
  local moves = {}
  local cooldowns = {}
  local cooldownRemaining = {}
  local levelNeed = {}
  spells = {}
  for match in string.gmatch(buffer, "([^,]+),%s*") do
    if tonumber(match) == nil then
      moves[#moves + 1] = match
    else
      if #cooldowns < #moves then
        cooldowns[#cooldowns + 1] = tonumber(match)
	  elseif #cooldownRemaining == 12 and #levelNeed < #moves then
		levelNeed[#levelNeed + 1] = tonumber(match)
	  elseif #cooldownRemaining == 12 and #levelNeed >= #moves then
		level = tonumber(match)
	  else
		cooldownRemaining[#cooldownRemaining + 1] = tonumber(match)
      end
    end
  end
  for i = 1, #moves do
     local inside = {id = i, words = moves[i], lvl = levelNeed[i], exhaustion = cooldowns[i], cooldownRemaining = cooldownRemaining[i]}
     table.insert(spells, inside)
  end
  getSpells(spells)
  sbw:show()
end

function init()
  sbw = g_ui.displayUI('pokemonmoves')
  sbw:move(533, 680)
  g_mouse.bindPress(sbw, function() createMenu() end, MouseRightButton)
  sbw:hide()
  connect(g_game, 'onTalk', messageSentCallback)
  connect(g_game, { onGameEnd = function() sbw:hide() end })
  connect(LocalPlayer, {
    onLevelChange = onLevelChange
  })
  ProtocolGame.registerExtendedOpcode(OPCODE_SKILLBAR, getOpCode)
end

function onLevelChange(localPlayer, value, percent)
  getSpells(spells)
end

function messageSentCallback(name, level, mode, text, channelId, pos)
  if not g_game.isOnline() then return end
  if g_game.getLocalPlayer():getName() ~= name then return end
  if mode ~= 34 then return end
  if msgcontains(text, "use") then
    text = string.gsub(text, "use ", "")
    text = string.gsub(text, "!", "")
    text = text:split(", ")[2]
    for i = 1, #spells do
      if spells[i].words:lower() == text:lower() then 
        startDownDelay(i)
        break
      end
    end
  elseif msgcontains(text, "thanks") then
    sbw:hide()
  end
end

function terminate()
  ProtocolGame.unregisterExtendedOpcode(OPCODE_SKILLBAR)
  sbw:destroy()
  disconnect(g_game, { onGameEnd = function() sbw:hide() end })
  disconnect(g_game, 'onTalk', messageSentCallback)
  disconnect(LocalPlayer, {
    onLevelChange = onLevelChange
  })
end

function createMenu()
  local menu = g_ui.createWidget('PopupMenu')
  if side == 'horizontal' then
    menu:addOption('Set Vertical', function() side = 'vertical' getSpells(spells) end)
  else
    menu:addOption('Set Horizontal',function() side = 'horizontal' getSpells(spells) end)
  end
  menu:display()
end

function destroySpells()
  for i = 1, spellsNumber do
    if sbw:recursiveGetChildById('spell'..i) == nil then break end
    sbw:recursiveGetChildById('spell'..i):destroy()
    sbw:recursiveGetChildById('progress'..i):destroy()
  end
end

function getSpells(table)
  destroySpells()
  spellBarWindow = sbw:recursiveGetChildById('mainWindow')
  local player = g_game.getLocalPlayer()
  local value = #table
  local width = 38
  local height = 38
  if not player then return end
  for i = 1, #table do
    if (table[i].lvl > level) and hideLevel == true then
      value = i - 1
      break
    end
    if i == #table then value = i end
    icon = g_ui.createWidget('SpellButton',spellBarWindow)
    --icon:
    icon:setId('spell'..i)
	local move = table[i].words
    local pathOn = "moves_icon/"..spelltoicon[move:lower()]..""
	icon:setImageSource(pathOn)
    icon:setVisible(true) 
    icon.words = table[i].words
    icon.lvl = table[i].lvl
    icon.exhaustion = table[i].exhaustion
    icon.exhaustionNeeded = icon.exhaustion - table[i].cooldownRemaining
    icon:setTooltip("Move: "..table[i].words.."\nLevel: "..table[i].lvl.."\nCooldown: "..(table[i].exhaustion/1000).." segundos\nTipo: "..string.gsub(spelltoicon[move:lower()], ".png", ""):upper().." TYPE")
    if side == 'horizontal' then
      icon:setMarginTop(5)
      height = 43
      width = (i) * 32.5 + 2*(i)
      icon:setMarginLeft((i) * 32 + 2*(i) - 32)
    else
      icon:setMarginLeft(3)
      icon:setMarginTop((i) * 32 + 2*(i) - 32)
      width = 38
      height = (i) * 32 + 2*(i)
    end
    --progress:
    progress = g_ui.createWidget('SpellProgressSpell',spellBarWindow)
    progress:setId('progress'..i)
    progress:setVisible(true)
    progress:setPercent(100)
    progress:setMarginLeft(icon:getMarginLeft())
    progress:setMarginTop(icon:getMarginTop())
    if level < icon.lvl then progress:setText('Lv:\n'..icon.lvl) progress:setColor('red') progress:setPercent(0) end
    if progress:getPercent() == 100 then progress:setText('') elseif icon.lvl < level then progress:setText(progress:getPercent()) end
    progress:setPhantom(true)
    icon.onClick = function() useSpell(i) end
  end
  sbw:setHeight(height)
  sbw:setWidth(width)  
  spellBarWindow:setSize(sbw:getSize())
end

function useSpell(i)
  local progress = sbw:recursiveGetChildById('progress'..i)
  local player = g_game.getLocalPlayer()
  if not player then return end
  if progress:getPercent() < 100 then return modules.game_textmessage.displayFailureMessage('Sorry, not possible.') end
  g_game.talk('m'..i)
end

function startDownDelay(i)
  local spell = sbw:recursiveGetChildById('spell'..i)
  if not spell then return end
  local progress = sbw:recursiveGetChildById('progress'..i)
  progress:setPercent(0)
  progress:setText('0%')
  progress:setColor('red')
  spell.exhaustionNeeded = 0
  scheduleEvent(function() spellTimeleft(i) end,100) 
end

function spellTimeleft(i)
  local spell = sbw:recursiveGetChildById('spell'..i)
  if not spell then return end
  local progress = sbw:recursiveGetChildById('progress'..i)
  spell.exhaustionNeeded = spell.exhaustionNeeded + 100
  if spell.exhaustionNeeded < spell.exhaustion then
    progress:setPercent(math.ceil(((spell.exhaustionNeeded) * 100)/spell.exhaustion))
    progress:setText(progress:getPercent().."%")
    progress:setColor('red')
  else
    progress:setPercent(100)
    progress:setText('')
    spell.exhaustionNeeded = 0    
    return true
  end
  scheduleEvent(function() spellTimeleft(i) end,100) 
end
