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
    it("triggers talk ended event", function()
        local factory = makeFactory()
        factory.onTalkEvent:takeOffCoif()
        assert.spy(factory.talkEndedEvent.listen).was_called(1)
    end)
end)

function makeFactory(args)
    local createFactory = dofile("tests/Data/Scripts/HelmetOffDialog/OnTalkEvent_Factory.lua")

    return createFactory(mock, spy, args)
end
