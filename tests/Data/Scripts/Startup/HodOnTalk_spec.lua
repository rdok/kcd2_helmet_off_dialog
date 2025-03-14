dofile("tests/HodMock.lua")

describe("triggers the on talk event", function()
    it("creates the event", function()
        local factory = makeFactory()
        factory.BasicAIActions:OnTalk()
        assert.spy(factory.HelmetOffDialog.onTalkEvent).was.called(1)
    end)
    it("triggers the event", function()
        local factory = makeFactory()
        factory.BasicAIActions:OnTalk()
        assert.spy(factory.HelmetOffDialog.onTalkEvent().handle).was.called(1)
    end)
end)

describe("player can still start dialogues", function()
    test("original OnTalk function is called", function()
        local factory = makeFactory()
        factory.BasicAIActions:OnTalk()
        assert.spy(factory.original_BasicAIActions_onTalk).was.called(1)
    end)
    test("original OnTalk returns output", function()
        local factory = makeFactory()
        factory.BasicAIActions:OnTalk()
        assert.spy(factory.original_BasicAIActions_onTalk).was.called(1)
    end)
end)

function makeFactory()
    local mockHelmetOffDialog = dofile("tests/HodMock.lua")
    local factory = mockHelmetOffDialog(mock, spy)
    local original_BasicAIActions_onTalk = factory.mockedBasicAIActions.OnTalk
    dofile("src/Data/Scripts/Startup/HodOnTalk.lua")

    return {
        BasicAIActions = _G.BasicAIActions,
        HelmetOffDialog = factory.HelmetOffDialog,
        original_BasicAIActions_onTalk = original_BasicAIActions_onTalk
    }
end

