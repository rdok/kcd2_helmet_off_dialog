local function makeFactory(args)
    local createFactory = dofile("tests/Data/Scripts/HelmetOffDialog/OnTalkEvent_Factory.lua")
    return createFactory(mock, spy, args)
end

describe("First ranged weapon", function()
    it("takes it off", function()
        local factory = makeFactory({ target = "ranged" })
        factory.onTalkEvent:handle()
        assert.spy(factory.equipment.takeOffFirstRangedWeapon).was_called(1)
    end)
    it("does not take it off if not enabled", function()
        local factory = makeFactory()
        factory.onTalkEvent:handle()
        assert.spy(factory.equipment.takeOffFirstRangedWeapon).was_not_called()
    end)
    it("queues take off for second ranged weapon", function()
        local factory = makeFactory({ target = "ranged" })
        factory.onTalkEvent:handle()
        assert.spy(factory.onTalkEvent.takeOffSecondRangedWeapon).was_called(1)
    end)
end)

describe("Second ranged weapon", function()
    it("takes it off", function()
        local factory = makeFactory({ target = "ranged" })
        factory.onTalkEvent:handle()
        assert.spy(factory.equipment.takeOffSecondRangedWeapon).was_called(1)
    end)
    it("does not take it off if not enabled", function()
        local factory = makeFactory()
        factory.onTalkEvent:handle()
        assert.spy(factory.equipment.takeOffSecondRangedWeapon).was_not_called()
    end)

    it("triggers talk ended event", function()
        local factory = makeFactory()
        factory.onTalkEvent:takeOffSecondRangedWeapon()
        assert.spy(factory.talkEndedEvent.listen).was_called(1)
    end)
end)

