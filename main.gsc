/*
*    Infinity Loader :: Created By AgreedBog381 && SyGnUs Legends
*
*    Project : IL Zombie Land
*    Author : Leafized
*    Game : MW2 + MW3
*    Description : This mod is my take on the infamous INFECTED gamemode.
     the reason i'm doing this game mode, is to give players another game
     mode to play, i hate vanilla COD as it is. Enjoy <3
     
*    Date : 4/2/2020 5:25:56 AM
*    Current Build Version: 0.0.0a
*/

//All MP files are supported, if something doesnt work, let us know!
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

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