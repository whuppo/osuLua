#osuLua

##Please look at the base documentation on the original API page.

###https://osu.ppy.sh/api/

###Overview

All this does is create functions for the ease of use for the osu!api in Lua.

###Dependancies
- [Simple JSON Encode/Decode in Pure Lua](http://regex.info/blog/lua/json)
- [LuaSocket](http://w3.impa.br/~diego/software/luasocket/)

###Installation

After installing the correct dependancies, place `osuapi.lua` in the same folder as your project and add the following line.

`dofile( 'osufile.lua' )`

###Usage

Arguments and responses are the same on the original API documentation page.

*Responses are returned as tables, not as JSON.*

- `osu:GetBeatmaps( key, since, beatmapset_id, beatmap_id, user_id, user_type, mode, autoconvert, limit )`
- `osu:GetUser( key, user_id, mode, user_type, event_days )`
- `osu:GetScores( key, beatmap_id, user_id, mode, user_type )`
- `osu:GetUserBest( key, user_id, mode, limit, user_type )`
- `osu:GetUserRecent( key, user_id, mode, limit, user_type )`
- `osu:GetMatch( key, match_id )`
