describe("HelmetOffDialog.config:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:config()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Config.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.Config),
                factory.HelmetOffDialog.MOD_NAME)
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:config()
        factory.HelmetOffDialog:config()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Config.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/Config.lua")
    end)
end)

describe("HelmetOffDialog.log: ", function()
    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/utils/Log.lua")
    end)
end)

describe("HelmetOffDialog.error:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:error()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Error.new)
              .was.called_with(match.is_ref(factory.HelmetOffDialog.ClassRegistry.Error))
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:error()
        factory.HelmetOffDialog:error()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Error.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/utils/Error.lua")
    end)
end)

describe("HelmetOffDialog.equipment:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:equipment()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Equipment.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.Equipment),
                factory.player,
                factory.HelmetOffDialog:unequipGear(),
                factory.itemManager
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:equipment()
        factory.HelmetOffDialog:equipment()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Equipment.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/Equipment.lua")
    end)
end)

describe("HelmetOffDialog.unequipGear:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:unequipGear()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.UnequipGear.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.UnequipGear),
                factory.player,
                factory.HelmetOffDialog:equippedItem(),
                factory.HelmetOffDialog:itemCategory(),
                factory.itemManager
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:unequipGear()
        factory.HelmetOffDialog:unequipGear()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.UnequipGear.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/UnequipGear.lua")
    end)
end)

describe("HelmetOffDialog.talkEndedEvent:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:talkEndedEvent()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.TalkEndedEvent.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.TalkEndedEvent),
                factory.HelmetOffDialog:config(),
                factory.HelmetOffDialog:equipment(),
                factory.HelmetOffDialog:timedTrigger(),
                factory.player
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:talkEndedEvent()
        factory.HelmetOffDialog:talkEndedEvent()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.TalkEndedEvent.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/TalkEndedEvent.lua")
    end)
end)

describe("HelmetOffDialog.metaRole:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:metaRole()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.MetaRole.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.MetaRole),
                factory.system,
                factory.player
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:metaRole()
        factory.HelmetOffDialog:metaRole()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.MetaRole.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/MetaRole.lua")
    end)
end)

describe("HelmetOffDialog.onTalkEvent:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:onTalkEvent()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.OnTalkEvent.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.OnTalkEvent),
                factory.HelmetOffDialog:equipment(),
                factory.HelmetOffDialog:talkEndedEvent(),
                factory.HelmetOffDialog:metaRole(),
                factory.HelmetOffDialog:config()
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:onTalkEvent()
        factory.HelmetOffDialog:onTalkEvent()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.OnTalkEvent.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/OnTalkEvent.lua")
    end)
end)

describe("HelmetOffDialog.timedTrigger:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:timedTrigger()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.TimedTrigger.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.TimedTrigger),
                factory.script
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:timedTrigger()
        factory.HelmetOffDialog:timedTrigger()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.TimedTrigger.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/TimedTrigger.lua")
    end)
end)

describe("HelmetOffDialog.itemCategory:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:itemCategory()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.ItemCategory.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.ItemCategory),
                factory.itemManager
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:itemCategory()
        factory.HelmetOffDialog:itemCategory()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.ItemCategory.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/ItemCategory.lua")
    end)
end)

describe("HelmetOffDialog.equippedItem:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:equippedItem()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.EquippedItem.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.EquippedItem),
                factory.player,
                factory.script,
                factory.itemManager
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:equippedItem()
        factory.HelmetOffDialog:equippedItem()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.EquippedItem.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/EquippedItem.lua")
    end)
end)

describe("HelmetOffDialog.commands:", function()
    it("creates a new instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:commands()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Commands.new)
              .was.called_with(
                match.is_ref(factory.HelmetOffDialog.ClassRegistry.Commands),
                factory.system,
                factory.HelmetOffDialog:config()
        )
    end)

    it("caches the instance", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:commands()
        factory.HelmetOffDialog:commands()
        assert.stub(factory.HelmetOffDialog.ClassRegistry.Commands.new)
              .was.called(1)
    end)

    it("loads the script", function()
        local factory = makeFactory()
        factory.HelmetOffDialog:init()
        assert.stub(factory.script.LoadScript)
              .was.called_with("Scripts/HelmetOffDialog/Commands.lua")
    end)
end)

