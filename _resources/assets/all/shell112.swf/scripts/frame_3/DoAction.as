function closeWindow()
{
   getUrl("javascript:closeWindow();", "");
}
function debug(m, bForce)
{
   if(_level0._bDebugWindow || bForce)
   {
      _level3.addText(m);
   }
   if(_level0._bDebugOutput || bForce)
   {
      trace(m);
   }
}
trace("Shell: Load Shell");
MovieClip.prototype.getLocalPath = function()
{
   var _loc3_ = this._url;
   var sPath;
   var _loc1_ = _loc3_.length - 1;
   while(_loc1_ >= 0)
   {
      var _loc2_ = _loc3_.charAt(_loc1_);
      if(_loc2_ == "/")
      {
         var sPath = _loc3_.substring(0,_loc1_ + 1);
         break;
      }
      _loc1_ = _loc1_ - 1;
   }
   return sPath;
};
_level0._revealChallengeVersion = "1.0";
this.shellLoaded = function()
{
   trace("shellLoaded()");
   _level0.gotoAndPlay("Includes");
};
_level0.mcPreloader.watch(0,this,"shellLoaded","Uncover the Music");
stop();
