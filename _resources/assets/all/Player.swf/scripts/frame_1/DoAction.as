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
function Player(mcRoot)
{
   this._bDebug = true;
   if(this._bDebug)
   {
      trace("new Player(" + mcRoot + ")");
   }
   this._mcRoot = mcRoot;
   this._iPosition;
   this._oAvatar;
   this._sPlayerName;
   this._iScore;
   this._sAvatarState;
   this.FACE_RIGHT = "Face Right";
   this.FACE_LEFT = "Face Left";
   this._oTimer = new this._mcRoot.Timer();
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
Player.prototype.init = function(iPosition)
{
   if(this._bDebug)
   {
      trace("Player.init(" + iPosition + ")");
   }
   this._iPosition = iPosition;
   var _loc2_ = null;
   var _loc0_ = null;
   if(!(typeof (_loc0_ = this._iPosition) != typeof (_loc2_ = 1) ? false : _loc0_ == _loc2_))
   {
      if(!(typeof _loc0_ != typeof (_loc2_ = 2) ? false : _loc0_ == _loc2_))
      {
         if(!(typeof _loc0_ != typeof (_loc2_ = 3) ? false : _loc0_ == _loc2_))
         {
            if(!(typeof _loc0_ != typeof (_loc2_ = 4) ? false : _loc0_ == _loc2_))
            {
               if(!(typeof _loc0_ != typeof (_loc2_ = 5) ? false : _loc0_ == _loc2_))
               {
                  this._mcRoot.gotoAndStop(this.FACE_LEFT);
               }
               else
               {
                  this._mcRoot.gotoAndStop(this.FACE_RIGHT);
               }
            }
            else
            {
               this._mcRoot.gotoAndStop(this.FACE_RIGHT);
            }
         }
         else
         {
            this._mcRoot.gotoAndStop(this.FACE_RIGHT);
         }
      }
      else
      {
         this._mcRoot.gotoAndStop(this.FACE_LEFT);
      }
   }
   else
   {
      this._mcRoot.gotoAndStop(this.FACE_LEFT);
   }
   this.reset(false);
};
Player.prototype.reset = function(doDisplayLeave)
{
   this._oAvatar = null;
   this._sPlayerName = null;
   this._iScore = null;
   this._iTotalPossibleScore = null;
   this._mcRoot.mcVego._visible = false;
   this._mcRoot.mcPlayerName._visible = false;
   this._mcRoot.mcChat._visible = false;
   this._mcRoot.mcScore._visible = false;
   this._mcRoot.mcPlayerName.sScore = "";
   this._mcRoot.mcPodium._visible = true;
   this._mcRoot.mcTurnIndicator._visible = false;
   this._mcRoot.mcGenericHead._visible = true;
   this._mcRoot._visible = true;
   this.stopAnimations();
   if(doDisplayLeave == null || doDisplayLeave == true)
   {
      this.displayLeave();
   }
};
Player.prototype.setAvatar = function(oAvatar)
{
   if(this._bDebug)
   {
      trace("Player.setAvatar(" + oAvatar + ") iPosition: " + this._iPosition + ")");
   }
   this._oAvatar = oAvatar;
   this._mcRoot.mcVego.mcAvatar.buildAvatar(this._oAvatar.sGender,this._oAvatar.sMission,this._oAvatar.sAttributes);
};
Player.prototype.setPlayerName = function(sPlayerName)
{
   if(this._bDebug)
   {
      trace("Player.setPlayerName(" + sPlayerName + ") iPosition: " + this._iPosition + ")");
   }
   this._sPlayerName = sPlayerName;
   this._mcRoot.mcPlayerName.sPlayerName = this._sPlayerName;
   this._mcRoot.mcPlayerName._visible = true;
};
Player.prototype.setScore = function(iScore, iRank)
{
   this._iScore = iScore;
   if(this._iScore == 0)
   {
      this._mcRoot.mcScore.gotoAndStop(1);
   }
   else
   {
      var iHighScore = 11;
      var iTargetFrame = iScore * 10;
      trace("Player.setScore() iScore: " + iScore + ", iMapScore: " + iMapScore + ", iRoundedScore: " + iRoundedScore + ", iTargetFrame: " + iTargetFrame);
      var iCurrentFrame = this._mcRoot.mcScore._currentframe;
      if(iTargetFrame == 10)
      {
         this._mcRoot.mcScore.gotoAndPlay(2);
      }
      else
      {
         this._mcRoot.mcScore.gotoAndPlay(iTargetFrame - 9);
      }
   }
   this._mcRoot.mcScore._visible = true;
   this._mcRoot.mcPlayerName.sScore = iScore;
};
Player.prototype.displayEnter = function()
{
   if(this._bDebug)
   {
      trace("Player.displayEnter() iPosition: " + this._iPosition);
   }
   this._mcRoot.mcPodium.gotoAndStop("Ready");
   this._mcRoot.mcVego._visible = true;
   this._mcRoot.mcVego.gotoAndPlay("In");
   this._mcRoot.mcPlayerName._visible = true;
   this._mcRoot.mcChat._visible = false;
   this._mcRoot.mcScore._visible = true;
   this._mcRoot.mcTurnIndicator._visible = false;
   this._mcRoot.mcGenericHead._visible = false;
};
Player.prototype.displayLeave = function()
{
   if(this._bDebug)
   {
      trace("Player.displayLeave() iPosition: " + this._iPosition);
   }
   this._mcRoot.mcPodium.gotoAndStop("Empty");
   this._mcRoot.mcVego._visible = false;
   this._mcRoot.mcPlayerName._visible = false;
   this._mcRoot.mcChat._visible = false;
   this._mcRoot.mcScore._visible = false;
   this._mcRoot.mcTurnIndicator._visible = false;
   this._mcRoot.mcGenericHead._visible = true;
   this._mcRoot._visible = true;
};
Player.prototype.displayRoundWinner = function()
{
   if(this._bDebug)
   {
      trace("Player.displayRoundWinner() iPosition: " + this._iPosition);
   }
   _level0.debug("Player.displayRoundWinner() iPosition: " + this._iPosition);
   this._mcRoot.mcPodium.mcPodOn.mcWinner.gotoAndPlay("in");
   this.displayAvatarState("dance");
};
Player.prototype.displayGameWinner = function()
{
   if(this._bDebug)
   {
      trace("Player.displayGameWinner() iPosition: " + this._iPosition);
   }
   _level0.debug("Player.displayGameWinner() iPosition: " + this._iPosition);
   this._mcRoot.mcPodium.mcPodOn.mcGameWinner.gotoAndPlay("in");
   this._mcRoot.mcPodium.mcPodOn.mcWinner.gotoAndPlay("in");
   this.displayAvatarState("dance");
};
Player.prototype.displayGameLoser = function()
{
   if(this._bDebug)
   {
      trace("Player.displayGameLoser() iPosition: " + this._iPosition);
   }
   _level0.debug("Player.displayGameLoser() iPosition: " + this._iPosition);
   this.displayAvatarState("arms");
};
Player.prototype.stopAnimations = function()
{
   trace("Player.stopAnimations()");
   this._mcRoot.mcPodium.mcPodOn.mcGameWinner.gotoAndStop("stop");
   this._mcRoot.mcPodium.mcPodOn.mcWinner.gotoAndStop("stop");
   this.displayAvatarState("stop");
};
Player.prototype.displayChat = function(sMessage)
{
   if(this._bDebug)
   {
      trace("Player.displayChat(" + sMessage + ") iPosition: " + this._iPosition);
   }
   this._oTimer.reset();
   this._oTimer.setCallback(this,"hideChat",10000);
   this._oTimer.start(10000);
   this._mcRoot.mcChat.sChat = sMessage;
   this._mcRoot.mcChat._visible = true;
   this.displayAvatarState("talk");
};
Player.prototype.hideChat = function(sState, iElapsedTime, iTimerLength)
{
   if(this._bDebug)
   {
      trace("Player.hideCaht(" + sState + "," + iElapsedTime + "," + iTimeLength + ") iPosition: " + this._iPosition);
   }
   if(sState == this._oTimer._STOPPED)
   {
      this._mcRoot.mcChat._visible = false;
   }
   this.displayAvatarState("stop");
};
Player.prototype.displayAvatarState = function(sState)
{
   if(this._bDebug)
   {
      trace("Player.displayAvatarState(" + sState + ") iPosition: " + this._iPosition);
   }
   _level0.debug("Player.displayAvatarState(" + sState + ") iPosition: " + this._iPosition);
   if(sState == "dance")
   {
      this._mcRoot.mcVego.mcAvatar.begindance();
   }
   if(sState == "drink")
   {
      this._mcRoot.mcVego.mcAvatar.begindrink();
   }
   if(sState == "talk")
   {
      this._mcRoot.mcVego.mcAvatar.begintalk();
   }
   if(sState == "arms")
   {
      this._mcRoot.mcVego.mcAvatar.beginarmsup();
   }
   if(sState == "look right")
   {
      this._mcRoot.mcVego.mcAvatar.moveheadright();
   }
   if(sState == "look front")
   {
      this._mcRoot.mcVego.mcAvatar.moveheadfront();
   }
   if(sState == "stop")
   {
      this._mcRoot.mcVego.mcAvatar.stoped();
   }
   this._sAvatarState = sState;
};
Player.prototype.indicateTurn = function(bState)
{
   trace("indicateTurn()");
   if(this._bDebug)
   {
      _level0.debug("Player.indicateTurn()");
   }
   this._mcRoot.mcTurnIndicator._visible = bState;
};
Player.prototype.mapPoints = function(inVal, inLow, inHi, outLow, outHi)
{
   var outVal = (inVal - inLow) / (inHi - inLow) * (outHi - outLow) + outLow;
   return outVal;
};
this._oPlayer = new Player(this);
stop();
