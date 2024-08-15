on(release){
   var oGameDetail = _root._oGames._oGameDetail;
   var sRoomId = oGameDetail.getRoomId();
   var oGame = _root._oGames.getGameByRoomId(sRoomId);
   if(oGame != null)
   {
      oGame.joinRoom();
   }
}
