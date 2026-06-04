Icons = {}
Icons[PlayerStates.Poison] = { tooltip = tr('You are poisoned'), path = '/images/game/states/poisoned', id = 'condition_poisoned' }
Icons[PlayerStates.Burn] = { tooltip = tr('You are burning'), path = '/images/game/states/burning', id = 'condition_burning' }
Icons[PlayerStates.Energy] = { tooltip = tr('You are electrified'), path = '/images/game/states/electrified', id = 'condition_electrified' }
Icons[PlayerStates.Drunk] = { tooltip = tr('You are drunk'), path = '/images/game/states/drunk', id = 'condition_drunk' }
Icons[PlayerStates.ManaShield] = { tooltip = tr('You are protected by a magic shield'), path = '/images/game/states/magic_shield', id = 'condition_magic_shield' }
Icons[PlayerStates.Paralyze] = { tooltip = tr('You are paralysed'), path = '/images/game/states/slowed', id = 'condition_slowed' }
Icons[PlayerStates.Haste] = { tooltip = tr('You are hasted'), path = '/images/game/states/haste', id = 'condition_haste' }
Icons[PlayerStates.Swords] = { tooltip = tr('You may not logout during a fight'), path = '/images/game/states/logout_block', id = 'condition_logout_block' }
Icons[PlayerStates.Drowning] = { tooltip = tr('You are drowning'), path = '/images/game/states/drowning', id = 'condition_drowning' }
Icons[PlayerStates.Freezing] = { tooltip = tr('You are freezing'), path = '/images/game/states/freezing', id = 'condition_freezing' }
Icons[PlayerStates.Dazzled] = { tooltip = tr('You are dazzled'), path = '/images/game/states/dazzled', id = 'condition_dazzled' }
Icons[PlayerStates.Cursed] = { tooltip = tr('You are cursed'), path = '/images/game/states/cursed', id = 'condition_cursed' }
Icons[PlayerStates.PartyBuff] = { tooltip = tr('You are strengthened'), path = '/images/game/states/strengthened', id = 'condition_strengthened' }
Icons[PlayerStates.PzBlock] = { tooltip = tr('You may not logout or enter a protection zone'), path = '/images/game/states/protection_zone_block', id = 'condition_protection_zone_block' }
Icons[PlayerStates.Pz] = { tooltip = tr('You are within a protection zone'), path = '/images/game/states/protection_zone', id = 'condition_protection_zone' }
Icons[PlayerStates.Bleeding] = { tooltip = tr('You are bleeding'), path = '/images/game/states/bleeding', id = 'condition_bleeding' }
Icons[PlayerStates.Hungry] = { tooltip = tr('You are hungry'), path = '/images/game/states/hungry', id = 'condition_hungry' }

healthInfoWindow = nil
healthBar = nil

experienceBar = nil
fishBar = nil

capLabel = nil
healthTooltip = 'Your character health is %d out of %d.'
manaTooltip = 'Your character mana is %d out of %d.'
experienceTooltip = 'You have %d%% to advance to level %d.'
fishingTooltip = 'You have %d%% to advance to fishing level %d.'

function init()
  connect(LocalPlayer, { onHealthChange = onHealthChange,
                         onLevelChange = onLevelChange,
                         onStatesChange = onStatesChange,
						 onSkillChange = onSkillChange })

  connect(g_game, { onGameEnd = offline })

  healthInfoButton = modules.client_topmenu.addRightGameToggleButton('healthInfoButton', tr('Health Information'), '/images/topbuttons/healthinfo', toggle)
  healthInfoButton:setOn(true)
  
  healthInfoWindow = g_ui.loadUI('healthinfo')
  healthInfoWindow:setParent(modules.game_interface.getRootPanel(), true)
  healthInfoWindow:addAnchor(AnchorLeft, 'parent', AnchorLeft)
  healthInfoWindow:addAnchor(AnchorTop, 'parent', AnchorTop)
  healthInfoWindow:setMarginLeft(1)
  healthInfoWindow:setMarginTop(25)
  healthInfoWindow:setPhantom(true)
  healthInfoWindow:getChildById('minimizeButton'):hide()
  healthInfoWindow:getChildById('closeButton'):hide()
  healthBar = healthInfoWindow:recursiveGetChildById('healthBar')
  experienceBar = healthInfoWindow:recursiveGetChildById('experienceBar')
  fishBar = healthInfoWindow:recursiveGetChildById('fishBar')
  capLabel = healthInfoWindow:recursiveGetChildById('capLabel')
  createButtons()
  
  -- load condition icons
  for k,v in pairs(Icons) do
    g_textures.preload(v.path)
  end

  if g_game.isOnline() then
    local localPlayer = g_game.getLocalPlayer()
    onHealthChange(localPlayer, localPlayer:getHealth(), localPlayer:getMaxHealth())
    onLevelChange(localPlayer, localPlayer:getLevel(), localPlayer:getLevelPercent())
	onSkillChange(localPlayer, localPlayer:getSkillLevel(6), localPlayer:getSkillLevelPercent(6))
    onStatesChange(localPlayer, localPlayer:getStates(), 0)
    onFreeCapacityChange(localPlayer, localPlayer:getFreeCapacity(), localPlayer:getTotalCapacity())
  end

  healthInfoWindow:setup()
