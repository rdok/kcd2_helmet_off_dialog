local original_Entity_GetPos = Entity.GetPos

function Entity.GetPos(...)
    local log = HelmetOffDialog:log()
    log:info("OnTalkEvent: Triggered by Entity.GetPos")

    HelmetOffDialog:error():catch(function()
        --- @type OnTalkEvent
        local event = HelmetOffDialog:onTalkEvent()
        event:handle()
    end)

    return original_Entity_GetPos(...)
end