it("loads the mod", function()
    local factory = makeFactory()
    dofile("src/main/Data/Scripts/Startup/HelmetOffDialog_Startup.lua")
    assert.spy(factory.Script.LoadScript)
          .was
          .called_with("Scripts/HelmetOffDialog/HelmetOffDialog.lua")
end)

it("initializes the mod", function()
    local factory = makeFactory()
    dofile("src/main/Data/Scripts/Startup/HelmetOffDialog_Startup.lua")
    assert.spy(factory.HelmetOffDialog.init).was.called()
end)

function makeFactory()
    local factory = {}
    _G.System = { LoadScript = function()
    end }
    _G.Script = { LoadScript = function()
    end }
    _G.Entity = { GetPos = function()
    end }
    _G.UIAction = { RegisterEventSystemListener = function()
    end }
    _G.HelmetOffDialog = nil
    local HelmetOffDialog = dofile("src/main/Data/Scripts/HelmetOffDialog/HelmetOffDialog.lua")
    factory.HelmetOffDialog = mock(HelmetOffDialog, true)
    factory.Script = mock(Script, true)

    return factory
end
