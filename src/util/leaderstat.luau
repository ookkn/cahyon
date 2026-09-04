local leaderstat = {}
leaderstat.__index = leaderstat

local signal = require("../signal_leitnick")


-- Used in the constructor in the case the developer has made a leaderstat without the module
-- Make a leaderstats folder for the player if it doesn't exist


local function getOrNewLeaderstats(player: Player): Folder
    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then
        leaderstats = Instance.new("Folder")
        leaderstats.Name = "leaderstats"
        leaderstats.Parent = player
    end
    return leaderstats
end

-- Used in the constructor to create a value instance the roblox leaderstat can read. Destroyed in the destructor
-- Create a value instance of the appropriate type.
local function createLeaderstat(player: Player, name: string, value)
    local leaderstat -- Keep it nil to be generic
    if typeof(value) == "number" then
        leaderstat = Instance.new("NumberValue")
    elseif typeof(value) == "string" then
        leaderstat = Instance.new("StringValue")
    elseif typeof(value) == "boolean" then
        leaderstat = Instance.new("BoolValue")
    else
        error("Unsupported value type for leaderstat: " .. typeof(value))
        return nil
    end

    -- Set properties
    leaderstat.Name = name
    leaderstat.Value = value
    leaderstat.Parent = getOrNewLeaderstats(player)
    return leaderstat
end


-- Constructor function
function leaderstat.new(player: Player, name: string, value: number)
    local self = setmetatable({
        OnValueChanged = signal.new(),
        _player = player, -- Owner
        _name = name, -- Name
        _value = value, -- Bool, string, number
        _folder = getOrNewLeaderstats(player), -- player.leaderstats
        _linkedInstance = nil, -- Keep it nil to be generic
    }, leaderstat)
    
    self._linkedInstance = createLeaderstat(player, name, value)
    if not self or not self._linkedInstance or not self._folder then
        error("[Cahyon] [Cahyon/leaderstat] Failed to create leaderstat instance. Folder may be altered or the instance was not properly destructed/created")
    end
    return self
end


-- This group does not need a explanaition

function leaderstat:setValue(value: number)
    self._value = value
    if self._linkedInstance then
        self._linkedInstance.Value = value
    end
    self.OnValueChanged:Fire(value)
end

function leaderstat:getValue(): number
    return self._value
end

function leaderstat:destroy()
    if self._linkedInstance then
        self._linkedInstance:Destroy()
        self._linkedInstance = nil
    end
    table.clear(self)
    setmetatable(self, nil)
end
return leaderstat
