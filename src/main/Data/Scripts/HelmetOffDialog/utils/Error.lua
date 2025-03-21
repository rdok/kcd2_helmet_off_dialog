--- @class Error
--- @field new fun(self: Error, log: Log): Log
--- @field catch fun(self: Error, func: function, ...): boolean, any
--- @field log Log

local Error = {
    log = nil,
    new = function(self, log)
        if HelmetOffDialog.__factories.error then
            return HelmetOffDialog.__factories.error
        end
        local instance = { log = log }
        setmetatable(instance, { __index = self })
        HelmetOffDialog.__factories.error = instance
        return instance
    end,
    catch = function(self, func, ...)
        local success, result = pcall(func, ...)
        if not success then
            local stackTrace = debug.traceback(tostring(result))
            HelmetOffDialog:log():error(tostring(stackTrace))
        end
        return success, result
    end
}

_G.HelmetOffDialog.ClassRegistry.Error = Error

return Error