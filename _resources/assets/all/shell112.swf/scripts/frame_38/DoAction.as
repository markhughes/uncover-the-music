_level0.debug("Shell: Login");
_level0._session = _level0.SESSION_createSession();
this.mcPod1._visible = true;
this.mcPod2._visible = true;
this.mcLogo._visible = true;
_level1.gotoandplay("Dormant");
_level2.gotoandplay("Dormant");
var bAutoLogin = false;
var bGotScreenName = false;
var bGotAvatar = false;
var bGotServer = false;
var sUsername = "";
var sAvatar = "";
var sIpAddress = "192.168.0.100";
var iPort = 37120;
if(_level0._screenName != undefined && _level0._screenName != "")
{
   bGotScreenName = true;
   sUsername = unescape(_level0._screenName);
}
_level0.debug("_level0._screenName: " + _level0._screenName,true);
if(bGotScreenName == false)
{
   if(_level0._personId != undefined && _level0._personId != "")
   {
      bGotScreenName = true;
      sUsername = unescape(_level0._personId);
   }
}
_level0.debug("_level0._personId: " + _level0._personId,true);
if(_level0._avatar != undefined && _level0._avatar != "")
{
   bGotAvatar = true;
   sAvatar = unescape(_level0._avatar);
}
_level0.debug("_level0._avatar: " + _level0._avatar,true);
if(_level0._server != undefined && _level0._server != "")
{
   _level0.debug("SETTING SERVER FROM: " + _level0._server);
   bGotServer = true;
   sIpAddress = _level0.gamesDomain;
   iPort = Number(_level0.gamesPort);
}
_level0.debug("_level0._server: " + _level0._server,true);
if(!Key.isDown(16))
{
   if(!(bGotScreenName && bGotServer))
   {
      bManualLogin = true;
   }
   else
   {
      bManualLogin = false;
   }
}
else
{
   bManualLogin = true;
}
_level0.debug("bManualLogin: " + bManualLogin,true);
_level0.debug("sUsername: " + sUsername + ", sIpAddress: " + sIpAddress + ", iPort: " + iPort,true);
_level0.debug("_level0._revealChallengeVersion: " + _level0._popquizversion,true);
if(!bManualLogin)
{
   _level0.sStatus = "Logging in....";
   _level0._session.setLoginName(sUsername);
   _level0._session.setLoginPassword(sAvatar);
   _level0._session.setIpAddress(sIpAddress);
   _level0._session.setPort(iPort);
   _level0.gotoandplay("Connect");
}
else
{
   _level0.gotoandplay("Secret Login Password");
}
