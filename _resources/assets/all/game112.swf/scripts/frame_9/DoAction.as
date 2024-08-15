function GameController(oRootContext)
{
   this._bDebug = true;
   if(this._bDebug)
   {
      _level0.debug("new GameController(" + oRootContext + ")");
   }
   res;
   this._oRootContext = oRootContext;
   this._oRoom = null;
   this._bSoundActive = true;
   this.initPlayers();
   this._oRootContext.mcChatInput._oChatInput.enable();
   this._iGameStateId;
   this._sGameState;
   this._bInitialized = false;
   this._bChatEnabled = true;
}
_level0.debug("Game: Active");
stop();
GameController.prototype.enterFrame = function()
{
   if(!this.getInitialized())
   {
      return undefined;
   }
};
GameController.prototype.setRoom = function(oRoom)
{
   _level0.debug("GameController.setRoom()");
   this._oRoom = oRoom;
};
GameController.prototype.getRoom = function()
{
   return this._oRoom;
};
GameController.prototype.setInitialized = function(bInitialized)
{
   this._bInitialized = bInitialized;
};
GameController.prototype.getInitialized = function()
{
   return this._bInitialized;
};
GameController.prototype.initGame = function(aPlayers)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.initGame()");
   }
   this.resetGame();
   _level0.mcPod1._visible = false;
   _level0.mcPod2._visible = false;
   _level0.mcLogo._visible = false;
   _level0.mcTour._visible = false;
   _level0.mcHelp._visible = false;
   _level2.mcCloseButton._visible = true;
   _level2._visible = false;
   this._oRootContext.mcCaptainInterface._oCaptainInterface.hide();
   this._oRootContext.mcScreen.mcPopupWindow._visible = false;
   this._oRootContext.mcScreen.mcPopupWindow._iCode = null;
   this._oRootContext._visible = true;
   this._oRootContext.mcGrid._oGrid.lockGrid();
   this._oRootContext.mcGrid._oGrid.hideLock();
   var i = 0;
   while(i < aPlayers.length)
   {
      this.playerEntered(aPlayers[i]);
      i++;
   }
   this.setInitialized(true);
};
GameController.prototype.resetGame = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.resetGame()");
   }
   var i = 1;
   while(5 >= i)
   {
      var mcPlayerClip = this._oRootContext["mcPlayer" + i];
      mcPlayerClip._oPlayer.reset();
      i++;
   }
   this._oRootContext.mcGrid._oGrid.clearGrid();
   this._oRootContext.mcGrid._oGrid.stopGameWinner();
   this.setInitialized(false);
};
GameController.prototype.playerEntered = function(oPlayer)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.playerEntered(" + oPlayer + ")");
   }
   var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
   mcPlayerClip._oPlayer.setPlayerName(oPlayer.getUsername());
   mcPlayerClip._oPlayer.setScore(oPlayer.getScore(),oPlayer.getRank());
   var sEncodedAvatarAttributes = oPlayer.getAvatarAttributes();
   var sDecodedAvatarAttributes = _level0.FFDK.decode("text/binhex",sEncodedAvatarAttributes);
   mcPlayerClip._oPlayer.setAvatar({sGender:oPlayer.getAvatarGender(),sMission:oPlayer.getAvatarMission(),sAttributes:sDecodedAvatarAttributes});
   mcPlayerClip._oPlayer.displayEnter();
};
GameController.prototype.playerExited = function(oPlayer)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.playerExited(" + oPlayer + ")");
   }
   var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
   mcPlayerClip._oPlayer.displayLeave();
};
GameController.prototype.initPlayers = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.initPlayers()");
   }
   this._oRootContext.mcPlayer1._oPlayer.init(1);
   this._oRootContext.mcPlayer2._oPlayer.init(2);
   this._oRootContext.mcPlayer3._oPlayer.init(3);
   this._oRootContext.mcPlayer4._oPlayer.init(4);
   this._oRootContext.mcPlayer5._oPlayer.init(5);
};
GameController.prototype.updatePlayerScore = function(oPlayer)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.updatePlayerScore() " + oPlayer);
   }
   var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
   mcPlayerClip._oPlayer.setPlayerName(oPlayer.getUsername());
   mcPlayerClip._oPlayer.setScore(oPlayer.getScore(),oPlayer.getRank());
};
GameController.prototype.setGameState = function(iGameStateId, sGameState)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.setGameState(" + iGameStateId + "," + sGameState + ")");
   }
   this._iGameStateId = iGameStateId;
   this._sGameState = sGameState;
   this._oRootContext.mcGameState.sCurrentState = sGameState;
   var oPlayers = this.getRoom().getPlayers();
   i = 0;
   while(i < oPlayers.length)
   {
      var oPlayer = oPlayers[i];
      var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
      mcPlayerClip._oPlayer.stopAnimations();
      i++;
   }
   if(this._sGameState == "GAME_STATE_BEGIN")
   {
      this._oRootContext.mcCaptainInterface._oCaptainInterface.hide();
      this.getRoom().prepareGameRoom();
   }
   if(this._sGameState == "GAME_STATE_GAME_WINNERS")
   {
      if(this._bSoundActive)
      {
         this._oRootContext.mcMusicSfx._oMusicSfx.playGameOver();
      }
   }
   if(this._sGameState == "GAME_STATE_GAME_OVER")
   {
      this._oRootContext.mcGrid._oGrid.stopGameWinner();
      this._oRootContext.mcGrid._oGrid.hideLock();
   }
};
GameController.prototype.sendInput = function(sInput)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.sendInput(" + sInput + ")");
   }
   this.getRoom().sendRevealChallengeChat(sInput);
};
GameController.prototype.displayNavigation = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.displayNavigation()");
   }
   if(this.getRoom()._bLobbyActive)
   {
      if(!_level2._visible)
      {
         _level2._oGames.displayFromIndex(0);
         _level2._visible = true;
      }
      else
      {
         _level2._visible = false;
      }
   }
   else
   {
      this.DisplayPopUp("Are you sure you want to leave the game?",3,true,true);
   }
};
GameController.prototype.displayDecibels = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.displayDecibels()");
   }
   this.getRoom().sendGetDecibels();
};
GameController.prototype.toggleSound = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.toggleSound()");
   }
   this._bSoundActive = !this._bSoundActive;
   var oSound = new Sound();
   if(!this._bSoundActive)
   {
      oSound.setVolume(0);
      this._oRootContext.mcChatInput.mcSound.gotoAndStop("Off");
   }
   else
   {
      this._oRootContext.mcChatInput.mcSound.gotoAndStop("On");
      oSound.setVolume(100);
   }
   _level0.debug("GameController.toggleSound() volume: " + oSound.getVolume());
};
GameController.prototype.displayHelp = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.displayHelp()");
   }
};
GameController.prototype.receiveChat = function(sChatString, sSender)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.receiveChat(" + sChatString + "," + sSender + ")");
   }
   if(!this._bChatEnabled)
   {
      return undefined;
   }
   var oPlayer = this.getPlayerByUsername(sSender);
   var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
   mcPlayerClip._oPlayer.displayChat(sChatString);
};
GameController.prototype.displayMessage = function(sText)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.displayMessage(" + sText + ")");
   }
   this._oRootContext.mcScreen._oScreen.displayMessage(sText);
};
GameController.prototype.clearMessage = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.clearMessage()");
   }
   this._oRootContext.mcScreen._oScreen.clearMessage();
};
GameController.prototype.GameWinners = function(aWinners)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.GameWinners(" + aWinners + ")");
   }
   this._oRootContext.mcGrid._oGrid.playGameWinner();
   this._oRootContext.mcScreen._oScreen.displayGameTie(aWinners);
   var i = 0;
   while(i < aWinners.length)
   {
      var oWinner = aWinners[i];
      var sPlayerName = oWinner.sPlayerName;
      var iMatches = oWinner.iMatches;
      var iBonus = oWinner.iBonus;
      var oPlayer = this.getRoom().getPlayerbyUsername(sPlayerName);
      var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
      var bIsWinner = 0 < iBonus;
      if(bIsWinner)
      {
         mcPlayerClip._oPlayer.displayGameWinner();
      }
      else
      {
         mcPlayerClip._oPlayer.displayGameLoser();
      }
      i++;
   }
};
GameController.prototype.isWinner = function(aWinners, sUsername)
{
   var i = 0;
   while(i < aWinners.length)
   {
      var oWinner = aWinners[i];
      var sPlayerName = oWinner.sPlayerName;
      if(sPlayername == sUsername)
      {
         return oWinner;
      }
      i++;
   }
};
GameController.prototype.DisplayPopUp = function(sText, iCode, bOk, bCancel)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.DisplayPopUp(" + sText + "," + iCode + "," + bOk + "," + bCancel + ")");
   }
   this._oRootContext.mcScreen._oScreen.displayPopUp(sText,iCode,bOk,bCancel);
};
GameController.prototype.SubmitPopUpOk = function(iCode)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.SubmitPopUpOk(" + iCode + ")");
   }
   if(iCode == 3)
   {
      this.backToLobby();
   }
};
GameController.prototype.SubmitPopUpCancel = function(iCode)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.SubmitPopUpCancel(" + iCode + ")");
   }
};
GameController.prototype.Captain1Interface = function(sText, bVisible, iTimeLength)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.Captain1Interface(" + sText + "," + bVisible + "," + iTimeLength + ")");
   }
   if(!bVisible)
   {
      this._oRootContext.mcCaptainInterface._oCaptainInterface.hide();
      return undefined;
   }
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayInstructions(sText);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayCountDown(iTimeLength);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayStart(true);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayWait(true);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.display();
};
GameController.prototype.Captain2Interface = function(sText, bVisible, iTimeLength)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.Captain2Interface(" + sText + "," + bVisible + "," + iTimeLength + ")");
   }
   if(!bVisible)
   {
      this._oRootContext.mcCaptainInterface._oCaptainInterface.hide();
      return undefined;
   }
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayInstructions(sText);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayCountDown(iTimeLength);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayStart(true);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.displayWait(false);
   this._oRootContext.mcCaptainInterface._oCaptainInterface.display();
};
GameController.prototype.startGame = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.startGame()");
   }
   this.getRoom().startGame();
};
GameController.prototype.waitForMorePlayers = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.waitForMorePlayers()");
   }
   this.getRoom().waitForMorePlayers();
};
GameController.prototype.getPlayerByUsername = function(sUsername)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.getPlayerByUsername(" + sUsername + ")");
   }
   var aPlayers = this.getRoom().getPlayers();
   var i = 0;
   while(i < aPlayers.length)
   {
      var oPlayer = aPlayers[i];
      if(oPlayer.getUsername() == sUsername)
      {
         return oPlayer;
      }
      i++;
   }
};
GameController.prototype.backToLobby = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.backToLobby()");
   }
   this._oRootContext.mcGrid._oGrid.clearGrid();
   this.getRoom().exit();
   this._oRootContext.mcHost._oHost.stopVo();
   this._oRootContext.mcMusicSfx._oMusicSfx.stopMusic();
   this._oRootContext.mcChatInput.mcSound.gotoAndStop("Off");
   _level2.gotoAndPlay("Active");
   _level2._visible = true;
   this._oRootContext.mcMusicSfx._oMusicSfx.stopMusic();
   _level0.mcLogo._visible = true;
   _level0.mcPod1._visible = true;
   _level0.mcPod2._visible = true;
   _level0.mcTour._visible = true;
   _level0.mcHelp._visible = true;
   this._oRootContext.mcGrid._oGrid.stopGameWinner();
   this._oRootContext._visible = false;
};
GameController.prototype.playVoType = function(sType)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.playVoType(" + sType + ")");
   }
   if(!this._bSoundActive)
   {
      return undefined;
   }
   this._oRootContext.mcHost._oHost.loadVo(sType);
};
GameController.prototype.initGrid = function(iRows, iCols, aCards)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.initGrid(" + iRows + "," + iCols + ") " + aCards);
   }
   this._oRootContext.mcGrid._oGrid.initGrid(iRows,iCols);
   var i = 0;
   while(i < aCards.length)
   {
      var oInputCard = aCards[i];
      this._oRootContext.mcGrid._oGrid.createAndAddCard(oInputCard.iCardId,oInputCard.iRow,oInputCard.iCol);
      i++;
   }
   this._oRootContext.mcGrid._oGrid.displayGrid(true);
   this._oRootContext.mcGrid._oGrid.printCards();
};
GameController.prototype.ClearGrid = function()
{
   this._oRootContext.mcGrid._oGrid.clearGrid();
};
GameController.prototype.LockGrid = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.lockGrid()");
   }
   this._oRootContext.mcGrid._oGrid.lockGrid();
};
GameController.prototype.UnLockGrid = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.unLockGrid()");
   }
   this._oRootContext.mcGrid._oGrid.unLockGrid();
};
GameController.prototype.requestRevealCard = function(oCard)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.requestRevealCard(" + oCard + ")");
   }
   var iRow = oCard.getRow();
   var iCol = oCard.getCol();
   var iCardId = oCard.getCardId();
   this.getRoom().requestRevealCard(iRow,iCol,iCardId);
};
GameController.prototype.revealCards = function(aTempCards)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.revealCards(" + aTempCards + ")");
   }
   var aCards = this.createCards(aTempCards);
   this._oRootContext.mcGrid._oGrid.revealCards(aCards);
};
GameController.prototype.unRevealCards = function(aTempCards)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.unRevealCards(" + aTempCards + ")");
   }
   var aCards = this.createCards(aTempCards);
   this._oRootContext.mcGrid._oGrid.unrevealCards(aCards);
};
GameController.prototype.removeCards = function(aTempCards)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.removeCards(" + aTempCards + ")");
   }
   var aCards = this.createCards(aTempCards);
   this._oRootContext.mcGrid._oGrid.removeCards(aCards);
};
GameController.prototype.removeAllCards = function()
{
   _level0.debug("GameController.removeAllCards()");
   this._oRootContext.mcGrid._oGrid.removeAllCards();
};
GameController.prototype.indicateTurn = function(oPlayer)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.indicateTurn(" + oPlayer + ")");
   }
   this._oRootContext.mcPlayer1._oPlayer.indicateTurn(false);
   this._oRootContext.mcPlayer2._oPlayer.indicateTurn(false);
   this._oRootContext.mcPlayer3._oPlayer.indicateTurn(false);
   this._oRootContext.mcPlayer4._oPlayer.indicateTurn(false);
   this._oRootContext.mcPlayer5._oPlayer.indicateTurn(false);
   var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
   mcPlayerClip._oPlayer.indicateTurn(true);
};
GameController.prototype.startTimer = function(iLength)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.startTimer(" + iLength + ")");
   }
   this._oRootContext.mcTimer._oGameTimer.startTimer(iLength);
};
GameController.prototype.stopTimer = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameController.stopTimer()");
   }
   this._oRootContext.mcTimer._oGameTimer.stopTimer();
};
GameController.prototype.createCards = function(aTempCards)
{
   var aCards = new Array();
   var i = 0;
   while(i < aTempCards.length)
   {
      var oTempCard = aTempCards[i];
      var iRow = oTempCard.iRow;
      var iCol = oTempCard.iCol;
      var oCard = this._oRootContext.mcGrid._oGrid.getCard(iRow,iCol);
      aCards.push(oCard);
      i++;
   }
   return aCards;
};
GameController.prototype.displayRoundWinner = function(sPlayerName)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.displayRoundWinner()");
   }
   var oPlayer = this.getRoom().getPlayerbyUsername(sPlayerName);
   var mcPlayerClip = this._oRootContext["mcPlayer" + oPlayer.getSlot()];
   mcPlayerClip._oPlayer.displayRoundWinner();
};
GameController.prototype.PlayWildCard = function(xml)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.PlayWildCard() " + xml);
   }
   this._oRootContext.mcGrid._oGrid.playWildCard();
};
GameController.prototype.StopWildCard = function(xml)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.StopWildCard() " + xml);
   }
   this._oRootContext.mcGrid._oGrid.stopWildCard();
};
GameController.prototype.PlayLoseTurn = function(xml)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.PlayLoseTurn() " + xml);
   }
   this._oRootContext.mcGrid._oGrid.playLoseTurn();
};
GameController.prototype.StopLoseTurn = function(xml)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.StopLoseTurn() " + xml);
   }
   this._oRootContext.mcGrid._oGrid.stopLoseTurn();
};
GameController.prototype.setChatEnabled = function(bEnabled)
{
   if(this._bDebug)
   {
      _level0.debug("GameController.setChatEnabled() " + arguments);
   }
   this._bChatEnabled = bEnabled;
};
this._oGameController = new GameController(this);