end

function terminate()
  disconnect(LocalPlayer, { onHealthChange = onHealthChange,
                            onLevelChange = onLevelChange,
                            onStatesChange = onStatesChange,
							onSkillChange = onSkillChange })

  disconnect(g_game, { onGameEnd = offline })
  destroyButtons()
  healthInfoWindow:destroy()
  healthInfoButton:destroy()
end

function toggle()
  if healthInfoButton:isOn() then
    healthInfoWindow:close()
	destroyBalls()
	healthInfoWindow:setParent(modules.game_interface.getRootPanel(), true)
    healthInfoWindow:addAnchor(AnchorLeft, 'parent', AnchorLeft)
    healthInfoWindow:addAnchor(AnchorTop, 'parent', AnchorTop)
    healthInfoWindow:setMarginLeft(175)
    healthInfoWindow:setMarginTop(50)
    healthInfoWindow:setPhantom(true)
    healthInfoButton:setOn(false)
  else
    healthInfoWindow:open()
	destroyBalls()
	healthInfoWindow:setParent(modules.game_interface.getRootPanel(), true)
    healthInfoWindow:addAnchor(AnchorLeft, 'parent', AnchorLeft)
    healthInfoWindow:addAnchor(AnchorTop, 'parent', AnchorTop)
    healthInfoWindow:setMarginLeft(175)
    healthInfoWindow:setMarginTop(50)
    healthInfoWindow:setPhantom(true)
    healthInfoButton:setOn(true)
  end
end

function toggleIcon(bitChanged)
  local content = healthInfoWindow:recursiveGetChildById('conditionPanel')
  local icon = content:getChildById(Icons[bitChanged].id)
  if icon then
    icon:destroy()
  else
    icon = loadIcon(bitChanged)
    icon:setParent(content)
  end
end

function loadIcon(bitChanged)
  local icon = g_ui.createWidget('ConditionWidget', content)
  icon:setId(Icons[bitChanged].id)
  icon:setImageSource(Icons[bitChanged].path)
  icon:setTooltip(Icons[bitChanged].tooltip)
  return icon
end

function offline()
  healthInfoWindow:recursiveGetChildById('conditionPanel'):destroyChildren()
end

-- hooked events
function onMiniWindowClose()
  healthInfoButton:setOn(false)
end

function onHealthChange(localPlayer, health, maxHealth)
  healthBar:setText(health .. ' / ' .. maxHealth)
  healthBar:setTooltip(tr(healthTooltip, health, maxHealth))
  healthBar:setValue(health, 0, maxHealth)
end

function onSkillChange(localPlayer, value, percent)
  fishBar:setTooltip(tr(fishingTooltip, localPlayer:getSkillLevelPercent(6), localPlayer:getSkillLevel(6)+1))
  fishBar:setPercent(localPlayer:getSkillLevelPercent(6))
  createText()
end

function onLevelChange(localPlayer, value, percent)
  experienceBar:setTooltip(tr(experienceTooltip, percent, value+1))
  experienceBar:setPercent(percent)
  createText()
end

function destroyBalls()
	for i = 1, 6, 1 do
		if healthInfoWindow:recursiveGetChildById('ball'..i) == nil then return false end
		healthInfoWindow:recursiveGetChildById('ball'..i):destroy()
	end
end

function destroyButtons()
	for i = 1, 7 do
		if healthInfoWindow:recursiveGetChildById('button'..i) == nil then return false end
		healthInfoWindow:recursiveGetChildById('button'..i):destroy()
	end
end

function destroyControl()
	for i = 1, 7 do
		if healthInfoWindow:recursiveGetChildById('control'..i) == nil then return false end
		healthInfoWindow:recursiveGetChildById('control'..i):destroy()
	end
end

function createText()
	if not healthInfoWindow then return end
	
	local btn3 = healthInfoWindow:recursiveGetChildById('button3')
	if not btn3 then return end -- Sai da função se o botão 3 não existir
	
	local button = btn3:recursiveGetChildById('minitext')
	if not button then return end -- Sai se o elemento 'minitext' não existir
	
	local player = g_game.getLocalPlayer()
	if not player then return end
	
	button:setText('LV: ' .. player:getLevel() .. ' Fishing: ' .. player:getSkillLevel(6))
	button:setColor('white')
	button:setMarginLeft(-100)
	button:setVisible(true)
end

