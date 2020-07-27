-module(mp3sync).
-export([find_sync/2]).



find_sync(Bin, N) ->
case is_header(N, Bin) of
{ok, Len1, _} ->
case is_header(N + Len1, Bin) of
{ok, Len2, _} ->
case is_header(N + Len1 + Len2, Bin) of
{ok, _, _} -> {ok, N};
error ->
find_sync(Bin, N+1)
end; error ->
 end.
end; error ->
        find_sync(Bin, N+1)
find_sync(Bin, N+1)