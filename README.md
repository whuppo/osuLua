#osuLua

##Please look at the base documentation on the original API page.

###https://osu.ppy.sh/api/

###Overview

All this does is create functions for the ease of use for the osu!api in Lua.

###Dependancies
- [Simple JSON Encode/Decode in Pure Lua](http://regex.info/blog/lua/json)
- [LuaSocket](http://w3.impa.br/~diego/software/luasocket/)

###Installation

After installing the correct dependancies, place `osuapi.lua` in the same folder as your project and add the following line to the top of your file.

`dofile( 'osufile.lua' )`

###Usage

Arguments and responses are the same on the original API documentation page.

*Responses are returned as tables, not as JSON.*

- `osu:GetBeatmaps( k, since, s, b, u, type, m, a, limit )`
- `osu:GetUser( k, u, m, type, event_days )`
- `osu:GetScores( k, b, u, m, type )`
- `osu:GetUserBest( k, u, m, limit, type )`
- `osu:GetUserRecent( k, u, m, limit, type )`
- `osu:GetMatch( k, mp )`