function makeFactory()
    dofile("src/main/Data/Scripts/HelmetOffDialog/utils/dd.lua")
    local factory = {}
    local mockSystem = dofile("tests/main/SystemMock.lua")
    local mockedSystem = mockSystem(mock, spy).system
    _G.System = mockedSystem

    local mockPlayer = dofile("tests/main/PlayerMock.lua")
    local player = mockPlayer(mock, spy)
    _G.player = player
    factory.player = player

    local mockScript = dofile("tests/main/ScriptMock.lua")
    local mockedScript = mockScript(mock, spy)
    _G.Script = mockedScript
    factory.script = mockedScript

    local system = {
        GetEntityByName = function()
        end,
        LogAlways = function()
        end
    }
    factory.system = mock(system, true)
    _G.System = system

    local HelmetOffDialog = dofile("src/main/Data/Scripts/HelmetOffDialog/HelmetOffDialog.lua")
    factory.HelmetOffDialog = HelmetOffDialog

    local Config = dofile("src/main/Data/Scripts/HelmetOffDialog/Config.lua")
    Config = mock(Config, true)
    Config.new = function(self)
        return Config
    end
    Config.new = spy.new(Config.new)
    HelmetOffDialog.ClassRegistry.Config = Config

    local Log = dofile("src/main/Data/Scripts/HelmetOffDialog/utils/Log.lua")
    Log = mock(Log, true)
    Log.new = function(self)
        return Log
    end
    Log.new = spy.new(Log.new)
    HelmetOffDialog.ClassRegistry.Log = Log

    local UnequipGear = dofile("src/main/Data/Scripts/HelmetOffDialog/UnequipGear.lua")
    UnequipGear = mock(UnequipGear, true)
    UnequipGear.new = function(self)
        return UnequipGear
    end
    HelmetOffDialog.ClassRegistry.UnequipGear = UnequipGear

    local ItemCategory = dofile("src/main/Data/Scripts/HelmetOffDialog/ItemCategory.lua")
    ItemCategory = mock(ItemCategory, true)
    ItemCategory.new = function(self)
        return ItemCategory
    end
    ItemCategory.new = spy.new(ItemCategory.new)
    HelmetOffDialog.ClassRegistry.ItemCategory = ItemCategory

    local EquippedItem = dofile("src/main/Data/Scripts/HelmetOffDialog/EquippedItem.lua")
    EquippedItem = mock(EquippedItem, true)
    EquippedItem.new = function(self)
        return EquippedItem
    end
    EquippedItem.new = spy.new(EquippedItem.new)
    HelmetOffDialog.ClassRegistry.EquippedItem = EquippedItem

    local Equipment = dofile("src/main/Data/Scripts/HelmetOffDialog/Equipment.lua")
    Equipment = mock(Equipment, true)
    Equipment.new = function(self)
        return Equipment
    end
    Equipment.new = spy.new(Equipment.new)
    HelmetOffDialog.ClassRegistry.Equipment = Equipment

    local UnequipGear = dofile("src/main/Data/Scripts/HelmetOffDialog/UnequipGear.lua")
    local unequipGear = mock(UnequipGear, true)
    unequipGear.new = spy.new(function(self)
        return unequipGear
    end)
    HelmetOffDialog.ClassRegistry.UnequipGear = unequipGear

    local TalkEndedEvent = dofile("src/main/Data/Scripts/HelmetOffDialog/TalkEndedEvent.lua")
    local talkEndedEvent = mock(TalkEndedEvent, true)
    TalkEndedEvent.new = spy.new(function(self)
        return talkEndedEvent
    end)
    HelmetOffDialog.ClassRegistry.TalkEndedEvent = talkEndedEvent

    local MetaRole = dofile("src/main/Data/Scripts/HelmetOffDialog/MetaRole.lua")
    local metaRole = mock(MetaRole, true)
    metaRole.new = spy.new(function()
        return talkEndedEvent
    end)
    HelmetOffDialog.ClassRegistry.MetaRole = MetaRole

    local TimedTrigger = dofile("src/main/Data/Scripts/HelmetOffDialog/TimedTrigger.lua")
    local timedTrigger = mock(TimedTrigger, true)
    timedTrigger.new = spy.new(function()
        return timedTrigger
    end)
    HelmetOffDialog.ClassRegistry.TimedTrigger = TimedTrigger

    local Error = dofile("src/main/Data/Scripts/HelmetOffDialog/utils/Error.lua")
    local error = mock(Error, true)
    error.new = spy.new(function()
        return error
    end)
    HelmetOffDialog.ClassRegistry.Error = error

    local OnTalkEvent = dofile("src/main/Data/Scripts/HelmetOffDialog/OnTalkEvent.lua")
    local onTalkEvent = mock(OnTalkEvent, true)
    onTalkEvent.new = spy.new(function()
        return onTalkEvent
    end)
    HelmetOffDialog.ClassRegistry.OnTalkEvent = onTalkEvent

    local Commands = dofile("src/main/Data/Scripts/HelmetOffDialog/Commands.lua")
    local commands = mock(Commands, true)
    commands.new = spy.new(function()
        return commands
    end)
    HelmetOffDialog.ClassRegistry.Commands = commands

    return factory
end