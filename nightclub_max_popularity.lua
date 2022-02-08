-- made by hotline
-- github.com/hotline1337

require("lib/natives")

local function handle_mp_index(index)
    if index == 0 then 
        return "MP0_" 
    else
        return "MP1_"
    end
end

system.fiber(function()
    local player_index = script_global:new(1574907):get_int64()
    STATS.STAT_SET_INT(string.smart_joaat(handle_mp_index(player_index) .. "CLUB_POPULARITY"), 1000)
    utils.notify("Nightclub Popularity", "Successfully changed your club popularity to max", 28, 1)
end)
