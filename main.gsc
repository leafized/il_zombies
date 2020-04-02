/*
*    Infinity Loader :: Created By AgreedBog381 && SyGnUs Legends
*
*    Project : MW2 Zombie Land
*    Author : 
*    Game : MW2
*    Description : Starts Multiplayer code execution!
*    Date : 4/2/2020 5:25:56 AM
*
*/

//All MP files are supported, if something doesnt work, let us know!
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

//Preprocessor Global Chaining
#define WELCOME_MSG = BASE_MSG + GREEN + PROJECT_TITLE;

//Preprocessor Globals
#define GREEN = "^2";
#define BASE_MSG = "Infinity Loader | Project: ";
#define PROJECT_TITLE = "MW2 Zombie Land";

init()
{
    level thread onPlayerConnect();
    level thread init_gamemode();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
    level endon("game_ended");
    for(;;)
    {
        self waittill("spawned_player");
        if(isDefined(self.playerSpawned))
            continue;
        self.playerSpawned = true;
        if(self IsHost() && level.overFlowFix_Started)
        {
            thread init_overFlowFix();
        }
    }
}