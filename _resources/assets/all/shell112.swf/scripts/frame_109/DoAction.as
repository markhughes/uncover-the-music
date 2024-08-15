this.gameStaticAssetsLoaded = function()
{
   _level0.debug("Shell.gameStaticAssetsLoaded()");
   _level0.gotoAndPlay("Active");
};
this.captainInterfaceLoaded = function(sFile)
{
   _level0.debug("captainInterfaceLoaded()");
   this.fileLoaded(sFile);
};
this.chatInputLoaded = function(sFile)
{
   _level0.debug("chatInputLoaded()");
   this.fileLoaded(sFile);
};
this.player1Loaded = function(sFile)
{
   _level0.debug("player1Loaded()");
   this.fileLoaded(sFile);
};
this.player2Loaded = function(sFile)
{
   _level0.debug("player2Loaded()");
   this.fileLoaded(sFile);
};
this.player3Loaded = function(sFile)
{
   _level0.debug("player3Loaded()");
   this.fileLoaded(sFile);
};
this.player4Loaded = function(sFile)
{
   _level0.debug("player4Loaded()");
   this.fileLoaded(sFile);
};
this.player5Loaded = function(sFile)
{
   _level0.debug("player5Loaded()");
   this.fileLoaded(sFile);
};
this.gridLoaded = function(sFile)
{
   _level0.debug("gridLoaded()",true);
   this.fileLoaded(sFile);
};
this.screenLoaded = function(sFile)
{
   _level0.debug("screenLoaded()",true);
   this.fileLoaded(sFile);
};
this.stageLoaded = function(sFile)
{
   _level0.debug("stageLoaded()");
   this.fileLoaded(sFile);
};
this.hostLoaded = function(sFile)
{
   _level0.debug("hostLoaded()");
   this.fileLoaded(sFile);
};
this.musicSfxLoaded = function(sFile)
{
   _level0.debug("musicSfxLoaded()");
};
this.timerLoaded = function(sFile)
{
   _level0.debug("timerLoaded()");
   this.fileLoaded(sFile);
};
this.loadCaptainInterface = function(sFileProgress)
{
   _level0.debug("loadCaptainInterface()");
   _level0.mcPreloader.load("resources/CaptainInterface.swf",_level1.mcCaptainInterface,this,"captainInterfaceLoaded","Captain Interface",sFileProgress);
};
this.loadChatInput = function(sFileProgress)
{
   _level0.debug("loadChatInput()");
   _level0.mcPreloader.load("resources/ChatInput.swf",_level1.mcChatInput,this,"chatInputLoaded","Chat",sFileProgress);
};
this.loadPlayer1 = function(sFileProgress)
{
   _level0.debug("loadPlayer1()");
   _level0.mcPreloader.load("resources/Player.swf",_level1.mcPlayer1,this,"player1Loaded","Players",sFileProgress);
};
this.loadPlayer2 = function(sFileProgress)
{
   _level0.debug("loadPlayer2()");
   _level0.mcPreloader.load("resources/Player.swf",_level1.mcPlayer2,this,"player2Loaded","Players",sFileProgress);
};
this.loadPlayer3 = function(sFileProgress)
{
   _level0.debug("loadPlayer3()");
   _level0.mcPreloader.load("resources/Player.swf",_level1.mcPlayer3,this,"player3Loaded","Players",sFileProgress);
};
this.loadPlayer4 = function(sFileProgress)
{
   _level0.debug("loadPlayer4()");
   _level0.mcPreloader.load("resources/Player.swf",_level1.mcPlayer4,this,"player4Loaded","Players",sFileProgress);
};
this.loadPlayer5 = function(sFileProgress)
{
   _level0.debug("loadPlayer5()");
   _level0.mcPreloader.load("resources/Player.swf",_level1.mcPlayer5,this,"player5Loaded","Players",sFileProgress);
};
this.loadScreen = function(sFileProgress)
{
   _level0.debug("loadScreen()",true);
   _level0.mcPreloader.load("resources/Screen.swf",_level1.mcScreen,this,"screenLoaded","The Screen",sFileProgress);
};
this.loadGrid = function(sFileProgress)
{
   _level0.debug("loadGrid()",true);
   _level0.mcPreloader.load("resources/grid.swf",_level1.mcGrid,this,"gridLoaded","The Grid",sFileProgress);
};
this.loadStage = function(sFileProgress)
{
   _level0.debug("loadStage()");
   _level0.mcPreloader.load("resources/Stage.swf",_level1.mcStage,this,"stageLoaded","The Stage",sFileProgress);
};
this.loadHost = function(sFileProgress)
{
   _level0.debug("loadHost()");
   _level0.mcPreloader.load("resources/Host.swf",_level1.mcHost,this,"hostLoaded","The Host",sFileProgress);
};
this.loadMusicSfx = function(sFileProgress)
{
   _level0.debug("loadMusicSfx()");
};
this.loadTimer = function(sFileProgress)
{
   _level0.debug("loadTimer()");
   _level0.mcPreloader.load("resources/Timer.swf",_level1.mcTimer,this,"timerLoaded","Timer",sFileProgress);
};
this._aLoadList = new Array();
this._aLoadList.push("loadTimer");
this._aLoadList.push("loadCaptainInterface");
this._aLoadList.push("loadChatInput");
this._aLoadList.push("loadPlayer1");
this._aLoadList.push("loadPlayer2");
this._aLoadList.push("loadPlayer3");
this._aLoadList.push("loadPlayer4");
this._aLoadList.push("loadPlayer5");
this._aLoadList.push("loadGrid");
this._aLoadList.push("loadScreen");
this._iLoadIndex = 0;
this.fileLoaded = function(sFile)
{
   var _loc1_ = this;
   _level0.debug("fileLoaded(" + sFile + ")",true);
   if(_loc1_._iLoadIndex == _loc1_._aLoadList.length - 1)
   {
      _loc1_.allFilesLoaded();
   }
   else
   {
      _loc1_._iLoadIndex = _loc1_._iLoadIndex + 1;
      _loc1_.loadFile(_loc1_._iLoadIndex);
   }
};
this.allFilesLoaded = function()
{
   _level0.debug("allFilesLoaded()");
   _level0.gameStaticAssetsLoaded();
};
this.loadFile = function(iLoadIndex)
{
   var _loc1_ = iLoadIndex;
   var _loc2_ = this;
   _level0.debug("loadFile(" + _loc1_ + "," + _loc2_._aLoadList[_loc1_] + ")",true);
   var _loc3_ = _loc2_._aLoadList[_loc1_];
   _loc2_._loc3_(_loc1_ + 1 + " of " + _loc2_._aLoadList.length);
};
this.loadFile(this._iLoadIndex);
stop();
