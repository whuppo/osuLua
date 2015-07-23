-- written by whuppo
-- https://osu.ppy.sh/api
-- https://github.com/whuppo/osuLua

JSON = require( 'JSON' )        -- Simple JSON Encode/Decode in Pure Lua
HTTP = require( 'socket.http' ) -- LuaSocket

osu = {}

osu.APIUrl           = "https://osu.ppy.sh/api/"

osu.APIGetBeatmaps   = osu.APIUrl .. "get_beatmaps"
osu.APIGetUser       = osu.APIUrl .. "get_user"
osu.APIGetScores     = osu.APIUrl .. "get_scores"
osu.APIGetUserBest   = osu.APIUrl .. "get_user_best"
osu.APIGetUserRecent = osu.APIUrl .. "get_user_recent"
osu.APIGetMatch      = osu.APIUrl .. "get_match"

function osu:GetBeatmaps( key, since, beatmapset_id, beatmap_id, user_id, user_type, mode, autoconvert, limit )
	if not key then error( "API key expected.", 2 ) end

	local fetch = "?k=" .. key
	if since         then fetch = fetch .. "&since=" .. since end
	if beatmapset_id then fetch = fetch .. "&s="     .. beatmapset_id end
	if beatmap_id    then fetch = fetch .. "&b="     .. beatmap_id end
	if user_id       then fetch = fetch .. "&u="     .. user_id end
	if user_type     then fetch = fetch .. "&type="  .. user_type end
	if mode          then fetch = fetch .. "&m="     .. mode end
	if autoconvert   then fetch = fetch .. "&a="     .. autoconvert end
	if limit         then fetch = fetch .. "&limit=" .. limit end

	local data = HTTP.request( osu.APIGetBeatmaps .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu:GetUser( key, user_id, mode, user_type, event_days )
	if not key then error( "API key expected.", 2 ) end
	if not user_id then error( "user_id or a username expected.", 2 ) end

	local fetch = "?k=" .. key .. "&u=" .. user_id
	if mode       then fetch = fetch .. "&m="          .. mode end
	if user_type  then fetch = fetch .. "&type="       .. user_type end
	if event_days then fetch = fetch .. "&event_days=" .. event_days end

	local data = HTTP.request( osu.APIGetUser .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data[ 1 ]
end

function osu:GetScores( key, beatmap_id, user_id, mode, user_type )
	if not key then error( "API key expected.", 2 ) end
	if not beatmap_id then error( "beatmap_id expected.", 2 ) end

	local fetch = "?k=" .. key .. "&b=" .. beatmap_id
	if user_id   then fetch = fetch .. "&u="    .. user_id end
	if mode      then fetch = fetch .. "&m="    .. mode end
	if user_type then fetch = fetch .. "&type=" .. user_type end

	local data = HTTP.request( osu.APIGetScores .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu:GetUserBest( key, user_id, mode, limit, user_type )
	if not key then error( "API key expected.", 2 ) end
	if not user_id then error( "user_id or a username expected.", 2 ) end

	local fetch = "?k=" .. key .. "&u=" .. user_id
	if mode      then fetch = fetch .. "&m="     .. mode end
	if limit     then fetch = fetch .. "&limit=" .. limit end
	if user_type then fetch = fetch .. "&type="  .. user_type end

	local data = HTTP.request( osu.APIGetUserBest .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu:GetUserRecent( key, user_id, mode, limit, user_type )
	if not key then error( "API key expected.", 2 ) end
	if not user_id then error( "user_id or a username expected.", 2 ) end

	local fetch = "?k=" .. key .. "&u=" .. user_id
	if mode      then fetch = fetch .. "&m="     .. mode end
	if limit     then fetch = fetch .. "&limit=" .. limit end
	if user_type then fetch = fetch .. "&type="  .. user_type end

	local data = HTTP.request( osu.APIGetUserRecent .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu:GetMatch( key, match_id )
	if not key then error( "API key expected.", 2 ) end
	if not match_id then error( "match id expected.", 2 ) end

	local fetch = "?k=" .. key .. "&mp=" .. match_id

	local data = HTTP.request( osu.APIGetMatch .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end
