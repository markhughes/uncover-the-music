function Host(mcRoot)
{
   this._bDebug = true;
   if(this._bDebug)
   {
      trace("new Host" + mcRoot + ")");
   }
   _level0.debug("new Host" + mcRoot + ")");
   this._mcRoot = mcRoot;
   this._oVOList = new this._mcRoot.VOList(this._mcRoot);
   this._STOPPED = "stopped";
   this._LOADING = "loading";
   this._PLAYING = "playing";
   this._sVOState = this._STOPPED;
   this._sAudioPath = "resources/audio/";
   this._iBuffer = 10;
}
function VOList(mcRoot)
{
   this._bDebug = true;
   if(this._bDebug)
   {
      trace("new VOList()");
   }
   this._mcRoot = mcRoot;
   this._aFileList;
   this.initFileList();
}
stop();
Host.prototype.getBuffer = function()
{
   return this._iBuffer;
};
Host.prototype.setVOState = function(sVOState)
{
   if(this._bDebug)
   {
      trace("Host.setVOState(" + sVOState + ")");
   }
   _level0.debug("Host.setVOState(" + sVOState + ")");
   this._sVOState = sVOState;
   this._mcRoot.mcVO.sState = this._sVOState;
};
Host.prototype.loadVO = function(sType)
{
   if(this._bDebug)
   {
      trace("Host.loadVO(" + sType + ")");
   }
   _level0.debug("Host.loadVO(" + sType + ")");
   this.stopVO();
   var sVOFile = this.getVOFile(sType);
   _level0.debug("Host.loadVO() sVOFile: " + sVOFile);
   this._mcRoot.mcVO.sFile = sVOFile;
   var sFullPath = this._sAudioPath + sVOFile;
   _level0.debug("Host.loadVO() sFullPath: " + sFullPath);
   this._mcRoot.mcVO.mcAudioLoader.loadMovie(sFullPath);
   this._mcRoot.mcVO.gotoAndStop("Loading");
   this.setVOState(this._LOADING);
};
Host.prototype.voLoaded = function()
{
   if(this._bDebug)
   {
      trace("Host.voLoaded()");
   }
   var sAudioLoaderUrl = this._mcRoot.mcAudioLoader._url;
   _level0.debug("Host.voLoaded() sAudioLoaderUrl: " + sAudioLoaderUrl);
   this.playVO();
};
Host.prototype.playVO = function()
{
   if(this._bDebug)
   {
      trace("Host.playVO()");
   }
   _level0.debug("Host.playVO()");
   this.setVOState(this._PLAYING);
   this._mcRoot.mcAudioLoader.play();
   this._mcRoot.mcVO.gotoAndStop("Playing");
};
Host.prototype.voDone = function()
{
   if(this._bDebug)
   {
      trace("Host.voDone()");
   }
   _level0.debug("Host.voDone()");
   this.stopVO();
};
Host.prototype.stopVO = function()
{
   if(this._bDebug)
   {
      trace("Host.stopVO()");
   }
   _level0.debug("Host.stopVO()");
   this.setVOState(this._STOPPED);
   this._mcRoot.mcVO.mcAudioLoader.stop();
   this._mcRoot.mcVO.gotoAndStop("Stopped");
};
Host.prototype.getVOFile = function(sType)
{
   var sRandomFile = this._oVOList.getRandomFileByType(sType);
   return sRandomFile;
};
VOList.prototype.getRandomFileByType = function(sType)
{
   if(this._bDebug)
   {
      trace("VOList.getRandomFileByType(" + sType + ")");
   }
   var aTypeList = this.getFilesByType(sType);
   trace("aTypeList: " + aTypeList);
   var iRandomIndex = Math.floor(Math.random() * aTypeList.length);
   var sRandomFile = aTypeList[iRandomIndex];
   trace("sRandomFile: " + sRandomFile);
   return sRandomFile;
};
VOList.prototype.getFilesByType = function(sType)
{
   if(this._bDebug)
   {
      trace("VOList.getFilesByType(" + sType + ")");
   }
   var aTypeList = new Array();
   var i = 0;
   while(i < this._aFileList.length)
   {
      var sFile = this._aFileList[i];
      if(sFile.indexOf(sType + "_") != -1)
      {
         aTypeList.push(sFile);
      }
      i++;
   }
   return aTypeList;
};
VOList.prototype.initFileList = function()
{
   if(this._bDebug)
   {
      trace("VOList.initFileList()");
   }
   this._aFileList = ["STREAMcaptain_01.SWF","STREAMcaptain_02.SWF","STREAMcaptain_03.SWF","STREAMcreateacaption_01.SWF","STREAMcreateacaption_02.SWF","STREAMcreateacaption_03.SWF","STREAMEnter_01.SWF","STREAMEnter_02.SWF","STREAMEnter_03.SWF","STREAMEnter_04.SWF","STREAMEnter_05.SWF","STREAMEnter_06.SWF","STREAMfifthplayer_01.SWF","STREAMfifthplayer_02.SWF","STREAMfifthplayer_03.SWF","STREAMfillintheblank_01.SWF","STREAMfillintheblank_02.SWF","STREAMfillintheblank_03.SWF","STREAMfinishthesong_01.SWF","STREAMfinishthesong_02.SWF","STREAMfinishthesong_03.SWF","STREAMfirstplayer_01.SWF","STREAMfirstplayer_02.SWF","STREAMfirstplayer_03.SWF","STREAMfourthplayer_01.SWF","STREAMfourthplayer_02.SWF","STREAMfourthplayer_03.SWF","STREAMgameoverdrop_01.SWF","STREAMgameoverdrop_02.SWF","STREAMgameoverdrop_03.SWF","STREAMgameoverdrop_04.SWF","STREAMgameover_01.SWF","STREAMgametie_01.SWF","STREAMgametie_02.SWF","STREAMgametie_03.SWF","STREAMgametie_04.SWF","STREAMgametie_05.SWF","STREAMgametie_06.SWF","STREAMgamewinner_01.SWF","STREAMgamewinner_02.SWF","STREAMgamewinner_03.SWF","STREAMgamewinner_04.SWF","STREAMgamewinner_05.SWF","STREAMgamewinner_06.SWF","STREAMgamewinner_07.SWF","STREAMhalfwaythere_01.SWF","STREAMhalfwaythere_02.SWF","STREAMhalfwaythere_03.SWF","STREAMhalfwaythere_04.SWF","STREAMinactivity_01.SWF","STREAMinactivity_02.SWF","STREAMinactivity_03.SWF","STREAMinactivity_04.SWF","STREAMinactivity_05.SWF","STREAMinactivity_06.SWF","STREAMplayer1_01.SWF","STREAMplayer2_01.SWF","STREAMplayer3_01.SWF","STREAMplayer4_01.SWF","STREAMplayer5_01.SWF","STREAMpollresults_01.SWF","STREAMpollresults_02.SWF","STREAMpollresults_03.SWF","STREAMpollresults_04.SWF","STREAMpollresults_05.SWF","STREAMpollresults_06.SWF","STREAMpollvote_01.SWF","STREAMpollvote_02.SWF","STREAMpollvote_03.SWF","STREAMpollvote_04.SWF","STREAMpollvote_05.SWF","STREAMpollvote_06.SWF","STREAMroundintro_01.SWF","STREAMroundintro_02.SWF","STREAMroundintro_03.SWF","STREAMroundintro_04.SWF","STREAMroundintro_05.SWF","STREAMroundintro_06.SWF","STREAMroundintro_07.SWF","STREAMroundintro_08.SWF","STREAMroundprogress_01.SWF","STREAMroundprogress_02.SWF","STREAMroundprogress_03.SWF","STREAMroundprogress_04.SWF","STREAMroundprogress_05.SWF","STREAMsecondplayer_01.SWF","STREAMsecondplayer_02.SWF","STREAMsecondplayer_03.SWF","STREAMstartgame_01.SWF","STREAMstartgame_02.SWF","STREAMstartgame_03.SWF","STREAMthirdplayer_01.SWF","STREAMthirdplayer_02.SWF","STREAMthirdplayer_03.SWF","STREAMwhatif_01.SWF","STREAMwhatif_02.SWF","STREAMwhatif_03.SWF"];
};
this._oHost = new Host(this);
this._oHost.loadVo("Enter");
