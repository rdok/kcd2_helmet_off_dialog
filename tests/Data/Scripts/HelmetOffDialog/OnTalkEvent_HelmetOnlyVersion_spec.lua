describe("helmet: ", function()
    it("takes it off", function()
        local factory = makeFactory({ helmetOnlyVersion = true })
        factory.onTalkEvent:handle()
        assert.spy(factory.equipment.takeOffHelmet).was_called(1)
    end)
    it("does not queue take off for head chainmail", function()
        local factory = makeFactory({ helmetOnlyVersion = true })
        factory.onTalkEvent:handle()
        assert.spy(factory.onTalkEvent.takeOffHeadChainmail).was_not_called()
    end)
    it("does not queue take off for coifs", function()
        local factory = makeFactory({ helmetOnlyVersion = true })
        factory.onTalkEvent:handle()
        assert.spy(factory.onTalkEvent.takeOffCoif).was_not_called()
    end)
    it("triggers talk ended event", function()
        local factory = makeFactory({ helmetOnlyVersion = true })
        factory.onTalkEvent:handle()
        assert.spy(factory.talkEndedEvent.listen).was_called(1)
    end)
end)

function makeFactory(args)
    local createFactory = dofile("tests/Data/Scripts/HelmetOffDialog/OnTalkEvent_Factory.lua")

    return createFactory(mock, spy, args)
end