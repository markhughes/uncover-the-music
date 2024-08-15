onClipEvent(load){
   this.reset = function()
   {
      var _loc1_ = this;
      _loc1_._bDebug = false;
      _loc1_._bActive = false;
      _loc1_.mcProgress._xscale = 0;
      _loc1_._visible = false;
      _loc1_._sFile = null;
      _loc1_._mcClip = null;
      _loc1_._oCallbackObject = null;
      _loc1_._sCallbackMethod = null;
   };
   this.load = function(sFile, mcClip, oCallbackObject, sCallbackMethod, sDisplayName, sFileProgress)
   {
      var _loc1_ = this;
      if(_loc1_._bDebug)
      {
         trace("mcPreload_clip.load(" + sFile + "," + mcClip + "," + oCallbackObject + "," + sCallbackMethod + "," + sDisplayName + ")");
      }
      _loc1_._sFile = _loc1_.getLocalPath() + sFile;
      _loc1_._mcClip = mcClip;
      _loc1_._oCallbackObject = oCallbackObject;
      _loc1_._sCallbackMethod = sCallbackMethod;
      _loc1_._sDisplayName = sDisplayName;
      _loc1_._sFileProgress = sFileProgress;
      _loc1_._bActive = true;
      _loc1_._visible = true;
      _loc1_.sStatus = "Loading... " + _loc1_._sDisplayName;
      _loc1_.sProgress = _loc1_._sFileProgress;
      _loc1_._mcClip.loadMovie(_loc1_._sFile);
   };
   this.watch = function(mcClip, oCallbackObject, sCallbackMethod, sDisplayName, sFileProgress)
   {
      var _loc1_ = this;
      if(_loc1_._bDebug)
      {
         trace("mcPreload_clip.watch(" + mcClip + "," + oCallbackObject + "," + sCallbackMethod + ")");
      }
      _loc1_.reset();
      _loc1_._mcClip = mcClip;
      _loc1_._oCallbackObject = oCallbackObject;
      _loc1_._sCallbackMethod = sCallbackMethod;
      _loc1_._sDisplayName = sDisplayName;
      _loc1_._sFileProgress = sFileProgress;
      _loc1_.sStatus = "Loading... " + _loc1_._sDisplayName;
      _loc1_.sProgress = _loc1_._sFileProgress;
      _loc1_._bActive = true;
      _loc1_._visible = true;
   };
   this.reset();
}
