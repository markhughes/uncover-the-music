function Timer()
{
   this._bDebug = false;
   if(this._bDebug)
   {
      trace("new Timer()");
   }
   this._STARTING = "Starting";
   this._STOPPED = "Stopped";
   this._RUNNING = "Running";
   this.reset();
}
function GameTimer(mcRoot)
{
   this._mcRoot = mcRoot;
   this._oTimer = new Timer();
   this._iFirstFrame = 2;
   this._iLastFrame = 81;
   this._bDebug = false;
   if(this._bDebug)
   {
      trace("GameTimer(" + mcRoot + ")");
   }
}
stop();
Timer.prototype.reset = function()
{
   this._iStartTime = null;
   this._iTimerLength = null;
   this._iElapsedTime = null;
   this._bActive = false;
   this._oCallbackObject = null;
   this._sCallbackMethod = null;
   this._iCallbackInterval = null;
   this._iLastUpdateTime = null;
   this._sState = this._STOPPED;
};
Timer.prototype.setCallback = function(oObject, sMethod, iInterval)
{
   if(this._bDebug)
   {
      trace("Timer.setCallback(" + oObject + "," + sMethod + "," + iInterval + ")");
   }
   this._oCallbackObject = oObject;
   this._sCallbackMethod = sMethod;
   this._iCallbackInterval = iInterval;
};
Timer.prototype.start = function(iTimerLength)
{
   if(this._bDebug)
   {
      trace("Timer.start(" + iTimerLength + ")");
   }
   this._bActive = true;
   this._iStartTime = getTimer();
   this._iTimerLength = iTimerLength;
   this._iElapsedTime = 0;
   this._iLastUpdateTime = getTimer();
   this._sState = this._STARTING;
   this.doCallback();
};
Timer.prototype.stop = function()
{
   if(this._bDebug)
   {
      trace("Timer.stop()");
   }
   this._sState = this._STOPPED;
   this.doCallback();
   this.reset();
};
Timer.prototype.doCallback = function()
{
   if(this._bDebug)
   {
      trace("Timer.doCallback()");
   }
   this._oCallbackObject[this._sCallbackMethod](this._sState,this._iElapsedTime,this._iTimerLength);
};
Timer.prototype.enterFrame = function()
{
   if(!this._bActive)
   {
      return undefined;
   }
   this._sState = this._RUNNING;
   var iCurrTime = getTimer();
   this._iElapsedTime = iCurrTime - this._iStartTime;
   if(this._iTimerLength < this._iElapsedTime)
   {
      this.stop();
      return undefined;
   }
   var iElapsedIntervalTime = iCurrTime - this._iLastUpdateTime;
   if(this._iCallbackInterval < iElapsedIntervalTime)
   {
      this.doCallback();
      this._iLastUpdateTime = iCurrTime;
   }
};
GameTimer.prototype.startTimer = function(iLength)
{
   this.resetTimer();
   this._oTimer.setCallback(this,"timerCallback",50);
   this._oTimer.start(iLength);
};
GameTimer.prototype.stopTimer = function()
{
   this.resetTimer();
};
GameTimer.prototype.resetTimer = function()
{
   this._oTimer.reset();
   this._mcRoot.mcTimer.gotoAndStop("Stop");
};
GameTimer.prototype.timerCallback = function(sState, iElapsedTime, iTimerLength)
{
   if(this._bDebug)
   {
      trace("GameTimer.timerCallback(" + sState + "," + iElapsedTime + "," + iTimerLength + ")");
   }
   if(sState == this._oTimer._STOPPED)
   {
      this.stopTimer();
   }
   else
   {
      this.displayTimer(iElapsedTime,iTimerLength);
   }
};
GameTimer.prototype.displayTimer = function(iElapsedTime, iTimerLength)
{
   var iFrame = Math.round(this.mapPoints(iElapsedTime,0,iTimerLength,this._iFirstFrame,this._iLastFrame));
   if(this._bDebug)
   {
      trace("GameTimer.displayTimer(" + iElapsedTime + "," + iTimerLength + "): " + iFrame);
   }
   this._mcRoot.mcTimer.gotoAndStop(iFrame);
};
GameTimer.prototype.mapPoints = function(inVal, inLow, inHi, outLow, outHi)
{
   var outVal = (inVal - inLow) / (inHi - inLow) * (outHi - outLow) + outLow;
   return outVal;
};
this._oGameTimer = new GameTimer(this);
