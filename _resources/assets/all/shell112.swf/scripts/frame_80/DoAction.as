_level0.debug("Shell: Load Lobby");
_level1.gotoAndPlay("Dormant");
_level2.gotoAndPlay("Dormant");
this.lobbyLoaded = function()
{
   _level0.debug("Shell.lobbyLoaded()");
   _level0.gotoAndPlay("Load Avatar");
};
this.lobbyReady = function()
{
   _level0.debug("Shell.lobbyReady()");
};
_level0.mcPreloader.load("lobby112.swf",2,this,"lobbyLoaded","The Lobby");
stop();
