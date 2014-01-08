-module(troodon_cam_sup).

-behaviour(supervisor).

%% API
-export([start_link/0
	]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%% ===================================================================
%% API functions
%% ===================================================================
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {simple_one_for_one, 5, 10},
           [{troodon_cam, {troodon_cam, start_link, []}, transient, 5000, worker, [troodon_cam]}] } }.
