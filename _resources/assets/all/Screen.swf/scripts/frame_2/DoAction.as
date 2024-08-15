function Screen(mcClip)
{
   this._bDebug = true;
   if(!this._bDebug)
   {
   }
   this._mcRoot = mcClip;
   this.hideAll();
}
Screen.prototype.displayGameTie = function(aWinners)
{
   if(!this._bDebug)
   {
   }
   this.hideAll();
   var i = 0;
   while(i < 5)
   {
      var mcGameWinner = this._mcRoot.mcGameTie["mcGameWinner" + i];
      mcGameWinner._visible = false;
      i++;
   }
   var i = 0;
   while(i < aWinners.length)
   {
      var oWinner = aWinners[i];
      var sPlayerName = oWinner.sPlayerName;
      var iMatches = oWinner.iMatches;
      var iBonus = oWinner.iBonus;
      var iDecibels = oWinner.iDecibels;
      var mcGameWinner = this._mcRoot.mcGameTie["mcGameWinner" + i];
      mcGameWinner.sPlayerName = sPlayerName;
      mcGameWinner.sMatches = iMatches;
      mcGameWinner.sBonus = iBonus;
      mcGameWinner.sDecibels = iDecibels;
      mcGameWinner._visible = true;
      i++;
   }
   this._mcRoot.mcGameTie._visible = true;
   this._mcRoot.mcGameTie.mcGameTieOver.gotoAndPlay("in");
};
Screen.prototype.displayMessage = function(sMessage)
{
   if(!this._bDebug)
   {
   }
   this.hideAll();
   this._mcRoot.mcMessage.sMessage = sMessage;
   this._mcRoot.mcMessage._visible = true;
   this._mcRoot.mcMessage.mcMessageLight.gotoAndPlay("in");
};
Screen.prototype.hideMessage = function()
{
   this._mcRoot.mcMessage._visible = false;
   this._mcRoot.mcMessage.sMessage = "";
   this._mcRoot.mcMessage.mcMessageLight.gotoAndStop("stop");
};
Screen.prototype.displayPopUp = function(sMessage, iCode, bOk, bCancel)
{
   if(!this._bDebug)
   {
   }
   _level0.debug("Screen.displayPopUp(" + sMessage + "," + iCode + "," + bOk + "," + bCancel + ")");
   this._mcRoot.mcPopupWindow.sMessage = sMessage;
   this._mcRoot.mcPopupWindow.mcSubmitPopUp._visible = bOk;
   this._mcRoot.mcPopupWindow.mcCancelPopUp._visible = bCancel;
   this._mcRoot.mcPopupWindow._iCode = iCode;
   this._mcRoot.mcPopupWindow._visible = true;
};
Screen.prototype.submitPopUpOk = function()
{
   if(!this._bDebug)
   {
   }
   _level1._oGameController.submitPopUpOk(this._mcRoot.mcPopupWindow._iCode);
   if(!this._bDebug)
   {
   }
   this._mcRoot.mcPopupWindow._visible = false;
   this._mcRoot.mcPopupWindow._iCode = null;
};
Screen.prototype.submitPopUpCancel = function()
{
   if(!this._bDebug)
   {
   }
   _level1._oGameController.submitPopUpCancel(this._mcRoot.mcPopupWindow._iCode);
   if(!this._bDebug)
   {
   }
   this._mcRoot.mcPopupWindow._visible = false;
   this._mcRoot.mcPopupWindow._iCode = null;
};
Screen.prototype.hideAll = function()
{
   this._mcRoot.mcGameTie._visible = false;
   this._mcRoot.mcGameTie.mcGameTieOver.gotoAndStop("stop");
   this._mcRoot.mcMessage._visible = false;
   this._mcRoot.mcMessage.mcMessageLight.gotoAndStop("stop");
   this._mcRoot.mcPopupWindow._visible = false;
};
this._oScreen = new Screen(this);
stop();
