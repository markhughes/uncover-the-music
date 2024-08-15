_level0.debug("Shell: Load Game");
_level1._visible = false;
_level1.gotoAndPlay("Dormant");
_level2._visible = false;
_level2.gotoAndPlay("Dormant");
this.gameLoaded = function()
{
   _level0.debug("Shell.gameLoaded()");
   _level1._visible = false;
   _level0.gotoAndPlay("Load Game Static Assets");
   _level1.gotoAndPlay("Dormant");
};
this.gameResourcesLoaded = function()
{
   _level0.debug("Shell.gameResourcesLoaded()");
   _level0.gotoAndPlay("Active");
};
_level0.mcPreloader.load("game112.swf",1,this,"gameLoaded","The Game");
stop();
