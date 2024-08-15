function Timer()
{
   var _loc1_ = this;
   _loc1_._bDebug = true;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._STARTING = "Starting";
   _loc1_._STOPPED = "Stopped";
   _loc1_._RUNNING = "Running";
   _loc1_.reset();
}
function ChatInput(mcRoot)
{
   var _loc1_ = this;
   _loc1_._bDebug = true;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._mcRoot = mcRoot;
   _loc1_._bEnabled = false;
   _loc1_._oTimer = new _loc1_._mcRoot.Timer();
}
stop();
Timer.prototype.reset = function()
{
   var _loc1_ = this;
   _loc1_._iStartTime = null;
   _loc1_._iTimerLength = null;
   _loc1_._iElapsedTime = null;
   _loc1_._bActive = false;
   _loc1_._oCallbackObject = null;
   _loc1_._sCallbackMethod = null;
   _loc1_._iCallbackInterval = null;
   _loc1_._iLastUpdateTime = null;
   _loc1_._sState = _loc1_._STOPPED;
};
Timer.prototype.setCallback = function(oObject, sMethod, iInterval)
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._oCallbackObject = oObject;
   _loc1_._sCallbackMethod = sMethod;
   _loc1_._iCallbackInterval = iInterval;
};
Timer.prototype.start = function(iTimerLength)
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._bActive = true;
   _loc1_._iStartTime = getTimer();
   _loc1_._iTimerLength = iTimerLength;
   _loc1_._iElapsedTime = 0;
   _loc1_._iLastUpdateTime = getTimer();
   _loc1_._sState = _loc1_._STARTING;
   _loc1_.doCallback();
};
Timer.prototype.stop = function()
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._sState = _loc1_._STOPPED;
   _loc1_.doCallback();
   _loc1_.reset();
};
Timer.prototype.doCallback = function()
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._oCallbackObject[_loc1_._sCallbackMethod](_loc1_._sState,_loc1_._iElapsedTime,_loc1_._iTimerLength);
};
Timer.prototype.enterFrame = function()
{
   var _loc1_ = this;
   if(_loc1_._bActive)
   {
      _loc1_._sState = _loc1_._RUNNING;
      var _loc2_ = getTimer();
      _loc1_._iElapsedTime = _loc2_ - _loc1_._iStartTime;
      if(_loc1_._iElapsedTime > _loc1_._iTimerLength)
      {
         _loc1_.stop();
      }
      else
      {
         var _loc3_ = _loc2_ - _loc1_._iLastUpdateTime;
         if(_loc3_ > _loc1_._iCallbackInterval)
         {
            _loc1_.doCallback();
            _loc1_._iLastUpdateTime = _loc2_;
         }
      }
   }
};
ChatInput.prototype.enable = function()
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._bEnabled = true;
   _loc1_._mcRoot.gotoAndStop("Enabled");
   _loc1_.clearInput();
};
ChatInput.prototype.disable = function()
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._bEnabled = false;
   _loc1_._mcRoot.gotoAndStop("Disabled");
   _loc1_.clearInput();
};
ChatInput.prototype.displayInstructions = function(sInstructions)
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   _loc1_._mcRoot.mcInstructions.sInstructions = sInstructions;
   _loc1_._mcRoot.mcInstructions._visible = true;
   _loc1_._oTimer.reset();
   _loc1_._oTimer.setCallback(_loc1_,"hideInstructions",3000);
   _loc1_._oTimer.start(3000);
};
ChatInput.prototype.hideInstructions = function(sTimerState, iElapsedTime, iTimerLength)
{
   var _loc1_ = this;
   if(!_loc1_._bDebug)
   {
   }
   if(sTimerState == _loc1_._oTimer._STOPPED)
   {
      _loc1_._mcRoot.mcInstructions._visible = false;
      _loc1_._oTimer.reset();
   }
};
ChatInput.prototype.sendInput = function()
{
   var _loc2_ = this;
   if(!_loc2_._bDebug)
   {
   }
   var _loc1_ = _loc2_._mcRoot.sInput;
   if(_loc1_ != "" && _loc1_ != null)
   {
      _level1._oGameController.sendInput(_loc1_);
      _loc2_.clearInput();
   }
};
ChatInput.prototype.clearInput = function()
{
   if(!this._bDebug)
   {
   }
   this._mcRoot.sInput = "";
};
ChatInput.prototype.displayNavigation = function()
{
   if(!this._bDebug)
   {
   }
   _level1._oGameController.displayNavigation();
};
ChatInput.prototype.displayDecibels = function()
{
   if(!this._bDebug)
   {
   }
   _level1._oGameController.displayDecibels();
};
ChatInput.prototype.toggleSound = function()
{
   if(!this._bDebug)
   {
   }
   _level1._oGameController.toggleSound();
};
ChatInput.prototype.displayHelp = function()
{
   if(!this._bDebug)
   {
   }
   _level1._oGameController.displayHelp();
};
ChatInput.prototype.disableChat = function()
{
   _level1._oGameController.setChatEnabled(false);
};
ChatInput.prototype.enableChat = function()
{
   _level1._oGameController.setChatEnabled(true);
};
this._oChatInput = new ChatInput(this);
