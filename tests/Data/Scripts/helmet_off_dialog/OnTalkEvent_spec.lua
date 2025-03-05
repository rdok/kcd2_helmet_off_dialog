describe("helmet: ", function()
    it("takes it off", function()
        local factory = makeFactory()
        factory.onTalkEvent:handle()
        assert.spy(factory.equipment.takeOffHelmet).was_called(1)
    end)
    it("queues take off for head chainmail", function()
        local factory = makeFactory()
        factory.onTalkEvent:handle()
        assert.spy(factory.onTalkEvent.takeOffHeadChainmail).was_called(1)
    end)
end)

describe("head chainmail", function()
    it("takes it off", function()
        local factory = makeFactory()
        factory.onTalkEvent:takeOffHeadChainmail()
        assert.spy(factory.equipment.takeOffHeadChainmail).was_called(1)
    end)
    it("queues take off for coif", function()
        local factory = makeFactory()
        factory.onTalkEvent:takeOffHeadChainmail()
        assert.spy(factory.onTalkEvent.takeOffCoif).was_called(1)
    end)
end)

describe("coif", function()
    it("take it off", function()
        local factory = makeFactory()
        factory.onTalkEvent:takeOffCoif()
        assert.spy(factory.equipment.takeOffCoif).was_called(1)
    end)
end)

function makeFactory()
     dofile("src/Data/Scripts/HelmetOffDialog/utils/dd.lua")

    local mockHelmetOffDialog = dofile("tests/HodMock.lua")
    local helmetOffDialogFactory = mockHelmetOffDialog(mock, spy)
    local helmetOffDialog = helmetOffDialogFactory.HelmetOffDialog
    --- @type OnTalkEvent
    local OnTalkEvent = dofile("src/Data/Scripts/HelmetOffDialog/OnTalkEvent.lua")
    local Equipment = dofile("src/Data/Scripts/HelmetOffDialog/Equipment.lua")
    local equipment = mock(Equipment, true)
    equipment.takeOffHelmet = spy.new(function(self, callback) callback() end)
    equipment.takeOffHeadChainmail = spy.new(function(self, callback) callback() end)
    equipment.takeOffCoif = spy.new(function(self, callback) callback() end)

    --- @type TalkEndedEvent
    local TalkEndedEvent = dofile("src/Data/Scripts/HelmetOffDialog/TalkEndedEvent.lua")
    --- @type TalkEndedEvent
    local talkEndedEvent = mock(TalkEndedEvent, true)

    local log = { info = spy.new(function() end) }

    local human = {}
    local timedTrigger = { start = function() end }
    local onTalkEvent = OnTalkEvent:new(helmetOffDialog, log, equipment, talkEndedEvent)
    spy.on(onTalkEvent, "takeOffHeadChainmail")
    spy.on(onTalkEvent, "coif")
    spy.on(onTalkEvent, "takeOffCoif")
    return {
        equipment = equipment,
        onTalkEvent = onTalkEvent
    }
end