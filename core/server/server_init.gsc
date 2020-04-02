init_gamemode()
{
    level precache_assets();
    if(level.infection_begin == false)
    {
        level thread startInfection();
    }
}

startInfection()
{
    foreach(player in level.players)
    {
        player.infect_counter = createServerText("objective",1.5,"CENTER","CENTER",0,0,1,1,level.infect_string["TEXT"]["COUNTDOWN"],(1,1,1));
        player.server_string  = createServerText("objective",1,"CENTER","CENTER",0,20,1,1,level.server_string["TEXT"]["WELCOME"],(1,1,1));
    }
}

infectPlayer()
{
    
}

monitorFirstInfected()
{
    
}


precache_assets()
{
    level thread load_weapons();
    
    shaderArray = [];
    shaderArray = ["gradient_fadein","hudcolorbar", "logo_iw"];
    foreach(shade in shaderArray)
    PreCacheShader( shade );
    thread string_load();
}

string_load()
{
    //infect strings and settings
    level.infect_string["TEXT"]["COUNTDOWN"] = 10;
    
    
    //server strings and settings
    level.server_string["TEXT"]["WELCOME"] = "Welcome to ^2Zombieland\n^7Created with ^5InfinityLoader";
}