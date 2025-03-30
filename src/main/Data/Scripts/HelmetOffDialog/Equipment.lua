local Log = HelmetOffDialog.Log

--- @class Equipment
--- @field new fun(self: Equipment, player: _G.player, unequipGear: UnequipGear): Equipment
--- @field putOnCoif fun(self: Equipment)
--- @field putOnHelmet fun(self: Equipment)
--- @field putOnHeadChainmail fun(self: Equipment)
--- @field putOnFirstRangedWeapon fun(self: Equipment)
--- @field putOnSecondRangedWeapon fun(self: Equipment)
--- @field unequipGear UnequipGear
local Equipment = {
    new = function(self, player, unequipGear, itemManager)
        local instance = {
            player = player,
            unequipGear = unequipGear,
            itemManager = itemManager,
            unequippedHelmet = nil,
            unequippedHeadChainmail = nil,
            unequippedCoif = nil,
            firstRangedWeapon = nil,
            secondRangedWeapon = nil
        }
        setmetatable(instance, { __index = self })
        Log.info("Equipment New instance created")
        return instance
    end,

    takeOffHelmet = function(self, callback)
        Log.info("Equipment.takeOffHelmet:called")

        self.unequipGear:takeOff("Helmet", function(item)
            if item then
                self.unequippedHelmet = item
            end
           return callback("done")
        end)
    end,

    takeOffHeadChainmail = function(self, callback)
        Log.info("Equipment.takeOffHeadChainmail:called")
        self.unequipGear:takeOff("HeadChainmail", function(item)
            if item then
                self.unequippedHeadChainmail = item
            end
            return callback("done")
        end)
    end,

    takeOffCoif = function(self, callback)
        Log.info("Equipment.takeOffCoif:called")
        self.unequipGear:takeOff("Coif", function(item)
            if item then
                self.unequippedCoif = item
            end
            callback("done")
        end)
    end,

    takeOffFirstRangedWeapon = function(self, callback)
        Log.info("Equipment.takeOffFirstRangedWeapon:called")
        self.unequipGear:takeOff("RangedWeapon", function(takenOffItem)
            if takenOffItem then
                local item = self.itemManager.GetItem(takenOffItem)
                local itemName = self.itemManager.GetItemName(item.class)
                Log.info("Taking off ranged first weapon", itemName)
                self.firstRangedWeapon = takenOffItem
            end
            callback("done")
        end)
    end,

    takeOffSecondRangedWeapon = function(self, callback)
        Log.info("Equipment.takeOffSecondRangedWeapon:called")
        self.unequipGear:takeOff("RangedWeapon", function(takenOffItem)
            if takenOffItem then
                local item = self.itemManager.GetItem(takenOffItem)
                local itemName = self.itemManager.GetItemName(item.class)
                Log.info("Taking off ranged second weapon", itemName)
                self.secondRangedWeapon = takenOffItem
            end
            callback("done")
        end)
    end,

    putOnCoif = function(self)
        if nil == self.unequippedCoif then
            Log.info("Equipment.putOnCoif: Aborting due to no unequipped coif found")
            return
        end

        local item = self.itemManager.GetItem(self.unequippedCoif)
        local itemName = self.itemManager.GetItemName(item.class)
        Log.info("Putting on coif: ", itemName)
        self.player.actor:EquipInventoryItem(self.unequippedCoif)
        self.unequippedCoif = nil
    end,

    putOnHeadChainmail = function(self)
        if nil == self.unequippedHeadChainmail then
            Log.info("Equipment.putOnHeadChainmail: Aborting due to no unequipped coif found")
            return
        end

        local item = self.itemManager.GetItem(self.unequippedHeadChainmail)
        local itemName = self.itemManager.GetItemName(item.class)
        Log.info("Putting on head chainmail: ", itemName)
        self.player.actor:EquipInventoryItem(self.unequippedHeadChainmail)
        self.unequippedHeadChainmail = nil
    end,

    putOnHelmet = function(self)
        if nil == self.unequippedHelmet then
            Log.info("Aborting due to no unequipped helmet found")
            return
        end

        local item = self.itemManager.GetItem(self.unequippedHelmet)
        local itemName = self.itemManager.GetItemName(item.class)
        Log.info("Putting on helmet: ", itemName)
        self.player.actor:EquipInventoryItem(self.unequippedHelmet)
        self.unequippedHelmet = nil
    end,

    putOnFirstRangedWeapon = function(self)
        if nil == self.firstRangedWeapon then
            Log.info("Aborting due to no first ranged weapon")
            return
        end

        local item = self.itemManager.GetItem(self.firstRangedWeapon)
        local itemName = self.itemManager.GetItemName(item.class)
        Log.info("Putting on first ranged weapon: ", itemName)
        self.player.actor:EquipInventoryItem(self.firstRangedWeapon)
        self.firstRangedWeapon = nil
    end,

    putOnSecondRangedWeapon = function(self)
        if nil == self.secondRangedWeapon then
            Log.info("Aborting due to no second ranged weapon")
            return
        end

        local item = self.itemManager.GetItem(self.secondRangedWeapon)
        local itemName = self.itemManager.GetItemName(item.class)
        Log.info("Putting on second ranged weapon: ", itemName)
        self.player.actor:EquipInventoryItem(self.secondRangedWeapon)
        self.secondRangedWeapon = nil
    end,

}

_G.HelmetOffDialog.ClassRegistry.Equipment = Equipment

return Equipment