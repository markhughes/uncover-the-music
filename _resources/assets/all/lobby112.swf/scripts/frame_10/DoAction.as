function createLobby(oLobbyRootContext, oGameRootContext)
{
   var lobby = _level0._session.newRoom("Uncover the Music Lobby");
   lobby.onAction = function(xml, sUsername, aRecipients)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onAction(" + xml + "," + sUsername + "," + aRecipients + ")");
      }
      if(!this.getAcceptMessages())
      {
         if(this._bDebug)
         {
            _level0.debug("Lobby.onAction() NOT ACCEPTING MESSAGES");
         }
         return undefined;
      }
      var aNNSplit = xml.NodeName.split(".",2);
      var sNNPrefix = aNNSplit[0];
      var sNNPostFix = aNNSplit[1];
      this[sNNPostFix](xml);
   };
   lobby.onChat = function(sChatString, sUsername, aRecipients)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onChat(" + sChatString + "," + sUsername + "," + aRecipients + ")");
      }
   };
   lobby.onEnter = function()
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onEnter()");
      }
      this._oLobbyRootContext.mcPlayer.sPlayerName = _level0._session.getUsername();
      var aParticipants = this.getParticipantList("participants").getParticipants().values();
      i = 0;
      while(i < aParticipants.length)
      {
         var oParticipant = aParticipants[i];
         var sPlayerName = oParticipant.getName();
         var oPlayer = new this._oLobbyRootContext.LobbyPlayer(this._oLobbyRootContext,sPlayerName);
         this._oLobbyRootContext._oPlayers.addPlayer(oPlayer);
         i++;
      }
      this._oLobbyRootContext._oPlayers.display();
      _level0.sStatus = "";
   };
   lobby.onEnterFailed = function(iReasonID, sReason)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onEnterFailed(" + iReasonID + "," + sReason + ")");
      }
   };
   lobby.onException = function(sReason, sReasonID, sMsgID)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onException(" + sReason + "," + sReasonID + "," + sMsgID + ")");
      }
   };
   lobby.onExit = function()
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onExit()");
      }
      this.remove();
   };
   lobby.onParticipantEntered = function(participant)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onParticipantEntered(" + participant + ")");
      }
      if(participant.getName() == _level0._session.getUsername())
      {
         return undefined;
      }
      var oPlayer = new this._oLobbyRootContext.LobbyPlayer(this._oLobbyRootContext,participant.getName());
      this._oLobbyRootContext._oPlayers.addPlayer(oPlayer);
      this._oLobbyRootContext._oPlayers.display();
   };
   lobby.onParticipantExited = function(participant)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onParticipantExited(" + participant + ")");
      }
      var oPlayer = this._oLobbyRootContext._oPlayers.getPlayerByName(participant.getName());
      this._oLobbyRootContext._oPlayers.removePlayer(oPlayer);
      this._oLobbyRootContext._oPlayers.display();
      this._oLobbyRootContext._oMessages.removeMessagesFromPlayer(oPlayer.getPlayerName());
   };
   lobby.onParticipantEjected = function(sReason)
   {
      _level0.debug("lobby.onParticipantEjected() " + sReason);
      this._enterStatus = "removed";
      this.remove();
   };
   lobby.onSetParticipantGroup = function(sGroupID, sSeatID, sLastGroupID, sLastSeatID)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onSetParticipantGroup(" + sGroupID + "," + sSeatID + "," + sLastGroupID + "," + sLastSeatID + ")");
      }
   };
   lobby.onSetParticipantGroupFailed = function(iReasonID, sReason)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.onSetParticipantGroupFailed(" + iReasonID + "," + sReason + ")");
      }
   };
   lobby.init = function(oLobbyRootContext, oGameRootContext)
   {
      this._bDebug = false;
      if(this._bDebug)
      {
         _level0.debug("createLobby()");
      }
      this._oLobbyRootContext = oLobbyRootContext;
      this._oGameRootContext = oGameRootContext;
      this.setAcceptMessages(true);
   };
   lobby.initRooms = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("Lobby.initGames(" + xml + ")");
      }
      var aRooms = xml.childNodes;
      var aRoomIds = new Array();
      var i = 0;
      while(i < aRooms.length)
      {
         var xmlRoom = aRooms[i];
         var sRoomId = xmlRoom.attributes.roomId;
         aRoomIds.push(sRoomId);
         var sTitle = xmlRoom.attributes.title;
         var iParticipantCount = Number(xmlRoom.attributes.participantCount);
         var iLobbyState = Number(xmlRoom.attributes.lobbyState);
         var oGame = this._oLobbyRootContext._oGames.getGameByRoomId(sRoomId);
         if(oGame == null)
         {
            oGame = new this._oLobbyRootContext.Game(this._oLobbyRootContext,this._oGameRootContext,sRoomId,sTitle,iParticipantCount,iLobbyState);
            this._oLobbyRootContext._oGames.addGame(oGame);
         }
         else
         {
            oGame.setTitle(sTitle);
            oGame.setRoomId(sRoomId);
            oGame.setVegos(iParticipantCount);
            oGame.setLobbyState(iLobbyState);
         }
         i++;
      }
      var aGames = this._oLobbyRootContext._oGames._aGames;
      var i = aGames.length - 1;
      while(i >= 0)
      {
         var oGame = aGames[i];
         var bInRoomIds = false;
         var x = 0;
         while(x < aRoomIds.length)
         {
            if(aRoomIds[x] == oGame.getRoomId())
            {
               bInRoomIds = true;
               break;
            }
            x++;
         }
         if(!bInRoomIds)
         {
            this._oLobbyRootContext._oGames.removeGame(oGame);
         }
         i--;
      }
      this._oLobbyRootContext._oGames.displayFromIndex(0);
      this._oLobbyRootContext.mcGames.mcLoadingLobby._visible = false;
   };
   lobby.sendPrivateMessage = function(sSender, sRecipient, sMessage)
   {
      sMessage = _level0.FFDK.encode("text/binhex",sMessage);
      var oXml = new XML();
      var rootElement = oXml.createElement("SendPrivateMessage");
      rootElement.attributes.sender = sSender;
      rootElement.attributes.recipient = sRecipient;
      rootElement.attributes.message = sMessage;
      oXml.appendChild(rootElement);
      _level0.debug("lobby.sendPrivateMessage: " + oXml);
      this.sendAction(oXml);
   };
   lobby.receivePrivateMessage = function(xml)
   {
      var sSender = xml.attributes.sender;
      var sMessage = xml.attributes.message;
      sMessage = _level0.FFDK.decode("text/binhex",sMessage);
      _level0.debug("Lobby.receivePrivateMessage() " + xml);
      var bBlocked = this.playerIsBlocked(sSender);
      _level0.debug("lobby.receivePrivateMessage() BLOCKED: " + bBlocked);
      if(bBlocked)
      {
         return undefined;
      }
      var oMessage = new this._oLobbyRootContext.Message(this._oLobbyRootContext,sMessage,sSender);
      this._oLobbyRootContext._oMessages.addMessage(oMessage);
      this._oLobbyRootContext._visible = true;
   };
   lobby.playerIsBlocked = function(sPlayer)
   {
      var oPlayer = this._oLobbyRootContext._oPlayers.getPlayerByName(sPlayer);
      var bBlocked = oPlayer.getBlocked();
      return bBlocked;
   };
   lobby.setAcceptMessages = function(bAcceptMessages)
   {
      this._bAcceptMessages = bAcceptMessages;
   };
   lobby.getAcceptMessages = function()
   {
      return this._bAcceptMessages;
   };
   lobby.getAvatars = function(sRoomID)
   {
      if(this._bDebug)
      {
         _level0.debug("lobby.getAvatars(" + sRoomID + ")");
      }
      var oXml = new Xml();
      var oRoot = oXml.createElement("RevealChallenge.GetAvatars");
      oRoot.attributes.roomID = sRoomID;
      oXml.appendChild(oRoot);
      this.sendAction(oXml);
   };
   lobby.InitAllAvatars = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("lobby.InitAllAvatars() " + xml);
      }
      var sRoomId = xml.attributes.roomId;
      var oGameDetail = this._oLobbyRootContext._oGames._oGameDetail;
      if(oGameDetail.getRoomId() != sRoomId)
      {
         return undefined;
      }
      var sTitle = xml.attributes.title;
      var iParticipantCount = Number(xml.attributes.participantCount);
      var iLobbyState = Number(xml.attributes.lobbyState);
      var aVegos = new Array();
      var aAvatars = this.getNodes(xml,"RevealChallenge.InitAvatar");
      var i = 0;
      while(i < aAvatars.length)
      {
         var oAvatar = aAvatars[i];
         var sUsername = oAvatar.attributes.username;
         var sAttributes = oAvatar.attributes.avatar_attributes;
         var oVego = {username:sUsername,avatar_attributes:sAttributes};
         aVegos.push(oVego);
         i++;
      }
      var oGame = this._oLobbyRootContext._oGames.getGameByRoomId(sRoomId);
      _level0.debug("oGame: " + oGame);
      oGame.setTitle(sTitle);
      oGame.setVegos(iParticipantCount);
      ogame.setLobbyState(iLobbyState);
      oGame.setAvatars(aVegos);
      oGame.displayGameDetail();
      this._oLobbyRootContext._oGames.displayFromIndex(0);
   };
   lobby.getNode = function(xml, sNodeName)
   {
      var childNodes = xml.childNodes;
      var i = 0;
      while(i < childNodes.length)
      {
         var node = childNodes[i];
         if(node.nodeName == sNodeName)
         {
            return node;
         }
         i++;
      }
   };
   lobby.getNodes = function(xml, sNodeName)
   {
      var aNodes = new Array();
      var childNodes = xml.childNodes;
      var i = 0;
      while(i < childNodes.length)
      {
         var node = childNodes[i];
         if(node.nodeName == sNodeName)
         {
            aNodes.push(node);
         }
         i++;
      }
      return aNodes;
   };
   lobby.init(oLobbyRootContext,oGameRootContext);
   return lobby;
}
function Games(oRootContext, mcClip)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new Games(" + oRootContext + "," + mcClip + ")");
   }
   this._oRootContext = oRootContext;
   this._mcClip = mcClip;
   this._aGames;
   this._oScroller;
   this._oGameDetail;
   this.initGames();
}
function Game(oLobbyRootContext, oGameRootContext, sRoomId, sTitle, iVegos, iLobbyState)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new Game(" + oLobbyRootContext + "," + oGameRootContext + "," + sRoomId + "," + sTitle + "," + iVegos + "," + iLobbyState + ")");
   }
   this._oLobbyRootContext = oLobbyRootContext;
   this._oGameRootContext = oGameRootContext;
   this._sRoomId;
   this._sTitle;
   this._iVegos;
   this._iLobbyState;
   this._aPlayers;
   this._aAvatars;
   this._bPlayable;
   this._bRequestSent;
   this.setRoomId(sRoomId);
   this.setTitle(sTitle);
   this.setVegos(iVegos);
   this.setLobbyState(iLobbyState);
   this.setAvatars(new Array());
   this.setPlayable(true);
   this.setRequestSent(false);
}
function GameDetail(oRootContext, mcClip)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new GameDetail(" + oRootContext + "," + mcClip + ")");
   }
   this._oRootContext = oRootContext;
   this._mcClip = mcClip;
   this._mcClip._visible = false;
   this.display("",0,"",false,false,new Array());
   this._sRoomId;
   this.loadAvatarEngine();
}
function Messages(oRootContext, mcClip)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new Messages(" + oRootContext + "," + mcClip + ")");
   }
   this._oRootContext = oRootContext;
   this._mcAnimateClip = mcClip;
   this._mcClip = mcClip.mcMessages_Content;
   this._aMessages;
   this.initMessages();
   this._mcClip._visible = true;
   this._mcClip.mcInput._visible = false;
   this._mcClip.mcOutput._visible = true;
   this._CLOSED = "CLOSED";
   this._OPEN = "OPEN";
   this.setState(this._CLOSED);
}
function Message(oRootContext, sMessage, sSender)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new Message(" + oRootContext + "," + sMessage + "," + sSender + ")");
   }
   this._oRootContext = oRootContext;
   this._sSender;
   this._sMessage;
   this.setSender(sSender);
   this.setMessage(sMessage);
}
function Players(oRootContext, mcClip)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new Players(" + oRootContext + "," + mcClip + ")");
   }
   this._oRootContext = oRootContext;
   this._mcClip = mcClip;
   this._aPlayers;
   this.initPlayers();
}
function LobbyPlayer(oRootContext, sPlayerName)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new LobbyPlayer(" + oRootContext + "," + sPlayerName + ")");
   }
   this._oRootContext = oRootContext;
   this._sPlayerName;
   this._bBlocked;
   this.setPlayerName(sPlayerName);
   this.setBlocked(false);
}
function createRoom(oLobbyRootContext, oGameRootContext, sRoomId)
{
   var room = _level0._session.newRoom(sRoomId);
   room.onAction = function(xml, sUsername, aRecipients)
   {
      if(this._bDebug)
      {
         _level0.debug("room.onAction(" + xml + "," + sUsername + "," + aRecipients + ")");
      }
      var aNNSplit = xml.NodeName.split(".",2);
      var sNNPrefix = aNNSplit[0];
      var sNNPostFix = aNNSplit[1];
      if(sNNPrefix == "Lobby")
      {
         if(sNNPostFix == "Refresh")
         {
            this.LobbyRefresh(xml);
         }
         else
         {
            this[sNNPostFix](xml);
         }
      }
      if(sNNPrefix == "RevealChallenge")
      {
         this[sNNPostFix](xml);
      }
      if(sNNPrefix == "Game")
      {
         if(sNNPostFix == "Refresh")
         {
            this.GameRefresh(xml);
         }
         else
         {
            this[sNNPostFix](xml);
         }
      }
   };
   room.onChat = function(sChatString, sUsername, aRecipients)
   {
      if(this._bDebug)
      {
         _level0.debug("room.onChat(" + sChatString + "," + sUsername + "," + aRecipients + ")");
      }
   };
   room.onEnter = function()
   {
      if(this._bDebug)
      {
         _level0.debug("room.onEnter()");
      }
      var oGame = this._oLobbyRootContext._oGames.getGameByRoomId(this.getRoomId());
      oGame.setPlayable(true);
      this._oLobbyRootContext._oGames.setRequestSent(false);
   };
   room.onEnterFailed = function(iReasonID, sReason)
   {
      if(this._bDebug)
      {
         _level0.debug("room.onEnterFailed(" + iReasonID + "," + sReason + ")");
      }
      this._oLobbyRootContext._oGames.setRequestSent(false);
   };
   room.onExit = function()
   {
      _level0.debug("room.onExit()");
      var oGameController = this._oGameRootContext._oGameController;
      var bIsGameRoom = oGameController.getRoom().getRoomId() == this.getRoomId();
      if(bIsGameRoom)
      {
         oGameController.resetGame();
         _level0.debug("room.onExit() LEFT GAME ROOM");
         oGameController.setRoom(null);
      }
      this._oLobbyRootContext._oGames.setRequestSent(false);
      this._enterStatus = "removed";
      this.remove();
   };
   room.onException = function(sReason, sReasonID, sMsgID)
   {
      _level0.debug("room.onException(" + sReason + "," + sReasonID + "," + sMsgID + ")");
   };
   room.onParticipantEntered = function(participant)
   {
      if(this._bDebug)
      {
         _level0.debug("room.onParticipantEntered(" + participant + ")");
      }
   };
   room.onParticipantExited = function(participant)
   {
      if(this._bDebug)
      {
         _level0.debug("room.onParticipantExited(" + participant + ")");
      }
   };
   room.onParticipantEjected = function(sReason)
   {
      _level0.debug("room.onParticipantEjected() " + sReason);
      _level2.gotoAndPlay("Active");
      _level2._visible = true;
      _level2.mcCloseButton._visible = false;
      _level0.mcLogo._visible = true;
      _level0.mcPod1._visible = true;
      _level0.mcPod2._visible = true;
      _level0.mcTour._visible = true;
      _level0.mcHelp._visible = true;
      this._oGameRootContext.mcHost._oHost.stopVo();
      this._oGameRootContext.mcMusicSfx._oMusicSfx.stopMusic();
      this._oGameRootContext.mcChatInput.mcSound.gotoAndStop("Off");
      this._oGameRootContext._oGameController.resetGame();
      this._oGameRootContext._visible = false;
      this.onExit();
   };
   room.PlayerAdded = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.PlayerAdded() " + xml);
      }
      var xmlPlayer = this.getNode(xml,"Player");
      var oPlayer = this.createPlayer(xmlPlayer);
      var bNewPlayer = false;
      if(this.getPlayerByUsername(oPlayer.getUsername()) == null)
      {
         bNewPlayer = true;
      }
      _level0.debug("room.PlayerAdded() NEW PLAYER: " + oPlayer.getUsername());
      this.addPlayer(oPlayer);
      if(this._oGameRootContext._oGameController.getInitialized() && bNewPlayer)
      {
         _level0.debug("room.PlayerAdded() ENTERING NEW PLAYER: " + oPlayer.getUsername());
         this._oGameRootContext._oGameController.playerEntered(oPlayer);
      }
   };
   room.PlayerRemoved = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.PlayerRemoved() " + xml);
      }
      var xmlPlayer = this.getNode(xml,"Player");
      var oPlayer = this.createPlayer(xmlPlayer);
      this.removePlayer(oPlayer);
      if(this._oGameRootContext._oGameController.getRoom().getRoomID() == this.getRoomID())
      {
         this._oGameRootContext._oGameController.playerExited(oPlayer);
         if(oPlayer.getUsername() == _level0._session.getUsername())
         {
            this._oGameRootContext._oGameController.setRoom(null);
            this._oGameRootContext._oGameController.resetGame();
         }
      }
   };
   room.onSetParticipantGroup = function(sGroupID, sSeatID, sLastGroupID, sLastSeatID)
   {
      if(this._bDebug)
      {
         _level0.debug("room.onSetParticipantGroup(" + sGroupID + "," + sSeatID + "," + sLastGroupID + "," + sLastSeatID + ")");
      }
   };
   room.onSetParticipantGroupFailed = function(iReasonID, sReason)
   {
      if(this._bDebug)
      {
         _level0.debug("room.onSetParticipantGroupFailed(" + iReasonID + "," + sReason + ")");
      }
   };
   room.startGame = function()
   {
      var oXml = new XML("<Lobby.StartGame/>");
      this.sendAction(oXml);
   };
   room.StartGameAccepted = function(attrs)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.StartGameAccepted() roomID: " + this.getRoomID());
      }
   };
   room.StartGameRejected = function(attrs)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.StartGameRejected() roomID: " + this.getRoomID());
      }
   };
   room.Begin = function(attrs)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.Begin() roomID: " + this.getRoomID());
      }
   };
   room.End = function(attrs)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.End() roomID: " + this.getRoomID());
      }
   };
   room.GameRefresh = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.GameRefresh() " + xml);
      }
      var bInitialized = this._oGameRootContext._oGameController.getInitialized();
      var bNewPlayer = false;
      var aNewPlayers = new Array();
      var xmlPlayers = this.getNodes(xml,"Player");
      var i = 0;
      while(i < xmlPlayers.length)
      {
         var xmlPlayer = xmlPlayers[i];
         var oPlayer = this.createPlayer(xmlPlayer);
         if(this.getPlayerByUsername(oPlayer.getUsername()) == null)
         {
            _level0.debug("room.GameRefresh() NEW PLAYER: " + oPlayer.getUsername());
            var bNewPlayer = true;
            aNewPlayers.push(oPlayer);
         }
         this.addPlayer(oPlayer);
         i++;
      }
      if(!bInitialized)
      {
         _level0.debug("room.GameRefresh() INITIALIZING GAME");
         this._oGameRootContext._oGameController.setRoom(this);
         this._oGameRootContext._oGameController.initGame(this.getPlayers());
      }
      else
      {
         _level0.debug("room.GameRefresh() ENTRING NEW PLAYERS");
         var i = 0;
         while(i < aNewPlayers.length)
         {
            var oPlayer = aNewPlayers[i];
            this._oGameRootContext._oGameController.playerEntered(oPlayer);
            i++;
         }
      }
   };
   room.setOptions = function(password, watchable)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.setOptions(" + password + "," + watchable + ") roomID: " + this.getRoomID());
      }
      var oXml = new XML();
      var root = oXml.createElement("Lobby.SetGameOptions");
      if(password != null)
      {
         root.attributes.password = password;
      }
      if(watchable != null)
      {
         root.attributes.watchable = watchable;
      }
      oXml.appendChild(root);
      this.sendAction(oXml);
   };
   room.SetOptionsAccepted = function(attrs)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.SetOptionsAccepted() roomID: " + this.getRoomID());
      }
   };
   room.SetOptionsRejected = function(attrs)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.SetOptionsRejected() roomID: " + this.getRoomID());
      }
   };
   room.isMemberOfRoom = function(sUsername)
   {
      if(this._bDebug)
      {
         _level0.debug("Room.isMemberOfRoom(" + sUsername + ") roomId: " + this.getRoomId());
      }
      var oParticipant = this.getParticipantList("participants").getParticipant(_level0._session.getUsername());
      return oParticipant != null;
   };
   room.prepareGameRoom = function()
   {
      if(this._bDebug)
      {
         _level0.debug("room.prepareGame()");
      }
      this._bLobbyActive = false;
      this._oLobbyRootContext._oLobby.setAcceptMessages(false);
      _level2.gotoAndPlay("Dormant");
      _level1._oGameController.prepareGameRoom(this);
   };
   room.leaveAllRoomsExcept = function(sRoomId)
   {
      if(this._bDebug)
      {
         _level0.debug("room.leaveAllRoomsExcept(" + sRoomId + ")");
      }
      var aRooms = _level0._session.getRooms().values();
      var i = 0;
      while(i < aRooms.length)
      {
         var oRoom = aRooms[i];
         if(oRoom.getRoomId() != sRoomId)
         {
            if(this._bDebug)
            {
               _level0.debug("room.leaveAllRoomsExcept(" + sRoomId + ") LEAVING ROOM: " + oRoom.getRoomId());
            }
            oRoom.LeaveThisRoom();
         }
         i++;
      }
   };
   room.getPlayers = function()
   {
      return this._aPlayers;
   };
   room.addPlayer = function(oPlayer)
   {
      if(this._bDebug)
      {
         _level0.debug("room.addPlayer(" + oPlayer + ")");
      }
      this._aPlayers[oPlayer.getSlot() - 1] = oPlayer;
      if(this._bDebug)
      {
         _level0.debug("room.addPlayer() aPlayers: " + this._aPlayers.toString());
      }
   };
   room.removePlayer = function(oPlayer)
   {
      if(this._bDebug)
      {
         _level0.debug("room.removePlayer(" + oPlayer + ")");
      }
      this._aPlayers[oPlayer.getSlot() - 1] = null;
      if(this._bDebug)
      {
         _level0.debug("room.removePlayer() aPlayers: " + this._aPlayers.toString());
      }
   };
   room.getPlayerBySlot = function(iSlot)
   {
      var i = 0;
      while(i < this._aPlayers.length)
      {
         var oPlayer = this._aPlayers[i];
         if(oPlayer.getSlot() == iSlot)
         {
            return oPlayer;
         }
         i++;
      }
      return null;
   };
   room.getPlayerByUsername = function(sUsername)
   {
      var i = 0;
      while(i < this._aPlayers.length)
      {
         var oPlayer = this._aPlayers[i];
         if(oPlayer.getUsername() == sUsername)
         {
            return oPlayer;
         }
         i++;
      }
      return null;
   };
   room.createPlayer = function(xmlPlayer)
   {
      if(this._bDebug)
      {
         _level0.debug("room.createPlayer() " + xml);
      }
      var oPlayer = new this._oLobbyRootContext.GamePlayer();
      oPlayer.setUsername(xmlPlayer.attributes.username);
      oPlayer.setSlot(Number(xmlPlayer.attributes.seatID));
      oPlayer.setAvatarAttributes(xmlPlayer.attributes.avatar_attributes);
      if(this._bDebug)
      {
         _level0.debug("room.createPlayer() oPlayer: " + oPlayer.toString());
      }
      return oPlayer;
   };
   room.getNode = function(xml, sNodeName)
   {
      var childNodes = xml.childNodes;
      var i = 0;
      while(i < childNodes.length)
      {
         var node = childNodes[i];
         if(node.nodeName == sNodeName)
         {
            return node;
         }
         i++;
      }
   };
   room.getNodes = function(xml, sNodeName)
   {
      var aNodes = new Array();
      var childNodes = xml.childNodes;
      var i = 0;
      while(i < childNodes.length)
      {
         var node = childNodes[i];
         if(node.nodeName == sNodeName)
         {
            aNodes.push(node);
         }
         i++;
      }
      return aNodes;
   };
   room.setGameState = function(oGameState)
   {
      this._oGameState = oGameState;
   };
   room.getGameState = function()
   {
      return this._oGameState;
   };
   room.LeaveThisRoom = function()
   {
      if(this._bDebug)
      {
         _level0.debug("room.leaveThisRoom()");
      }
      this.exit();
   };
   room.LeaveAllOtherRooms = function()
   {
      if(this._bDebug)
      {
         _level0.debug("room.leaveAllOtherRooms()");
      }
      this.leaveAllRoomsExcept(this.getRoomId());
   };
   room.Message = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.Message() " + xml);
      }
      var sText = _level0._oResourceText.replaceText(xml.attributes);
      this._oGameRootContext._oGameController.displayMessage(sText);
   };
   room.ClearMessage = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.ClearMessage() " + xml);
      }
      this._oGameRootContext._oGameController.clearMessage();
   };
   room.GameState = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.GameState() " + xml);
      }
      var iGameStateId = Number(xml.attributes.gameStateId);
      var sGameState = xml.attributes.gameStateName;
      this._oGameRootContext._oGameController.setGameState(iGameStateId,sGameState);
   };
   room.Captain1Interface = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.Captain1Interface() " + xml);
      }
      var oTextNode = this.getNode(xml,"RevealChallenge.Message");
      var sText = _level0._oResourceText.replaceText(oTextNode.attributes);
      var iTimeLength = Number(xml.attributes.timeLength);
      var bVisible = xml.attributes.visible == "true";
      this._oGameRootContext._oGameController.Captain1Interface(sText,bVisible,iTimeLength);
   };
   room.Captain2Interface = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.Captain2Interface() " + xml);
      }
      var oTextNode = this.getNode(xml,"RevealChallenge.Message");
      var sText = _level0._oResourceText.replaceText(oTextNode.attributes);
      var iTimeLength = Number(xml.attributes.timeLength);
      var bVisible = xml.attributes.visible == "true";
      this._oGameRootContext._oGameController.Captain2Interface(sText,bVisible,iTimeLength);
   };
   room.UpdateScores = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.UpdateScores() " + xml);
      }
      var aPlayers = this.getNodes(xml,"Player");
      var i = 0;
      while(i < aPlayers.length)
      {
         var oPlayerElement = aPlayers[i];
         var sUsername = oPlayerElement.attributes.username;
         var iVotes = Number(oPlayerElement.attributes.votes);
         var iRank = Number(oPlayerElement.attributes.rank);
         var oPlayer = this.getPlayerByUsername(sUsername);
         oPlayer.setScore(iVotes);
         oPlayer.setRank(iRank);
         this._oGameRootContext._oGameController.updatePlayerScore(oPlayer);
         i++;
      }
   };
   room.GameWinners = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.GameWinners() " + xml);
      }
      var aWinners = new Array();
      var aPlayers = this.getNodes(xml,"Player");
      var i = 0;
      while(i < aPlayers.length)
      {
         var oPlayerElement = aPlayers[i];
         var sPlayerName = oPlayerElement.attributes.username;
         var iMatches = Number(oPlayerElement.attributes.matches);
         var iBonus = Number(oPlayerElement.attributes.bonus);
         var iDecibels = Number(oPlayerElement.attributes.decibels);
         var oResult = {sPlayerName:sPlayerName,iMatches:iMatches,iBonus:iBonus,iVotingBonus:iVotingBonus,iDecibels:iDecibels};
         _level0.debug("oResult: sPlayerName: " + oResult.sPlayerName + ", iMatches: " + oResult.iMatches + ", iBonus: " + oResult.iBonus + ", iVotingBonus: " + oResult.iVotingBonus + ", iDecibels: " + oResult.iDecibels);
         aWinners.push(oResult);
         i++;
      }
      this._oGameRootContext._oGameController.GameWinners(aWinners);
   };
   room.DisplayPopUp = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.DisplayDecibels(" + xml + ")");
      }
      var oTextNode = this.getNode(xml,"RevealChallenge.Message");
      var sText = _level0._oResourceText.replaceText(oTextNode.attributes);
      var iCode = Number(xml.attributes.code);
      var bOk = xml.attributes.ok == "true";
      var bCancel = xml.attributes.cancel == "cancel";
      this._oGameRootContext._oGameController.DisplayPopUp(sText,iCode,bOk,bCancel);
   };
   room.PlayVo = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.PlayVoType() " + xml);
      }
      var sType = xml.attributes.voType;
      this._oGameRootContext._oGameController.playVoType(sType);
   };
   room.LeaveGame = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.LeaveGame() " + xml);
      }
      _level2.gotoAndPlay("Active");
      _level2._visible = true;
      _level2.mcCloseButton._visible = false;
      _level0.mcLogo._visible = true;
      _level0.mcPod1._visible = true;
      _level0.mcPod2._visible = true;
      _level0.mcTour._visible = true;
      _level0.mcHelp._visible = true;
      this._oGameRootContext.mcHost._oHost.stopVo();
      this._oGameRootContext.mcMusicSfx._oMusicSfx.stopMusic();
      this._oGameRootContext.mcChatInput.mcSound.gotoAndStop("Off");
      this._oGameRootContext._oGameController.resetGame();
      this._oGameRootContext._visible = false;
      this.exit();
   };
   room.Chat = function(xml)
   {
      var sEncodedMessage = xml.attributes.message;
      var sDecodedMessage = _level0.FFDK.decode("text/binhex",sEncodedMessage);
      var sUsername = xml.attributes.username;
      this._oGameRootContext._oGameController.receiveChat(sDecodedMessage,sUsername);
   };
   room.InitGrid = function(xml)
   {
      _level0.debug("room.InitGrid() " + xml);
      var iRows = Number(xml.attributes.rows);
      var iCols = Number(xml.attributes.cols);
      var aCards = new Array();
      var aRows = this.getNodes(xml,"row");
      var i = 0;
      while(i < aRows.length)
      {
         var oRow = aRows[i];
         var iRowId = Number(oRow.attributes.id);
         var aCols = this.getNodes(oRow,"col");
         var x = 0;
         while(x < aCols.length)
         {
            var oCol = aCols[x];
            var iColId = Number(oCol.attributes.id);
            var iCardId = Number(oCol.attributes.cardId);
            var oCard = {iCardId:iCardId,iRow:iRowId,iCol:iColId};
            aCards.push(oCard);
            x++;
         }
         i++;
      }
      this._oGameRootContext._oGameController.initGrid(iRows,iCols,aCards);
   };
   room.ClearGrid = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.ClearGrid()");
      }
      this._oGameRootContext._oGameController.clearGrid();
   };
   room.LockGrid = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.LockGrid()");
      }
      this._oGameRootContext._oGameController.lockGrid();
   };
   room.UnlockGrid = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.UnLockGrid()");
      }
      this._oGameRootContext._oGameController.unLockGrid();
   };
   room.RevealCards = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.RevealCards(" + xml + ")");
      }
      var aCardElements = this.getNodes(xml,"Card");
      var aCards = this.createCards(aCardElements);
      this._oGameRootContext._oGameController.revealCards(aCards);
   };
   room.UnRevealCards = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.UnRevealCards() " + xml);
      }
      var aCardElements = this.getNodes(xml,"Card");
      var aCards = this.createCards(aCardElements);
      this._oGameRootContext._oGameController.unRevealCards(aCards);
   };
   room.RemoveCards = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.RemoveCards() " + xml);
      }
      var aCardElements = this.getNodes(xml,"Card");
      var aCards = this.createCards(aCardElements);
      this._oGameRootContext._oGameController.removeCards(aCards);
   };
   room.RemoveAllCards = function(xml)
   {
      _level0.debug("room.RemoveAlllCards() " + xml);
      this._oGameRootContext._oGameController.removeAllCards();
   };
   room.DisplayMatch = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.DisplayMatch() " + xml);
      }
      var aCardElements = this.getNodes(xml,"Card");
      var aCards = this.createCards(aCardElements);
      this._oGameRootContext._oGameController.displayMatch(aCards);
   };
   room.DisplayMiss = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.DisplayMiss() " + xml);
      }
      var aCardElements = this.getNodes(xml,"Card");
      var aCards = this.createCards(aCardElements);
      this._oGameRootContext._oGameController.displayMiss(aCards);
   };
   room.IndicateTurn = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.IndicateTurn() " + xml);
      }
      var sPlayer = xml.attributes.player;
      var oPlayer = this.getPlayerByUsername(sPlayer);
      this._oGameRootContext._oGameController.indicateTurn(oPlayer);
   };
   room.StartTimer = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.StartTimer() " + xml);
      }
      var iLength = Number(xml.attributes.length);
      this._oGameRootContext._oGameController.startTimer(iLength);
   };
   room.StopTimer = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.StopTimer() " + xml);
      }
      this._oGameRootContext._oGameController.stopTimer();
   };
   room.TurnResults = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.TurnResults() " + xml);
      }
      var sWinner = xml.attributes.winner;
      this._oGameRootContext._oGameController.displayRoundWinner(sWinner);
      var aTurnResults = new Array();
      var aPlayers = this.getNodes(xml,"Player");
      var i = 0;
      while(i < aPlayers.length)
      {
         var oPlayer = aPlayers[i];
         var sUsername = oPlayer.attributes.username;
         var iRank = Number(oPlayer.attributes.rank);
         var iMatches = Number(oPlayer.attributes.matches);
         var oGamePlayer = this.getPlayerByUsername(sUsername);
         oGamePlayer.setScore(iMatches);
         oGamePlayer.setRank(iRank);
         this._oGameRootContext._oGameController.updatePlayerScore(oGamePlayer);
         i++;
      }
   };
   room.createCards = function(aCardElements)
   {
      var aCards = new Array();
      var i = 0;
      while(i < aCardElements.length)
      {
         var oCardElement = aCardElements[i];
         var iRow = oCardElement.attributes.row;
         var iCol = oCardElement.attributes.col;
         var iCardId = oCardElement.attributes.cardId;
         var oCard = {iRow:iRow,iCol:iCol,iCardId:iCardId};
         oCard.toString = function()
         {
            return "[ Card ] iRow: " + this.iRow + ", iCol: " + this.iCol;
         };
         aCards.push(oCard);
         i++;
      }
      return aCards;
   };
   room.PlayWildCard = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.PlayWildCard() " + xml);
      }
      this._oGameRootContext._oGameController.PlayWildCard();
   };
   room.StopWildCard = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.StopWildCard() " + xml);
      }
      this._oGameRootContext._oGameController.StopWildCard();
   };
   room.PlayLoseTurn = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.PlayLoseTurn() " + xml);
      }
      this._oGameRootContext._oGameController.PlayLoseTurn();
   };
   room.StopLoseTurn = function(xml)
   {
      if(this._bDebug)
      {
         _level0.debug("room.StopLoseTurn() " + xml);
      }
      this._oGameRootContext._oGameController.StopLoseTurn();
   };
   room.sendRevealChallengeChat = function(sMessage)
   {
      if(this._bDebug)
      {
         _level0.debug("room.sendRevealChallengeChat()");
      }
      var oXml = new XML();
      var oRoot = oXml.createElement("RevealChallenge.Chat");
      oRoot.attributes.username = _level0._session.getUsername();
      var sEncodedMessage = _level0.FFDK.encode("text/binhex",sMessage);
      oRoot.attributes.message = sEncodedMessage;
      oXml.appendChild(oRoot);
      this.sendAction(oXml);
   };
   room.waitForMorePlayers = function()
   {
      var oXml = new XML("<RevealChallenge.WaitForMorePlayers/>");
      this.sendAction(oXml);
   };
   room.sequenceGame = function()
   {
      if(this._bDebug)
      {
         _level0.debug("room.sequenceGame()");
      }
      var oXml = new Xml("<RevealChallenge.SequenceGame/>");
      this.sendAction(oXml);
   };
   room.sendGetDecibels = function()
   {
      if(this._bDebug)
      {
         _level0.debug("room.sendGetDecibels()");
      }
      var oXml = new Xml();
      var oRoot = oXml.createElement("RevealChallenge.GetDecibels");
      oXml.appendChild(oRoot);
      this.sendAction(oXml);
   };
   room.requestRevealCard = function(iRow, iCol, iCardId)
   {
      if(this._bDebug)
      {
         _level0.debug("room.requestRevealCard(" + iRow + "," + iCol + "," + iCardId + ")");
      }
      var oXml = new Xml();
      var oRoot = oXml.createElement("RevealChallenge.RequestRevealCard");
      oRoot.attributes.row = iRow;
      oRoot.attributes.col = iCol;
      oRoot.attributes.cardId = iCardId;
      oXml.appendChild(oRoot);
      this.sendAction(oXml);
   };
   room.init = function(oLobbyRootContext, oGameRootContext)
   {
      this._bDebug = true;
      if(this._bDebug)
      {
         _level0.debug("createRoom(" + oLobbyRootContext + "," + oGameRootContext + "," + this.getRoomId() + ")");
      }
      this._bLobbyActive = true;
      this._oLobbyRootContext = oLobbyRootContext;
      this._oGameRootContext = oGameRootContext;
      this._oGameState = null;
      this._aPlayers = new Array();
   };
   room.init(oLobbyRootContext,oGameRootContext);
   return room;
}
function GamePlayer()
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new GamePlayer()");
   }
   this._iSlot;
   this._sUsername;
   this._sAvatarGender;
   this._sAvatarMission;
   this._sAvatarAttributes = null;
   this._iDecibels;
   this._iScore = 0;
   this._iRank = 0;
}
function Scroller(oController, mcClip, iMaxUIDisplayIndex)
{
   this._bDebug = false;
   if(this._bDebug)
   {
      _level0.debug("new Scroller(" + oController + "," + mcClip + "," + iMaxUIDisplayIndex + ")");
   }
   this._oController = oController;
   this._mcClip = mcClip;
   this._mcClip._oController = this;
   this._iDisplayIndex;
   this._iMaxDisplayIndex;
   this._iMaxUIDisplayIndex;
   this._iFrameRate;
   this._iTimer;
   this._iTimerLength;
   this._iThumbLow = mcClip.mcScrollUp._y + mcClip.mcScrollUp._height;
   this._iThumbHi = mcClip.mcScrollDown._y - mcClip.mcScrollThumb._height;
   this._mcClip.mcScrollThumb._y = this._iThumbLow;
   this._bScrolling = false;
   this._iScrollDir = 0;
   this._bThumbScrolling = false;
   this._iThumbOffset = 0;
   this.setFrameRate(20);
   this.setMaxUIDisplayIndex(iMaxUIDisplayIndex);
   this.setDisplayIndex(0);
   this.setMaxDisplayIndex(0);
}
_level0.debug("Lobby: Active");
stop();
Games.prototype.initGames = function()
{
   _level0.debug("Games.prototype.initGames()");
   this._aGames = new Array();
   this._oScroller = new this._oRootContext.Scroller(this,this._mcClip.mcScroller);
   this._oScroller.setMaxUIDisplayIndex(10);
   this.displayFromIndex(0);
   this._oGameDetail = new this._oRootContext.GameDetail(this._oRootContext,this._mcClip.mcGameDetail);
};
Games.prototype.addGame = function(oGame)
{
   if(this._bDebug)
   {
      _level0.debug("Games.addGame(" + oGame + ")");
   }
   this._aGames.push(oGame);
   this._oScroller.setMaxDisplayIndex(this._aGames.length - 1);
};
Games.prototype.removeGame = function(oGame)
{
   var i = 0;
   while(i < this._aGames.length)
   {
      if(this._aGames[i].getRoomId() == oGame.getRoomId())
      {
         this._aGames.splice(i,1);
         break;
      }
      i++;
   }
   this._oScroller.setMaxDisplayIndex(this._aGames.length - 1);
};
Games.prototype.getGame = function(sRoomId)
{
   var i = 0;
   while(i < this._aGames.length)
   {
      oGame = this._aGames[i];
      if(oGame.getRoomId() == sRoomId)
      {
         return oGame;
      }
      i++;
   }
};
Games.prototype.getGameByRoomId = function(sRoomId)
{
   var i = 0;
   while(i < this._aGames.length)
   {
      oGame = this._aGames[i];
      if(oGame.getRoomId() == sRoomId)
      {
         return oGame;
      }
      i++;
   }
};
Games.prototype.getGameByClipName = function(sClipName)
{
   if(this._bDebug)
   {
      _level0.debug("Games.getGameByClipName(" + sClipName + ")");
   }
   var sClipIndex = sClipName.substr(sClipName.length - 2,sClipName.length);
   var iClipIndex = Number(sClipIndex);
   var iGameIndex = this._oScroller.getDisplayIndex() + iClipIndex;
   var oGame = this._aGames[iGameIndex];
   return oGame;
};
Games.prototype.getGameClipFromIndex = function(iIndex)
{
   var sClipName = iIndex >= 10 ? "mcGame" + iIndex : "mcGame0" + iIndex;
   return this._mcClip[sClipName];
};
Games.prototype.displayGameByRoomId = function(sRoomId)
{
   if(this._bDebug)
   {
      _level0.debug("Games.displayGameByRoomId(" + sRoomId + ")");
   }
   var i = 0;
   while(i < this._aGames.length)
   {
      var oGame = this._aGames[i];
      if(oGame.getRoomId() == sRoomId)
      {
         var iUIIndex = i - this._oScroller.getDisplayIndex();
         if(iUIIndex >= 0 && iUIIndex < this._oScroller.getMaxUIDisplayIndex())
         {
            var mcGameClip = this.getGameClipFromIndex(iUIIndex);
            if(mcGameClip != null)
            {
               oGame.display(mcGameClip);
            }
         }
         return undefined;
      }
      i++;
   }
};
Games.prototype.displayFromIndex = function(iIndex)
{
   if(this._bDebug)
   {
      _level0.debug("Games.displayFromIndex(" + iIndex + ")");
   }
   var i = 0;
   while(i < this._oScroller.getMaxUIDisplayIndex())
   {
      var oGame = this._aGames[iIndex];
      var mcGameClip = this.getGameClipFromIndex(i);
      if(oGame == null)
      {
         mcGameClip._visible = false;
      }
      else
      {
         oGame.display(mcGameClip);
      }
      iIndex++;
      i++;
   }
};
Games.prototype.getMemberRoom = function(sUsername)
{
   if(this._bDebug)
   {
      _level0.debug("Games.getMemberRoom(" + sUsername + ")");
   }
   var i = 0;
   while(i < this._aGames.length)
   {
      var oGame = this._aGames[i];
      var bMember = oGame.isMemberOfRoom(sUsername);
      if(bMember)
      {
         return oGame;
      }
      i++;
   }
};
Games.prototype.isMemberOfAnyRoom = function(sUsername)
{
   if(this._bDebug)
   {
      _level0.debug("Games.isMemberOfAnyRoom(" + sUsername + ")");
   }
   var i = 0;
   while(i < this._aGames.length)
   {
      var oGame = this._aGames[i];
      var bMember = oGame.getRoom().isMemberOfRoom(sUsername);
      if(bMember)
      {
         return true;
      }
      i++;
   }
   return false;
};
Games.prototype.setRequestSent = function(bSent)
{
   _level0.debug("Games.prototype.setRequestSent(" + bSent + ")");
   var i = 0;
   while(i < this._aGames.length)
   {
      var oGame = this._aGames[i];
      oGame.setRequestSent(bSent);
      i++;
   }
   this.displayFromIndex(0);
};
Game.prototype.display = function(mcClip)
{
   if(this._bDebug)
   {
      _level0.debug("Game.display(" + mcClip + ") roomId: " + this.getRoomId());
   }
   this.displayTitle(mcClip);
   this.displayVegos(mcClip);
   this.displayStatus(mcClip);
   this.displayJoin(mcClip);
   this.displayLeave(mcClip);
   this.displayPlayable(mcClip);
   mcClip._visible = true;
   if(this.getRoomId() == this._oLobbyRootContext._oGames._oGameDetail.getRoomId())
   {
      this.displayGameDetail();
   }
};
Game.prototype.displayTitle = function(mcClip)
{
   mcClip.sTitle = this.getTitle();
};
Game.prototype.displayVegos = function(mcClip)
{
   var i = 0;
   while(i < 5)
   {
      mcClip.mcVegos["mcVego" + i].gotoAndStop(i >= this._iVegos ? "Not Present" : "Present");
      i++;
   }
};
Game.prototype.displayStatus = function(mcClip)
{
   mcClip.sStatus = this.getStatus();
};
Game.prototype.displayJoin = function(mcClip)
{
   mcClip.mcJoin._visible = this.getJoinable();
};
Game.prototype.displayLeave = function(mcClip)
{
   mcClip.mcLeave._visible = this.getLeavable();
};
Game.prototype.displayPlayable = function(mcClip)
{
   mcClip.gotoAndStop(this.getPlayableFrame());
};
Game.prototype.getJoinable = function()
{
   if(this._bRequestSent)
   {
      return false;
   }
   if(this._oGameRootContext._oGameController.getRoom().isMemberOfRoom(_level0._session.getUsername()))
   {
      return false;
   }
   if(this._oGameRootContext._oGameController.getRoom().getRoomId() == this.getRoomId())
   {
      return false;
   }
   var sStatus = this.getStatus();
   if(sStatus == "Full")
   {
      return false;
   }
   if(sStatus == "Started")
   {
      return false;
   }
   return true;
};
Game.prototype.getLeavable = function()
{
   if(this._bRequestSent)
   {
      return false;
   }
   if(this._oGameRootContext._oGameController.getRoom().getRoomId() == this.getRoomId())
   {
      return true;
   }
   return false;
};
Game.prototype.getStatus = function()
{
   if(this.getFull())
   {
      return "Full";
   }
   if(this._iLobbyState == 0)
   {
      return "Empty";
   }
   if(this._iLobbyState == 1)
   {
      return "Config";
   }
   if(this._iLobbyState == 2)
   {
      return "Open";
   }
   if(this._iLobbyState == 3)
   {
      return "Ready";
   }
   if(this._iLobbyState == 4)
   {
      return "Started";
   }
   return "Full";
};
Game.prototype.getFull = function()
{
   return this._iVegos == 5;
};
Game.prototype.getPlayableFrame = function()
{
   return "Not Played";
};
Game.prototype.joinRoom = function()
{
   if(this._bDebug)
   {
      _level0.debug("Game.joinRoom()");
   }
   var oGameController = this._oGameRootContext._oGameController;
   var bIsGameRoom = oGameController.getRoom().getRoomId() == this.getRoomId();
   _level0.debug("bIsGameRoom: " + bIsGameRoom);
   var bIsMemberOfGameRoom = oGameController.getRoom().isMemberOfRoom(_level0._session.getUsername());
   if(bIsGameRoom && bIsMemberOfGameRoom)
   {
      _level0.debug("Game.joinRoom() NOT JOINING ROOM: ALREADY MEMBER");
      return undefined;
   }
   if(bIsMemberOfGameRoom)
   {
      oGameController.getRoom().exit();
   }
   this._oLobbyRootContext._oGames.setRequestSent(true);
   var oRoom = this._oLobbyRootContext.createRoom(this._oLobbyRootContext,this._oGameRootContext,this._sRoomId);
   oRoom.enter("participants");
};
Game.prototype.leaveRoom = function()
{
   if(this._bDebug)
   {
      _level0.debug("Game.leaveRoom()");
   }
   var oGameController = this._oGameRootContext._oGameController;
   var bIsGameRoom = oGameController.getRoom().getRoomId() == this.getRoomId();
   var bIsMemberOfGameRoom = oGameController.getRoom().isMemberOfRoom(_level0._session.getUsername());
   if(!(bIsGameRoom && bIsMemberOfGameRoom))
   {
      _level0.debug("Game.leaveRoom() NOT LEAVING ROOM");
      return undefined;
   }
   this._oLobbyRootContext._oGames.setRequestSent(true);
   this.getRoom()._bLobbyActive = true;
   _level2.mcCloseButton._visible = false;
   _level0.mcLogo._visible = true;
   _level0.mcPod1._visible = true;
   _level0.mcPod2._visible = true;
   _level0.mcTour._visible = true;
   _level0.mcHelp._visible = true;
   this._oGameRootContext._visible = false;
   this._oGameRootContext.mcHost._oHost.stopVo();
   this._oGameRootContext.mcMusicSfx._oMusicSfx.stopMusic();
   oGameController.getRoom().exit();
};
Game.prototype.displayGameDetail = function()
{
   _level0.debug("Game.displayGameDetail()");
   var oGameDetail = this._oLobbyRootContext._oGames._oGameDetail;
   oGameDetail.display(this.getTitle(),this.getVegos(),this.getStatus(),this.getJoinable(),this.getPlayable(),this.getAvatars());
};
Game.prototype.getTitle = function()
{
   return this._sTitle;
};
Game.prototype.setTitle = function(sTitle)
{
   this._sTitle = sTitle;
};
Game.prototype.getRoomId = function()
{
   return this._sRoomId;
};
Game.prototype.setRoomId = function(sRoomId)
{
   this._sRoomId = sRoomId;
};
Game.prototype.getPlayable = function()
{
   return this._bPlayable;
};
Game.prototype.setPlayable = function(bPlayable)
{
   this._bPlayable = bPlayable;
};
Game.prototype.getVegos = function()
{
   return this._iVegos;
};
Game.prototype.setVegos = function(iVegos)
{
   this._iVegos = iVegos;
};
Game.prototype.getRoom = function()
{
   return this._oRoom;
};
Game.prototype.setRoom = function(oRoom)
{
   this._oRoom = oRoom;
};
Game.prototype.getLobbyState = function()
{
   return this._iLobbyState;
};
Game.prototype.setLobbyState = function(iLobbyState)
{
   this._iLobbyState = iLobbyState;
};
Game.prototype.getRequestSend = function()
{
   return this._bRequestSent;
};
Game.prototype.setRequestSent = function(bSent)
{
   this._bRequestSent = bSent;
};
Game.prototype.getPlayers = function()
{
   return this._aPlayers;
};
Game.prototype.setPlayers = function(aPlayers)
{
   this._aPlayers = aPlayers;
};
Game.prototype.getAvatars = function()
{
   return this._aAvatars;
};
Game.prototype.setAvatars = function(aAvatars)
{
   this._aAvatars = aAvatars;
};
Game.prototype.toString = function()
{
   return "[Game]  _sTitle: " + this.getTitle();
};
GameDetail.prototype.setRoomId = function(sRoomId)
{
   this._sRoomId = sRoomId;
};
GameDetail.prototype.getRoomId = function()
{
   return this._sRoomId;
};
GameDetail.prototype.display = function(sTitle, iVegos, sStatus, bJoinable, bPlayable, aAvatars)
{
   if(this._bDebug)
   {
      _level0.debug("GameDetail.display(" + sTitle + "," + iVegos + "," + sStatus + "," + bJoinable + "," + bPlayable + "," + aAvatars + ")");
   }
   this.displayTitle(this._mcClip,sTitle);
   this.displayVegos(this._mcClip,iVegos);
   this.displayStatus(this._mcClip,sStatus);
   this.displayJoin(this._mcClip,bJoinable);
   this.displayPlayable(this._mcClip,bPlayable);
   this.displayAvatars(aAvatars);
   this._mcClip._visible = true;
};
GameDetail.prototype.displayTitle = function(mcClip, sTitle)
{
   mcClip.sTitle = sTitle;
};
GameDetail.prototype.displayAvatars = function(aVegos)
{
   if(aVegos == null)
   {
      return undefined;
   }
   var i = 0;
   while(i < 5)
   {
      var mcVegoClip = this.getAvatarClipByIndex(i);
      var oVego = aVegos[i];
      if(oVego == null)
      {
         mcVegoClip._visible = false;
      }
      else
      {
         var sScreenName = oVego.username;
         var sEncodedAvatarAttributes = oVego.avatar_attributes;
         var sDecodedAvatarAttributes = _level0.FFDK.decode("text/binhex",sEncodedAvatarAttributes);
         mcVegoClip.sPlayerName = sScreenName;
         if(sDecodedAvatarAttributes == null || sDecodedAvatarAttributes == "")
         {
            mcVegoClip.mcVego._visible = false;
         }
         else
         {
            mcVegoClip.mcVego.buildAvatar(sGender,sMission,sDecodedAvatarAttributes);
            mcVegoClip.mcVego._visible = true;
         }
         mcVegoClip._visible = true;
      }
      i++;
   }
};
GameDetail.prototype.displayStatus = function(mcClip, sStatus)
{
   mcClip.sStatus = sStatus;
};
GameDetail.prototype.displayJoin = function(mcClip, bJoinable)
{
   mcClip.mcJoin._visible = bJoinable;
};
GameDetail.prototype.displayPlayable = function(mcClip, bPlayable)
{
};
GameDetail.prototype.displayPlayers = function(mcClip, aPlayers)
{
   var i = 0;
   while(i < 5)
   {
      var mcVegoClip = this.getAvatarClipByIndex(i);
      var sUsername = aPlayers[i];
      if(sUsername == null)
      {
         mcVegoClip._visible = false;
      }
      else
      {
         mcVegoClip.sPlayerName = sUsername;
         mcVegoClip.mcVego._visible = false;
         mcVegoClip._visible = true;
      }
      i++;
   }
};
GameDetail.prototype.loadAvatarEngine = function()
{
   if(this._bDebug)
   {
      _level0.debug("GameDetail.loadAvatarEngine()");
   }
   var i = 0;
   while(i < 5)
   {
      var mcAvatarClip = this.getAvatarClipByIndex(i);
      var mcVegoClip = mcAvatarClip.mcVego;
      mcVegoClip.loadMovie("resources/avatar_engine.swf");
      i++;
   }
};
GameDetail.prototype.getAvatarClipByIndex = function(iIndex)
{
   return this._mcClip["mcAvatar0" + iIndex];
};
Messages.prototype.initMessages = function()
{
   this._aMessages = new Array();
   this._oScroller = new this._oRootContext.Scroller(this,this._mcClip.mcOutput.mcScroller);
   this._oScroller.setMaxUIDisplayIndex(5);
   this.displayFromIndex(0);
};
Messages.prototype.addMessage = function(oMessage)
{
   if(this.messageExists(oMessage))
   {
      return undefined;
   }
   this._aMessages.push(oMessage);
   this._oScroller.setMaxDisplayIndex(this._aMessages.length - 1);
   this._oScroller.setDisplayIndex(this._oScroller.getMaxDisplayIndex());
   this.displayFromIndex(this._oScroller.getDisplayIndex());
   this._oScroller.setScrollThumb(this._oScroller.getDisplayIndex());
   this.setState(this._OPEN);
};
Messages.prototype.removeMessage = function(oMessage)
{
   var i = 0;
   while(i < this._aMessages.length)
   {
      if(this._aMessages[i].getMessage() == oMessage.getMessage())
      {
         this._aMessages.splice(i,1);
         break;
      }
      i++;
   }
   this._oScroller.setMaxDisplayIndex(this._aMessages.length - 1);
   this._oScroller.setDisplayIndex(this._oScroller.getMaxDisplayIndex());
   this.displayFromIndex(this._oScroller.getDisplayIndex());
   this._oScroller.setScrollThumb(this._oScroller.getDisplayIndex());
};
Messages.prototype.messageExists = function(oMessage)
{
   var i = 0;
   while(i < this._aMessages.length)
   {
      if(this._aMessages[i].getMessage() == oMessage.getMessage())
      {
         return true;
      }
      i++;
   }
   return false;
};
Messages.prototype.getMessageByClipName = function(sClipName)
{
   var sClipIndex = sClipName.substr(sClipName.length - 2,sClipName.length);
   var iClipIndex = Number(sClipIndex);
   var iMessageIndex = this._oScroller.getDisplayIndex() + iClipIndex;
   var oMessage = this._aMessages[iMessageIndex];
   return oMessage;
};
Messages.prototype.displayFromIndex = function(iIndex)
{
   if(this._bDebug)
   {
      _level0.debug("Messages.displayFromIndex(" + iIndex + ")");
   }
   var i = 0;
   while(i < this._oScroller.getMaxUIDisplayIndex())
   {
      var oMessage = this._aMessages[iIndex];
      var mcMessageClip = this.getMessageClipFromIndex(i);
      if(oMessage == null)
      {
         mcMessageClip._visible = false;
      }
      else
      {
         oMessage.display(mcMessageClip);
      }
      iIndex++;
      i++;
   }
};
Messages.prototype.getMessageClipFromIndex = function(iIndex)
{
   var sClipName = iIndex >= 10 ? "mcMessage" + iIndex : "mcMessage0" + iIndex;
   return this._mcClip.mcOutput[sClipName];
};
Messages.prototype.composeMessage = function(sRecipient)
{
   if(this._bDebug)
   {
      _level0.debug("Messages.composeMessage(" + sRecipient + ")");
   }
   this._mcClip.mcOutput._visible = false;
   this._mcClip.mcInput._visible = true;
   this._mcClip.mcInput.sRecipient = sRecipient;
   this._mcClip.mcInput.sMessage = "";
   this.setState(this._OPEN);
};
Messages.prototype.cancelMessage = function()
{
   this._mcClip.mcOutput._visible = true;
   this._mcClip.mcInput._visible = false;
   this.setState(this._CLOSED);
};
Messages.prototype.sendMessage = function(sMessage, sRecipient)
{
   _level0.debug("Messages.sendMessage(" + sMessage + "," + sRecipient + ")");
   if(sMessage == null || sMessage == "")
   {
      return undefined;
   }
   this._oRootContext._oLobby.sendPrivateMessage(_level0._session.getUsername(),sRecipient,sMessage);
   this._mcClip.mcOutput._visible = true;
   this._mcClip.mcInput._visible = false;
   this.setState(this._CLOSED);
};
Messages.prototype.setState = function(sNewState)
{
   if(this._bDebug)
   {
      _level0.debug("Messages.setState(" + sNewState + ") this._sState: " + this._sState + ", mcClip: " + this._mcClip);
   }
   if(sNewState == this._OPEN)
   {
      if(this._sState == this._CLOSED)
      {
         this._mcAnimateClip.gotoAndPlay("In");
      }
   }
   if(sNewState == this._CLOSED)
   {
      if(this._sState == this._OPEN)
      {
         this._mcAnimateClip.gotoAndPlay("Out");
      }
   }
   this._sState = sNewState;
};
Messages.prototype.removeMessagesFromPlayer = function(sPlayerName)
{
   if(this._bDebug)
   {
      _level0.debug("Messsages.removeMessagesFromPlayer(" + sPlayerName + ")");
   }
   var i = 0;
   while(i < this._aMessages.length)
   {
      var oMessage = this._aMessages[i];
      if(oMessage.getSender() == sPlayerName)
      {
         this.removeMessage(oMessage);
      }
      i++;
   }
};
Message.prototype.setSender = function(sSender)
{
   this._sSender = sSender;
};
Message.prototype.getSender = function()
{
   return this._sSender;
};
Message.prototype.setMessage = function(sMessage)
{
   this._sMessage = sMessage;
};
Message.prototype.getMessage = function()
{
   return this._sMessage;
};
Message.prototype.display = function(mcClip)
{
   if(this._bDebug)
   {
      _level0.debug("Message.display(" + mcClip + ")");
   }
   this.displayMessage(mcClip);
   this.displayReply(mcClip);
   mcClip._visible = true;
};
Message.prototype.displayMessage = function(mcClip)
{
   mcClip.sMessage = this.getSender() + ": " + this.getMessage();
};
Message.prototype.displayReply = function(mcClip)
{
   mcClip.mcReply._visible = true;
};
Players.prototype.initPlayers = function()
{
   this._aPlayers = new Array();
   this._oScroller = new this._oRootContext.Scroller(this,this._mcClip.mcScroller);
   this._oScroller.setMaxUIDisplayIndex(17);
   this.displayFromIndex(0);
};
Players.prototype.addPlayer = function(oPlayer)
{
   if(this.playerExists(oPlayer))
   {
      return undefined;
   }
   this._aPlayers.push(oPlayer);
   this._oScroller.setMaxDisplayIndex(this._aPlayers.length - 1);
};
Players.prototype.removePlayer = function(oPlayer)
{
   var i = 0;
   while(i < this._aPlayers.length)
   {
      if(this._aPlayers[i].getPlayerName() == oPlayer.getPlayerName())
      {
         this._aPlayers.splice(i,1);
         break;
      }
      i++;
   }
   this._oScroller.setMaxDisplayIndex(this._aPlayers.length - 1);
};
Players.prototype.getPlayerByName = function(sPlayerName)
{
   var i = 0;
   while(i < this._aPlayers.length)
   {
      var oPlayer = this._aPlayers[i];
      if(oPlayer.getPlayerName() == sPlayerName)
      {
         return oPlayer;
      }
      i++;
   }
};
Players.prototype.getPlayerByClipName = function(sClipName)
{
   var sClipIndex = sClipName.substr(sClipName.length - 2,sClipName.length);
   var iClipIndex = Number(sClipIndex);
   var iPlayerIndex = this._oScroller.getDisplayIndex() + iClipIndex;
   var oPlayer = this._aPlayers[iPlayerIndex];
   return oPlayer;
};
Players.prototype.playerExists = function(oPlayer)
{
   var i = 0;
   while(i < this._aPlayers.length)
   {
      if(this._aPlayers[i].getPlayerName() == oPlayer.getPlayerName())
      {
         return true;
      }
      i++;
   }
   return false;
};
Players.prototype.display = function()
{
   this.displayFromIndex(this._oScroller.getDisplayIndex());
};
Players.prototype.displayFromIndex = function(iIndex)
{
   if(this._bDebug)
   {
      _level0.debug("Players.displayFromIndex(" + iIndex + ")");
   }
   var i = 0;
   while(i < this._oScroller.getMaxUIDisplayIndex())
   {
      var oPlayer = this._aPlayers[iIndex];
      var mcPlayerClip = this.getPlayerClipFromIndex(i);
      if(oPlayer == null)
      {
         mcPlayerClip._visible = false;
      }
      else
      {
         oPlayer.display(mcPlayerClip);
      }
      iIndex++;
      i++;
   }
};
Players.prototype.getPlayerClipFromIndex = function(iIndex)
{
   var sClipName = iIndex >= 10 ? "mcPlayer" + iIndex : "mcPlayer0" + iIndex;
   return this._mcClip[sClipName];
};
LobbyPlayer.prototype.getPlayerName = function()
{
   return this._sPlayerName;
};
LobbyPlayer.prototype.setPlayerName = function(sPlayerName)
{
   this._sPlayerName = sPlayerName;
};
LobbyPlayer.prototype.setBlocked = function(bBlocked)
{
   if(this._bDebug)
   {
      _level0.debug("LobbyPlayer.setBlocked(" + bBlocked + ")");
   }
   this._bBlocked = bBlocked;
};
LobbyPlayer.prototype.getBlocked = function()
{
   return this._bBlocked;
};
LobbyPlayer.prototype.display = function(mcClip)
{
   if(this._bDebug)
   {
      _level0.debug("LobbyPlayer.display(" + mcClip + ")");
   }
   this.displayBlocked(mcClip);
   this.displayPlayerName(mcClip);
   this.displaySendMessage(mcClip);
   mcClip._visible = true;
};
LobbyPlayer.prototype.displayBlocked = function(mcClip)
{
   mcClip.mcBlocked.gotoAndStop(!this.getBlocked() ? "UnBlocked" : "Blocked");
   mcClip.mcBlocked._visible = this.getPlayerName() != _level0._session.getUsername();
};
LobbyPlayer.prototype.displayPlayerName = function(mcClip)
{
   mcClip.sPlayer = this.getPlayerName();
};
LobbyPlayer.prototype.displaySendMessage = function(mcClip)
{
   mcClip.mcSendMessage._visible = this.getPlayerName() != _level0._session.getUsername();
};
LobbyPlayer.prototype.sendMessage = function()
{
   if(this._bDebug)
   {
      _level0.debug("LobbyPlayer.sendMessage()");
   }
   this._oRootContext._oMessages.composeMessage(this.getPlayerName());
};
GamePlayer.prototype.setSlot = function(iSlot)
{
   this._iSlot = iSlot;
};
GamePlayer.prototype.getSlot = function()
{
   return this._iSlot;
};
GamePlayer.prototype.setUsername = function(sUsername)
{
   this._sUsername = sUsername;
};
GamePlayer.prototype.getUsername = function()
{
   return this._sUsername;
};
GamePlayer.prototype.setAvatarGender = function(sAvatarGender)
{
   this._sAvatarGender = sAvatarGender;
};
GamePlayer.prototype.getAvatarGender = function()
{
   return this._sAvatarGender;
};
GamePlayer.prototype.setAvatarMission = function(sAvatarMission)
{
   this._sAvatarMission = sAvatarMission;
};
GamePlayer.prototype.getAvatarMission = function()
{
   return this._sAvatarMission;
};
GamePlayer.prototype.setAvatarAttributes = function(sAvatarAttributes)
{
   if(this._bDebug)
   {
      _level0.debug("GamePlayer.setAvatarAttributes(" + sAvatarAttributes + ")");
   }
   this._sAvatarAttributes = sAvatarAttributes;
};
GamePlayer.prototype.getAvatarAttributes = function()
{
   return this._sAvatarAttributes;
};
GamePlayer.prototype.setDecibels = function(iDecibels)
{
   this._iDecibels = iDecibels;
};
GamePlayer.prototype.getDecibels = function()
{
   return this._iDecibels;
};
GamePlayer.prototype.setScore = function(iScore)
{
   this._iScore = iScore;
};
GamePlayer.prototype.getScore = function()
{
   return this._iScore;
};
GamePlayer.prototype.setRank = function(iRank)
{
   this._iRank = iRank;
};
GamePlayer.prototype.getRank = function()
{
   return this._iRank;
};
GamePlayer.prototype.toString = function()
{
   return "[GamePlayer] _iSlot: " + this.getSlot() + ", _sUsername: " + this.getUsername() + ", _iScore: " + this._iScore + ", _iRank: " + this._iRank + ", _sAvatarGender: " + this.getAvatarGender() + ", _sAvatarMission: " + this.getAvatarMission() + ", _sAvatarAttributes: " + this.getAvatarAttributes() + ", _iDecibels: " + this.getDecibels();
};
Scroller.prototype.setDisplayIndex = function(iDisplayIndex)
{
   this._iDisplayIndex = iDisplayIndex;
};
Scroller.prototype.getDisplayIndex = function()
{
   return this._iDisplayIndex;
};
Scroller.prototype.setMaxDisplayIndex = function(iMaxDisplayIndex)
{
   this._iMaxDisplayIndex = iMaxDisplayIndex;
};
Scroller.prototype.getMaxDisplayIndex = function()
{
   return this._iMaxDisplayIndex;
};
Scroller.prototype.setMaxUIDisplayIndex = function(iMaxUIDisplayIndex)
{
   this._iMaxUIDisplayIndex = iMaxUIDisplayIndex;
};
Scroller.prototype.getMaxUIDisplayIndex = function()
{
   return this._iMaxUIDisplayIndex;
};
Scroller.prototype.setFrameRate = function(iFrameRate)
{
   this._iFrameRate = iFrameRate;
   this._iTimerLength = 1000 / this._iFrameRate;
};
Scroller.prototype.getFrameRate = function()
{
   return this._iFrameRate;
};
Scroller.prototype.scrollByButton = function(iDir)
{
   if(this._bDebug)
   {
      _level0.debug("Scroll.scroll(" + iDir + ")");
   }
   this._bScrolling = iDir != 0 ? true : false;
   this._iScrollDir = iDir;
   this._iTimer = getTimer();
   this.scrollDisplayIndex(this._iScrollDir);
   this._oController.displayFromIndex(this.getDisplayIndex());
};
Scroller.prototype.scrollByThumb = function(bState)
{
   this._bThumbScrolling = bState;
   var iYMouse = this._mcClip._ymouse;
   var iOffset = this._mcClip.mcScrollThumb._y - iYMouse;
   this._iThumbOffset = iOffset;
};
Scroller.prototype.scrollDisplayIndex = function(iDir)
{
   var iNewDisplayIndex = this.getDisplayIndex() + iDir;
   if(iNewDisplayIndex < 0 || this.getMaxDisplayIndex() < iNewDisplayIndex)
   {
      return undefined;
   }
   this.setDisplayIndex(iNewDisplayIndex);
};
Scroller.prototype.setScrollThumb = function(iIndex)
{
   var iY = this.map(iIndex,0,this.getMaxDisplayIndex(),this._iThumbLow,this._iThumbHi);
   this._mcClip.mcScrollThumb._y = iY;
};
Scroller.prototype.enterFrame = function()
{
   if(this._bThumbScrolling)
   {
      var iYMouse = this._mcClip._ymouse + this._iThumbOffset;
      if(iYMouse < this._iThumbLow)
      {
         iYMouse = this._iThumbLow;
      }
      if(this._iThumbHi < iYMouse)
      {
         iYMouse = this._iThumbHi;
      }
      this._mcClip.mcScrollThumb._y = iYMouse;
      var iNewDisplayIndex = Math.floor(this.map(iYMouse,this._iThumbLow,this._iThumbHi,0,this.getMaxDisplayIndex()));
      this.setDisplayIndex(iNewDisplayIndex);
      this._oController.displayFromIndex(this.getDisplayIndex());
      return undefined;
   }
   var iElapsedTime = getTimer() - this._iTimer;
   if(this._iTimerLength < iElapsedTime)
   {
      if(this._bScrolling)
      {
         this.scrollDisplayIndex(this._iScrollDir);
         this.setScrollThumb(this.getDisplayIndex());
         this._oController.displayFromIndex(this.getDisplayIndex());
      }
      this._iTimer = getTimer();
   }
};
Scroller.prototype.map = function(iInVal, iInLow, iInHi, iOutLow, iOutHi)
{
   return (iInVal - iInLow) / (iInHi - iInLow) * (iOutHi - iOutLow) + iOutLow;
};
_root.mcGames.mcLoadingLobby._visible = true;
_root._oLobby = _root.createLobby(this,_level1);
_root._oGames = new Games(this,_root.mcGames);
_root._oPlayers = new Players(this,_root.mcPlayers);
_root._oMessages = new Messages(this,_root.mcMessages);
_root._oLobby.enter("participants");
_root.mcMessages.gotoAndStop("Closed");
