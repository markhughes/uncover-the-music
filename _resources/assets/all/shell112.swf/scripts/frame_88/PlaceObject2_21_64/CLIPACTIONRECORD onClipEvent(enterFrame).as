onClipEvent(enterFrame){
   if(!this._bActive)
   {
      return undefined;
   }
   var lTarget = this._mcClip;
   if(lTarget == null)
   {
      trace("lTarget == null");
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
      this._bActive = false;
      this._oCallbackObject[this._sCallbackMethod](this._sFile);
   }
}
