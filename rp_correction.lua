-- made by hotline / github.com/hotline1337

require("lib/natives")

local function desired_rp_level = 500

local function handle_mp_index(index)
    if index == 0 then 
        return "MP0_" 
    else
        return "MP_1_" 
    end
end

local function correct_rp(value)
    local player_index = script_global:new(1574907):get_int64()
    local rp_amount = script_global:new(1655629 + player_index):get_int64()
    local rp_level = 0
	for i = 0,8000 do
		if rp_amount < script_global:new(294329 + i):get_int64() then
			break
		else
			rp_level = i
		end
	end
    
    local new_rp = script_global:new(294329 + value):get_int64() + 100
    system.fiber(function()
        STATS.STAT_SET_INT(string.smart_joaat(handle_mp_index(player_index) .. "CHAR_SET_RP_GIFT_ADMIN"), new_rp)
    end)
    utils.notify("RP Correction", "Your RP has been corrected to " .. new_rp, 14, 1)
end

correct_rp(desired_rp_level)
