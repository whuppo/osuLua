-- written by whuppo

JSON = require( 'JSON' )
HTTP = require( 'socket.http' )

osu = {}

osu.APIUrl           = "https://osu.ppy.sh/api/"

osu.APIGetBeatmaps   = osu.APIUrl .. "get_beatmaps"
osu.APIGetUser       = osu.APIUrl .. "get_user"
osu.APIGetScores     = osu.APIUrl .. "get_scores"
osu.APIGetUserBest   = osu.APIUrl .. "get_user_best"
osu.APIGetUserRecent = osu.APIUrl .. "get_user_recent"
osu.APIGetMatch      = osu.APIUrl .. "get_match"

function osu.GetBeatmaps( k, since, s, b, u, type, m, a, limit )
	if not k then error( "API key expected.", 2 ) end

	local fetch = "?k=" .. k
	if since then fetch = fetch .. "&since=" .. since
	if s     then fetch = fetch .. "&s="     .. s
	if b     then fetch = fetch .. "&b="     .. b
	if u     then fetch = fetch .. "&u="     .. u
	if type  then fetch = fetch .. "&type="  .. type
	if m     then fetch = fetch .. "&m="     .. m
	if a     then fetch = fetch .. "&a="     .. a
	if limit then fetch = fetch .. "&limit=" .. limit

	local data = HTTP.request( osu.APIGetBeatmaps .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu.GetUser( k, u, m, type, event_days )
	if not k then error( "API key expected.", 2 ) end
	if not u then error( "user_id or a username expected.", 2 ) end

	local fetch = "?k=" .. k .. "&u=" .. u
	if m          then fetch = fetch .. "&m="          .. m
	if type       then fetch = fetch .. "&type="       .. type
	if event_days then fetch = fetch .. "&event_days=" .. event_days

	local data = HTTP.request( osu.APIGetUser .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data[ 1 ]
end

function osu.GetScores( k, b, u, m, type )
	if not k then error( "API key expected.", 2 ) end
	if not b then error( "beatmap_id expected.", 2 ) end

	local fetch = "?k=" .. k .. "&b=" .. b
	if u    then fetch = fetch .. "&u="    .. u
	if m    then fetch = fetch .. "&m="    .. m
	if type then fetch = fetch .. "&type=" .. type

	local data = HTTP.request( osu.APIGetScores .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu.GetUserBest( k, u, m, limit, type )
	if not k then error( "API key expected.", 2 ) end
	if not u then error( "user_id or a username expected.", 2 ) end

	local fetch = "?k=" .. k .. "&u=" .. u
	if m     then fetch = fetch .. "&m="     .. m
	if limit then fetch = fetch .. "&limit=" .. limit
	if type  then fetch = fetch .. "&type="  .. type

	local data = HTTP.request( osu.APIGetUserBest .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu.GetUserRecent( k, u, m, limit, type )
	if not k then error( "API key expected.", 2 ) end
	if not u then error( "user_id or a username expected.", 2 ) end

	local fetch = "?k=" .. k .. "&u=" .. u
	if m     then fetch = fetch .. "&m="     .. m
	if limit then fetch = fetch .. "&limit=" .. limit
	if type  then fetch = fetch .. "&type="  .. type

	local data = HTTP.request( osu.APIGetUserBest .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end

function osu.GetMatch( k, mp )
	if not k then error( "API key expected.", 2 ) end
	if not mp then error( "match id expected.", 2 ) end

	local fetch = "?k=" .. k .. "&mp=" .. mp

	local data = HTTP.request( osu.APIGetUserBest .. fetch )
	data = JSON:decode( data )

	if data.error then error( data.error, 2 ) end

	return data
end
