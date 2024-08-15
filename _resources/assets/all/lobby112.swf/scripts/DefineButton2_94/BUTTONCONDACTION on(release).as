on(release){
   var oGame = _root._oGames.getGameByClipName(this._name);
   _root._oGames._oGameDetail.setRoomId(oGame.getRoomId());
   _root._oLobby.getAvatars(oGame.getRoomId());
}
