function Card(oGrid, iRow, iCol, iCardID)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("Card(" + oGrid + "," + iRow + "," + iCol + "," + iCardID + ")");
   }
   this._oGrid = oGrid;
   this._iRow = iRow;
   this._iCol = iCol;
   this._iCardID = iCardID;
   this._bRevealed = false;
   this._bHidden = false;
   this._bTestMode = false;
}
function Grid(mcClip)
{
   this._bDebug = true;
   if(this._bDebug)
   {
      _level0.debug("Grid()");
   }
   this._mcClip = mcClip;
   this._iRows;
   this._iCols;
   this._iDepthCounter = 10;
   this._iX = 0;
   this._iY = 0;
   this._iWidth = this._mcClip.mcBoundary._width;
   this._iHeight = this._mcClip.mcBoundary._height;
   this._aCards = new Array();
   this._bLocked = false;
   this._bTestMode = false;
   this._bViewCards = Key.isDown(40);
}
function debug(sMessage)
{
   trace(sMessage);
}
Card.prototype.display = function(bVisible)
{
   if(this._bDebug)
   {
      _level0.debug("Card.display(" + bVisible + "):  iRow: " + this._iRow + " iCol: " + this._iCol);
   }
   var mcClip = this.getClip();
   var iRevRowIndex = this.mapPoints(this._iRow,0,this._oGrid._iRows,this._oGrid._iRows,0);
   var iRevColIndex = this.mapPoints(this._iCol,0,this._oGrid._iCols,this._oGrid._iCols,0);
   var iDepth = Number(String(this._iRow) + String(iRevColIndex));
   mcClip.swapDepths(iDepth + 100);
   var iWidth = this._oGrid._iWidth / this._oGrid._iCols;
   var iHeight = this._oGrid._iHeight / this._oGrid._iRows;
   var iX = this._oGrid._iX + this._iCol * iWidth;
   var iY = this._oGrid._iY + this._iRow * iHeight;
   if(bVisible != null)
   {
      this.setHidden(bVisible);
   }
   mcClip._x = iX;
   mcClip._y = iY;
   mcClip._width = iWidth;
   mcClip._height = iHeight;
   mcClip._alpha = 100;
   mcClip.mcCard.sCardId = this._iCardId;
   mcClip.mcCard._visible = !this.getHidden();
};
Card.prototype.toggleReveal = function()
{
   if(this._bDebug)
   {
      _level0.debug("Card.toggleReveal()");
   }
   if(this.getRevealed())
   {
      this.unReveal();
   }
   else
   {
      this.reveal();
   }
};
Card.prototype.reveal = function()
{
   if(this._bDebug)
   {
      _level0.debug("Card.reveal()");
   }
   if(this.getRevealed() || this.getHidden())
   {
      return undefined;
   }
   this.getClip().gotoAndPlay("Reveal");
   this.getClip().mcCard.gotoAndPlay("Animate");
   this.setRevealed(true);
};
Card.prototype.unReveal = function()
{
   if(this._bDebug)
   {
      _level0.debug("Card.unReveal()");
   }
   this.getClip().gotoAndPlay("Unreveal");
   this.getClip().mcCard.gotoAndPlay("Stop");
   this.setRevealed(false);
};
Card.prototype.hide = function()
{
   _level0.debug("Card.hide()");
   this.getClip().gotoAndPlay("Hide");
   this.getClip().mcCard.gotoAndPlay("Stop");
   this.setHidden(false);
   if(this._bTestMode)
   {
      this.getClip().mcCard._alpha = 0;
   }
};
Card.prototype.show = function()
{
   if(this._bDebug)
   {
      _level0.debug("Card.show()");
   }
   this.getClip().gotoAndPlay("Show");
   this.setHidden(false);
   if(this._bTestMode)
   {
      this.getClip().mcCard.swapDepths(0);
      this.getClip().mcCard._alpha = 70;
   }
};
Card.prototype.getClip = function()
{
   var sClipName = "mcCard" + this._iRow + "_" + this._iCol;
   var mcClip = this._oGrid._mcClip[sClipName];
   if(mcClip == null)
   {
      this._oGrid._mcClip.mcTempCard.duplicateMovieclip(sClipName,this._oGrid._iDepthCounter++);
      mcClip = this._oGrid._mcClip[sClipname];
      var sPath = "content/cards/";
      var sCardId = String(this.getCardId());
      if(sCardId.length == 1)
      {
         sCardId = "0" + sCardId;
      }
      var sFileName = sCardId + ".swf";
      var sFullPath = sPath + sFileName;
      mcClip.mcCard.loadMovie(sFullPath);
      mcClip._alpha = 100;
   }
   return mcClip;
};
Card.prototype.removeClip = function()
{
   _level0.debug("Card.removeClip()");
   var mcClip = this.getClip();
   trace("mcClip: " + mcClip);
   mcClip._visible = true;
   mcClip.removeMovieClip();
};
Card.prototype.equals = function(oCard)
{
   return this._iRow == oCard._iRow && this._iCol == oCard._iCol && this._iCardID == oCard._iCardID;
};
Card.prototype.toString = function()
{
   return "[CARD] iRow: " + this._iRow + " iCol: " + this._iCol + " iCardID: " + this._iCardID + ", mcClip: " + this.getClip();
};
Card.prototype.getRow = function()
{
   return this._iRow;
};
Card.prototype.getCol = function()
{
   return this._iCol;
};
Card.prototype.getCardId = function()
{
   return this._iCardId;
};
Card.prototype.getRevealed = function()
{
   return this._bRevealed;
};
Card.prototype.setRevealed = function(bRevealed)
{
   this._bRevealed = bRevealed;
};
Card.prototype.getHidden = function()
{
   return this._bHidden;
};
Card.prototype.setHidden = function(bHidden)
{
   this._bHidden = bHidden;
};
Card.prototype.mapPoints = function(inVal, inLow, inHi, outLow, outHi)
{
   var outVal = (inVal - inLow) / (inHi - inLow) * (outHi - outLow) + outLow;
   return outVal;
};
Grid.prototype.createAndAddCard = function(iCardId, iRow, iCol)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.createAndAddCard(" + iCardId + "," + iRow + "," + iCol + ")");
   }
   var oCard = this.createCard(iCardId,iRow,iCol);
   this.addCard(oCard);
};
Grid.prototype.createCard = function(iCardId, iRow, iCol)
{
   return new this._mcClip._parent.Card(this,iRow,iCol,iCardId);
};
Grid.prototype.addCard = function(oCard)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.addCard() bTestMode: " + this._bTestMode + ", " + oCard);
   }
   this._aCards.push(oCard);
   oCard._bTestMode = this._bViewCards;
   oCard.display();
   oCard.show();
};
Grid.prototype.displayGrid = function(bState)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.displayGrid()");
   }
   if(bState)
   {
      this._mcClip._parent.mcScreenCap.gotoAndPlay("In");
   }
   else
   {
      this._mcClip._parent.mcScreenCap.gotoAndStop("out");
   }
};
Grid.prototype.initGrid = function(iRows, iCols)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.initGrid(" + iRows + "," + iCols + ")");
   }
   this.killCards(this._aCards);
   this._aCards = new Array();
   this._iRows = iRows;
   this._iCols = iCols;
};
Grid.prototype.clearGrid = function()
{
   if(this._bDebug)
   {
      _level0.debug("Grid.clearGrid()");
   }
   this.killCards(this._aCards);
   this._aCards = new Array();
   this.displayGrid(false);
};
Grid.prototype.lockGrid = function()
{
   if(this._bDebug)
   {
      _level0.debug("Grid.lockGrid()");
   }
   this._bLocked = true;
   this._mcClip._parent.mcGridLock._visible = true;
};
Grid.prototype.unlockGrid = function()
{
   if(this._bDebug)
   {
      _level0.debug("Grid.UnLockGrid()");
   }
   this._bLocked = false;
   this._mcClip._parent.mcGridLock._visible = false;
};
Grid.prototype.hideLock = function()
{
   if(this._bDebug)
   {
      _level0.debug("Grid.hideLock()");
   }
   this._mcClip._parent.mcGridLock._visible = false;
};
Grid.prototype.revealCards = function(aCards)
{
   var i = 0;
   while(i < aCards.length)
   {
      var oCard = aCards[i];
      oCard.reveal();
      i++;
   }
};
Grid.prototype.unRevealCards = function(aCards)
{
   var i = 0;
   while(i < aCards.length)
   {
      var oCard = aCards[i];
      oCard.unReveal();
      i++;
   }
};
Grid.prototype.removeCard = function(oRemoveCard)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.removeCard()" + oCard);
   }
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      if(oCard.equals(oRemoveCard))
      {
         oCard.hide();
         break;
      }
      i++;
   }
};
Grid.prototype.removeCards = function(aCards)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.removeCards(" + aCards + ")");
   }
   var i = 0;
   while(i < aCards.length)
   {
      var oCard = aCards[i];
      this.removeCard(oCard);
      i++;
   }
};
Grid.prototype.removeAllCards = function()
{
   _level0.debug("Grid.removeAllCards()");
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      oCard.hide();
      i++;
   }
};
Grid.prototype.killCards = function(aCards)
{
   trace("killCards()");
   var i = 0;
   while(i < aCards.length)
   {
      var oCard = aCards[i];
      this.killCard(oCard);
      i++;
   }
};
Grid.prototype.killCard = function(oCard)
{
   trace("killCard()");
   oCard.removeClip();
};
Grid.prototype.hideCard = function(oHideCard)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.hideCard()" + oHideCard);
   }
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      if(oCard.equals(oHideCard))
      {
         oCard.hide();
         break;
      }
      i++;
   }
};
Grid.prototype.hideCards = function(aCards)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.hideCards(" + aCards + ")");
   }
   var i = 0;
   while(i < aCards.length)
   {
      var oCard = aCards[i];
      this.hideCard(oCard);
      i++;
   }
};
Grid.prototype.showCard = function(oHideCard)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.showCard()" + oHideCard);
   }
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      if(oCard.equals(oHideCard))
      {
         oCard.show();
         break;
      }
      i++;
   }
};
Grid.prototype.showCards = function(aCards)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.showCards(" + aCards + ")");
   }
   if(aCards == null)
   {
      aCards = this._aCards;
   }
   var i = 0;
   while(i < aCards.length)
   {
      var oCard = aCards[i];
      this.showCard(oCard);
      i++;
   }
};
Grid.prototype.displayMatch = function(aCards)
{
   if(this._bTestMode)
   {
      aCards = new Array();
      var i = 0;
      while(i < this._aCards.length)
      {
         var oCard = this._aCards[i];
         if(oCard.getRevealed() && !oCard.getHidden())
         {
            aCards.push(oCard);
         }
         i++;
      }
   }
   this.hideCards(aCards);
};
Grid.prototype.displayMiss = function(aCards)
{
   if(this._bTestMode)
   {
      aCards = new Array();
      var i = 0;
      while(i < this._aCards.length)
      {
         var oCard = this._aCards[i];
         if(oCard.getRevealed() && !oCard.getHidden())
         {
            aCards.push(oCard);
         }
         i++;
      }
   }
   this.unRevealCards(aCards);
};
Grid.prototype.cardSelected = function(sClipName)
{
   if(this._bDebug)
   {
      _level0.debug("Grid.cardSelected(" + sClipName + ") :  locked: " + this._bLocked);
   }
   if(this._bLocked)
   {
      return undefined;
   }
   var oCard = this.getCardByClipName(sClipName);
   if(oCard.getRevealed())
   {
      if(this._bTestMode)
      {
         this.unRevealCards([oCard]);
      }
      return undefined;
   }
   if(this._bTestMode)
   {
      this.revealCards([oCard]);
   }
   else
   {
      _level1._oGameController.requestRevealCard(oCard);
   }
};
Grid.prototype.getCardByClipName = function(sClipName)
{
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      var mcClip = oCard.getClip();
      var sName = mcClip._name;
      if(sName == sClipName)
      {
         return oCard;
      }
      i++;
   }
};
Grid.prototype.getCard = function(iRow, iCol)
{
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      if(oCard.getRow() == iRow && oCard.getCol() == iCol)
      {
         return oCard;
      }
      i++;
   }
};
Grid.prototype.createTestGrid = function()
{
   var aTempCards = new Array();
   var i = 2;
   while(28 >= i)
   {
      aTempCards.push(i);
      i++;
   }
   _level0.debug("aTempcards: " + aTempCards);
   var iTotalCards = this._iRows * this._iCols;
   var iCardsToRandomize = (iTotalCards - 2) / 2;
   var aCards = new Array();
   aCards.push(0);
   aCards.push(1);
   var i = 0;
   while(i < iCardsToRandomize)
   {
      var iTempCardLength = aTempCards.length;
      var iRandomIndex = Math.floor(Math.random() * iTempCardLength);
      var iCard = aTempCards[iRandomIndex];
      aTempCards.splice(iRandomIndex,1);
      aCards.push(iCard);
      aCards.push(iCard);
      i++;
   }
   _level0.debug("aCards: " + aCards);
   var iCardIndex = 0;
   var iRow = 0;
   while(iRow < this._iRows)
   {
      var iCol = 0;
      while(iCol < this._iCols)
      {
         var iCardId = aCards[iCardIndex];
         var sCardId = iCardId >= 10 ? String(iCardId) : "0" + iCardId;
         this.createAndAddCard(sCardId,iRow,iCol);
         iCardIndex++;
         iCol++;
      }
      iRow++;
   }
};
Grid.prototype.printCards = function()
{
   _level0.debug("[ CARDS ] total: " + this._aCards.length);
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      _level0.debug(oCard.toString());
      i++;
   }
};
Grid.prototype.playLoseTurn = function()
{
   var oCard = this.getCardById("00");
   var iWidth = this._iWidth / this._iCols;
   var iHeight = this._iHeight / this._iRows;
   var iX = this._iX + oCard._iCol * iWidth;
   var iY = this._iY + oCard._iRow * iHeight;
   this._mcClip.mcLoseTurn._x = iX;
   this._mcClip.mcLoseTurn._y = iY;
   this._mcClip.mcLoseTurn._width = iWidth;
   this._mcClip.mcLoseTurn._height = iHeight;
   this._mcClip.mcLoseTurn.swapDepths(1000);
   this._mcClip.mcLoseTurn._visible = true;
   this._mcClip.mcLoseTurn.gotoAndStop("Play");
};
Grid.prototype.stopLoseTurn = function()
{
   this._mcClip.mcLoseTurn._visible = false;
   this._mcClip.mcLoseTurn.gotoAndStop("Stop");
};
Grid.prototype.playWildCard = function()
{
   var oCard = this.getCardById("01");
   var iWidth = this._iWidth / this._iCols;
   var iHeight = this._iHeight / this._iRows;
   var iX = this._iX + oCard._iCol * iWidth;
   var iY = this._iY + oCard._iRow * iHeight;
   this._mcClip.mcWildCard._x = iX;
   this._mcClip.mcWildCard._y = iY;
   this._mcClip.mcWildCard._width = iWidth;
   this._mcClip.mcWildCard._height = iHeight;
   this._mcClip.mcWildCard.swapDepths(1001);
   this._mcClip.mcWildCard._visible = true;
   this._mcClip.mcWildCard.gotoAndStop("Play");
};
Grid.prototype.stopWildCard = function()
{
   this._mcClip.mcWildCard._visible = false;
   this._mcClip.mcWildCard.gotoAndStop("Stop");
};
Grid.prototype.getCardById = function(sId)
{
   var i = 0;
   while(i < this._aCards.length)
   {
      var oCard = this._aCards[i];
      if(oCard.getCardId() == sId)
      {
         return oCard;
      }
      i++;
   }
};
Grid.prototype.playGameWinner = function()
{
   this._mcClip._parent.mcWater_Fountain.gotoAndPlay("start");
};
Grid.prototype.stopGameWinner = function()
{
   this._mcClip._parent.mcWater_Fountain.gotoAndStop("stop");
};
this._oGrid = new Grid(this.mcGrid);
this._bTest = false;
if(this._bTest)
{
   this._oGrid.clearGrid();
   this._oGrid.initGrid(4,4);
   this._oGrid.createTestGrid();
}
stop();
