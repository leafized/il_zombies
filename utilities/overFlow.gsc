_setText(string)
{
    self.string = string;
    self setText(string);
    self addString(string);
    self thread fix_string();
}
init_overFlowFix()
{
    level.overFlowFix_Started = true;
    level.strings = [];
    
    level.overflowElem = createServerFontString("default",1.5);
    level.overflowElem setText("overflow");   
    level.overflowElem.alpha = 0;
    
    level thread overflowfix_monitor();
}
fix_string()
{
    self notify("new_string");
    self endon("new_string");
    while(isDefined(self))
    {
        level waittill("overflow_fixed");
        if(isDefined(self.string))
        {
            self _setText(self.string);
        }
    }
}
OverFlowTest(testFix = true)
{
    self endon("stop_test");
    self.testText = createText("default",2.0,"CENTER","CENTER",0,0,0,(1,0,0),1,(0,0,0),0);
    i             = 0;
    for(;;)
    {
            self.testText _setText("Strings: " + i);
        i++;
        wait 0.05;
    }
}
doTest()
{
    if(!isDefined(self.testText))
    {
        self exitMenu();
        self thread OverFlowTest(true);
    }
    else
    {
        
        self notify("stop_test");
        self.testText destroy();
    }
}
addString(string)
{
    if(!inArray(level.strings,string))
    {
        level.strings[level.strings.size] = string;
        level notify("string_added");
    }
}
inArray(ar,string)
{
    array = [];
    array = ar;
    for(i=0;i<array.size;i++)
    {
        if(array[i]==string)
        {
            return true;
        }
    }
    return false;      
}
overflowfix_monitor()
{  
  
    level endon("game_ended");
    for(;;)
    {

        level waittill("string_added");
        if(level.strings.size >= 90)
        {
            level.overflowElem ClearAllTextAfterHudElem();
            level.strings = [];
            level notify("overflow_fixed");
            
            foreach(player in level.players)
            player iprintln( "^5overflow reset!" );
        }
        wait 0.01; 
    }
}
