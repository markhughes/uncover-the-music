onClipEvent(enterFrame){
   if(!this._bActive)
   {
      return undefined;
   }
   var lTarget = _level0["_level" + this._iLevelNum];
   if(lTarget == null)
   {
      return undefined;
   }
   var iTotalBytes = lTarget.getBytesTotal();
   var iBytesLoaded = lTarget.getBytesLoaded();
   var iPercentLoaded = Math.floor(iBytesLoaded / iTotalBytes * 100);
   this.mcProgress._xscale = iPercentLoaded;
   if(this._bDebug)
   {
      trace("loading... iTotalBytes: " + iTotalBytes + "," + "iBytesLoaded: " + iBytesLoaded + "," + "iPercentLoaded: " + iPercentLoaded);
   }
   if(iPercentLoaded == 100)
   {
      this._oCallbackObject[this._sCallbackMethod]();
      this.reset();
   }
}
