trace("Shell: Includes: Open check");
var bOpen = false;
if(_level0._state != "O" && _level0._state != "C" && _level0._state != "F")
{
   bOpen = true;
}
else
{
   bOpen = _level0._state == "O";
}
_level0.debug("url: " + _level0._url,true);
_level0.debug("_state: " + _level0._state,true);
_level0.debug("bOpen: " + bOpen,true);
if(bOpen)
{
   gotoAndPlay(37);
}
else
{
   gotoAndPlay(137);
}
