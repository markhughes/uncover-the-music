_level0.debug("Shell: Load Avatar");
stop();
this.avatarLoaded = function()
{
   _level0.debug("Shell.avatarLoaded()");
   _level0.gotoAndPlay("Load Game");
};
_level0.mcPreloader.load("resources/avatar_engine.swf",_level0.mcAvatarLoader,this,"avatarLoaded","Vegos");
