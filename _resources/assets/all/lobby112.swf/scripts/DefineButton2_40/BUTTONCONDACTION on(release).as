on(release){
   var oPlayer = _root._oPlayers.getPlayerByClipName(_parent._name);
   oPlayer.setBlocked(true);
   this.gotoAndStop("Blocked");
}
