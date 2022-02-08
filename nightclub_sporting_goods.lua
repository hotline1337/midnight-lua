-- made by hotline
-- github.com/hotline1337

function OnInit()
    local local_player = player.index()
    if not player.is_connected(local_player) or not player.is_valid(local_player) then
        return
    end

    script_global:new(0x45E4F):set_int64(3300000) -- set 1 crate sale to 3m
end
