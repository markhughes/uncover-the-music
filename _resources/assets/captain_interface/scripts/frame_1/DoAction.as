function Timer()
{
   this._bDebug = true;
   if(this._bDebug)
   {
      trace("new Timer()");
   }
   this._STARTING = "Starting";
   this._STOPPED = "Stopped";
   this._RUNNING = "Running";
   this.reset();
}
function CaptainInterface(mcRoot)
{
   this._bDebug = true;
   if(this._bDebug)
   {
      trace("new CaptainInterface(" + mcClip + ")");
   }
   this._mcRoot = mcRoot;
   this._oTimer = new this._mcRoot.Timer();
   this.hide();
}
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
CaptainInterface.prototype.displayInstructions = function(sInstructions)
{
   if(this._bDebug)
   {
      trace("CaptainInterface.displayInstructions(" + sInstructions + ")");
   }
   this._mcRoot.mcInstructions.sInstructions = sInstructions;
};
CaptainInterface.prototype.display = function()
{
   if(this._bDebug)
   {
      trace("CaptainInterface.display()");
   }
   this._mcRoot.mcInstructions._visible = true;
   this._mcRoot.mcCountDown._visible = true;
   this._mcRoot.mcBackground._visible = true;
};
CaptainInterface.prototype.hide = function()
{
   if(this._bDebug)
   {
      trace("CaptainInterface.hide()");
   }
   this._oTimer.reset();
   this._mcRoot.mcInstructions._visible = false;
   this._mcRoot.mcStart._visible = false;
   this._mcRoot.mcWait._visible = false;
   this._mcRoot.mcCountDown._visible = false;
   this._mcRoot.mcBackground._visible = false;
};
CaptainInterface.prototype.displayWait = function(bVisible)
{
   this._mcRoot.mcWait._visible = bVisible;
};
CaptainInterface.prototype.wait = function()
{
   if(this._bDebug)
   {
      trace("CaptainInterface.wait()");
   }
   _level1._oGameController.waitForMorePlayers();
   this._mcRoot.mcStart._visible = true;
   this._mcRoot.mcWait._visible = false;
};
CaptainInterface.prototype.displayStart = function(bVisible)
{
   this._mcRoot.mcStart._visible = bVisible;
};
CaptainInterface.prototype.start = function()
{
   if(this._bDebug)
   {
      trace("CaptainInterface.start()");
   }
   _level1._oGameController.startGame();
   this.displayStart(false);
   this.displayWait(false);
};
CaptainInterface.prototype.displayCountdown = function(iTimerLength)
{
   if(this._bDebug)
   {
      trace("CaptainInterface.displayCountdown(" + iTimerLength + ")");
   }
   this._oTimer.reset();
   this._oTimer.setCallback(this,"displayCountDownTimer",1000);
   this._oTimer.start(iTimerLength);
   this._mcRoot.mcCountDown._visible = true;
};
CaptainInterface.prototype.displayCountDownTimer = function(sState, iElapsedTime, iTimerLength)
{
   if(this._bDebug)
   {
      trace("CaptainInterface.displayCountDownTimer(" + sState + "," + iElapsedTime + "," + iTimerLength + ")");
   }
   var iCountDown = Math.ceil((iTimerLength - iElapsedTime) / 1000);
   var sCountDown = "" + iCountDown;
   if(iCountDown < 10 && 0 < iCountDown)
   {
      sCountDown = "0" + iCountDown;
   }
   this._mcRoot.mcCountDown.sCountDown = sCountDown;
   if(sState == this._oTimer._STOPPED)
   {
      this._oTimer.reset();
      this.hide();
   }
};
this._oCaptainInterface = new CaptainInterface(this);
stop();
