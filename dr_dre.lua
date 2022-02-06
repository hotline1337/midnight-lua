-- made by hotline
-- github.com/hotline1337

require("lib/natives")

function get_mp_index()
	local index = script_global:new(0x1807FB):get_int64()
    if index == 0 then 
        return "MP0_" 
    else
        return "MP1_"
    end
end

function start_dr_dre()
	system.fiber(function()
		STATS.STAT_SET_INT(string.joaat(get_mp_index() .. "FIXER_STORY_BS"), 0xFFC)
		STATS.STAT_SET_INT(string.joaat(get_mp_index() .. "FIXER_STORY_STRAND"), -1)
		STATS.STAT_SET_INT(string.joaat(get_mp_index() .. "FIXER_GENERAL_BS"), -1)
		STATS.STAT_SET_INT(string.joaat(get_mp_index() .. "FIXER_FIXER_COMPLETED_BS"), -1)
		STATS.STAT_SET_INT(string.joaat(get_mp_index() .. "FIXER_STORY_BS"), -1)
		STATS.STAT_SET_INT(string.joaat(get_mp_index() .. "FIXER_STORY_COOLDOWN"), -1)
	end)
	return true
end

function increase_payout()
	system.fiber(function()
		script_global:new(0x47A8E):set_int64(2400000)
	end)
	return true
end

local next_ticks = 0
local handler = {
	dr_dre_started = false,
	should_execute = false,
	execute_tick = true
}
function OnFeatureTick()
	local current_ticks = system.ticks()
	if next_ticks > current_ticks then 
		return 
	end
	next_ticks = current_ticks + 20000

	if handler["execute_tick"] and handler["dr_dre_started"] then
		handler["should_execute"] = true
		handler["execute_tick"] = false
	end
end

function OnInit()
	local local_player = player.index()
	if not player.is_valid(local_player) or not player.is_connected(local_player) then
		utils.notify("Dr. Dre Finale", "Join the game and reload the script", 2, 4)
		return
	end

	-- Starts Dr. Dre mission with a 1$ million payout
	if start_dr_dre() then
		handler["dr_dre_started"] = true
		utils.notify("Dr. Dre Finale", "Successfully started Dr.Dre mission", 28, 1)
	end
	-- Increases the payout of the Dr. Dre mission to 2.4$ million
	if handler["should_execute"] and increase_payout() then
		utils.notify("Dr. Dre Finale", "Successfully increased your payout", 28, 1)
	end
end
