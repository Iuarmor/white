local LuaArmorList = {
    Users = {
        ["PlayerName1"] = "7d", -- Whitelisted for 7 days
        ["PlayerName2"] = "30d", -- Whitelisted for 30 days
        ["PlayerName3"] = "Lifetime" -- Lifetime whitelist
    }
}

local function isWhitelisted(playerName)
    local duration = LuaArmorList.Users[playerName]
    if duration then
        return true, duration
    else
        return false, nil
    end
end

-- Example usage:
game.Players.PlayerAdded:Connect(function(player)
    local whitelisted, duration = isWhitelisted(player.Name)
    if whitelisted then
        print("You are whitelisted for " .. duration .. ". Enjoy your access!")
    else
        player:Kick("You are not whitelisted. Please contact support.")
    end
end)
