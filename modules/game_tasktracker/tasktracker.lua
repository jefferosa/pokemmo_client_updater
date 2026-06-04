taskTrackerWindow = nil
titleLabel = nil
descLabel = nil

local OPCODE_TASK = 101

function init()
    taskTrackerWindow = g_ui.displayUI('tasktracker')
    titleLabel = taskTrackerWindow:getChildById('titleLabel')
    descLabel = taskTrackerWindow:getChildById('descLabel')
    
    ProtocolGame.registerExtendedOpcode(OPCODE_TASK, onTaskUpdate)
    
    connect(g_game, {
        onGameEnd = offline
    })
    
    print("TaskTracker: Iniciado e escutando a porta 101!")
end

function terminate()
    ProtocolGame.unregisterExtendedOpcode(OPCODE_TASK, onTaskUpdate)
    disconnect(g_game, {
        onGameEnd = offline
    })
    taskTrackerWindow:destroy()
end

function offline()
    taskTrackerWindow:hide()
end

function onTaskUpdate(protocol, opcode, buffer)
    print("TaskTracker: Mensagem recebida: " .. tostring(buffer))
    
    -- 1. Fatiador de texto: divide a string onde encontrar o "|"
    local t_title, t_desc, t_progress = string.match(buffer, "(.-)|(.-)|(.*)")
    
    -- 2. Tratamento caso o servidor mande apenas "hide" solto (sem as barras verticais)
    if not t_title then 
        if buffer:lower() == "hide" then
            taskTrackerWindow:hide()
            return
        end
        print("TaskTracker: Falha ao dividir o texto. Formato invalido.")
        return 
    end

    -- 3. Tratamento caso o servidor mande "Hide||" com as barras verticais
    if t_title:lower() == "hide" then
        taskTrackerWindow:hide()
        return
    end

    -- 4. Se não for comando de esconder, aplica os textos na interface
    titleLabel:setText(t_title)
    descLabel:setText(t_desc .. "\n\nProgresso: " .. t_progress)
    
    -- 5. Ajusta o tamanho da janela e exibe
    taskTrackerWindow:setHeight(titleLabel:getHeight() + descLabel:getHeight() + 30)
    taskTrackerWindow:show()
    print("TaskTracker: Janela desenhada na tela com sucesso!")
end