function createButtons()
	local buttons = {
	{'order', 'Move se pokemon.\nAtalho: botao do meio do mouse.', 11}, 
	{'pokedex', 'Mostra informacoes do pokemon selecionado.\nAtalho: CTRL+F', 12}, 
	{'inventory', 'Abre sua mochila.\nAtalho: CTRL+I', 3},
	{'evolve', 'Evolui o pokemon selecionado.\nAtalho: CTRL+E.', 9}, 
	{'coin', 'Abre o painel da carteira.', 7}, 
	{'badge', 'Abre o painel de insignias.', 8}
	}
	for i = 1, #buttons do
		button = g_ui.createWidget('IconButton',healthInfoWindow)
		button:setId('button'..i)
		local pathOn = "interface/"..buttons[i][1]:lower()..".png"
		button:setImageSource(pathOn)
		button:setMarginLeft((30) + (i) * 48 - (i))
		button:setMarginTop(110)
		button:setVisible(true)
		button:setTooltip(buttons[i][2])		
		if buttons[i][1] == 'inventory' then
			button.onClick = function() g_game.useInventoryItem(g_game.getLocalPlayer():getInventoryItem(buttons[i][3]):getId()) end
		elseif buttons[i][1] == 'badge' then
			button.onClick = function() g_game.useInventoryItem(g_game.getLocalPlayer():getInventoryItem(buttons[i][3]):getId()) end
		elseif buttons[i][1] == 'coin' then
			button.onClick = function() g_game.useInventoryItem(g_game.getLocalPlayer():getInventoryItem(buttons[i][3]):getId()) end
		elseif buttons[i][1] == 'pokedex' then
			button.onClick = function() toggleDex() end
		elseif buttons[i][1] == 'evolve' then
			button.onClick = function() toggleEvolve() end
		elseif buttons[i][1] == 'order' then
			button.onClick = function() toggleOrder() end
		end
	end
end

function onStatesChange(localPlayer, now, old)
  if now == old then return end

  local bitsChanged = bit32.bxor(now, old)
  for i = 1, 32 do
    local pow = math.pow(2, i-1)
    if pow > bitsChanged then break end
    local bitChanged = bit32.band(bitsChanged, pow)
    if bitChanged ~= 0 then
      toggleIcon(bitChanged)
    end
  end
end

-- personalization functions
function hideLabels()
  local removeHeight = math.max(capLabel:getMarginRect().height, soulLabel:getMarginRect().height)
  capLabel:setOn(false)
  soulLabel:setOn(false)
  healthInfoWindow:setHeight(math.max(healthInfoWindow.minimizedHeight, healthInfoWindow:getHeight() - removeHeight))
end

function hideExperience()
  local removeHeight = experienceBar:getMarginRect().height
  experienceBar:setOn(false)
  healthInfoWindow:setHeight(math.max(healthInfoWindow.minimizedHeight, healthInfoWindow:getHeight() - removeHeight))
end

function startChooseItem(releaseCallback)
  if g_ui.isMouseGrabbed() then return end
  if not releaseCallback then
    error("No mouse release callback parameter set.")
  end
  local mouseGrabberWidget = g_ui.createWidget('UIWidget')
  mouseGrabberWidget:setVisible(false)
  mouseGrabberWidget:setFocusable(false)

  connect(mouseGrabberWidget, { onMouseRelease = releaseCallback })
  
  mouseGrabberWidget:grabMouse()
  g_mouse.pushCursor('target')
end

function onClickWithMouse(self, mousePosition, mouseButton)
  local item = nil
  if mouseButton == MouseLeftButton then
    local clickedWidget = modules.game_interface.getRootPanel():recursiveGetChildByPos(mousePosition, false)
    if clickedWidget then
      if clickedWidget:getClassName() == 'UIGameMap' then
        local tile = clickedWidget:getTile(mousePosition)
        if tile then
          if currentSlot == 1 then
            item = tile:getGround()
          else
            local thing = tile:getTopMoveThing()
            if thing and thing:isItem() then
              item = thing
            else
              item = tile:getTopCreature()
            end
          end
        end
      elseif clickedWidget:getClassName() == 'UICreatureButton' then
        item = clickedWidget:getCreature()
      end
    end
  elseif mouseButton == MouseMidButton then
    local clickedWidget = modules.game_interface.getRootPanel():recursiveGetChildByPos(mousePosition, false)
    if clickedWidget then
      if clickedWidget:getClassName() == 'UIGameMap' then
        local tile = clickedWidget:getTile(mousePosition)
        if tile then
          if currentSlot == 1 then
            item = tile:getGround()
          else
            local thing = tile:getTopMoveThing()
            if thing and thing:isItem() then
              item = thing
            else
              item = tile:getTopCreature()
            end
          end
        end
      elseif clickedWidget:getClassName() == 'UICreatureButton' then
        item = clickedWidget:getCreature()
      end
    end
  end

  if item then
    local player = g_game.getLocalPlayer()
    g_game.useInventoryItemWith(player:getInventoryItem(currentSlot):getId(), item)
  end

  g_mouse.popCursor('target')
  self:ungrabMouse()
  return true
end

function toggleFishing()
  currentSlot = 2
  startChooseItem(onClickWithMouse)
end

function toggleDex()
  currentSlot = 12
  startChooseItem(onClickWithMouse)
end

function toggleEvolve()
  currentSlot = 9
  startChooseItem(onClickWithMouse)
end

function toggleOrder()
  currentSlot = 11
  startChooseItem(onClickWithMouse)
end