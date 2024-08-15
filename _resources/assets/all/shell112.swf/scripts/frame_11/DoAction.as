function SESSION_createSession()
{
   var _loc1_ = this;
   var session = Object.FFDK.newSession();
   session.onOpen = function()
   {
      var _loc1_ = this;
      if(_loc1_._bDebug)
      {
         _level0.debug("Session.onOpen");
      }
      _level0.sStatus = "Connection Opened.";
      _level0.debug("_level0._revealChallengeVersion: " + _level0._revealChallengeVersion,true);
      _level0.sStatus = "Attempting to login..";
      _loc1_.login(_loc1_.getLoginName(),_loc1_.getLoginPassword());
   };
   session.onOpenFailed = function(iReasonID, sReason)
   {
      var _loc1_ = this;
      if(_loc1_._bDebug)
      {
         _level0.debug("Session.onOpenFailed(" + iReasonID + "," + sReason + ")");
      }
      _level0.sStatus = "Could not establish a connection to the server. Please try again";
      _loc1_.setLoginName(null);
      _loc1_.setLoginPassword(null);
      _loc1_.reset();
   };
   session.onLogin = function()
   {
      var _loc1_ = this;
      if(_loc1_._bDebug)
      {
         _level0.debug("Session.onLogin() " + _loc1_.getUsername());
      }
      if(_loc1_.getUsername() == "")
      {
         _loc1_._username = _loc1_.getLoginName();
      }
      _level0.sStatus = "Login successful!";
      _level0.gotoAndPlay("Load Lobby");
   };
   session.onLoginFailed = function(iReasonID, sReason)
   {
      var _loc1_ = this;
      var _loc2_ = iReasonID;
      if(_loc1_._bDebug)
      {
         _level0.debug("session.onLoginFailed(" + _loc2_ + "," + sReason + ")");
      }
      if(_loc2_ == 8956)
      {
         _level0.sStatus = "Login Failed. Your username could not be found.";
      }
      if(_loc2_ == 8957)
      {
         _level0.sStatus = "Login Failed. Another person with your username is already logged in.";
      }
      if(_loc2_ == 9999)
      {
         _level0.sStatus = "Login Failed: The server is currently full.";
      }
      _level0.debug("session.onLoginFailed() sReason: " + sReason + ", sLoginName: " + _loc1_.getLoginName() + ", sLoginPassword: " + _loc1_.getLoginPassword());
      _loc1_.setLoginName(null);
      _loc1_.setLoginPassword(null);
      _loc1_.close();
      _loc1_.reset();
      if(_loc2_ == 9999)
      {
         _level0.gotoAndPlay("Full");
      }
   };
   session.onLogout = function()
   {
      var _loc1_ = this;
      if(_loc1_._bDebug)
      {
         _level0.debug("Session.onLogout");
      }
      _level0.sStatus = "Logged out.";
      _loc1_.setLoginName(null);
      _loc1_.setLoginPassword(null);
      _loc1_.reset();
      _loc1_.close();
   };
   session.onClose = function()
   {
      var _loc1_ = this;
      if(_loc1_._bDebug)
      {
         _level0.debug("session.onClose");
      }
      _loc1_.setLoginName(null);
      _loc1_.setLoginPassword(null);
      _level1.gotoAndPlay("Dormant");
      _level1._visible = false;
      _level2.gotoAndPlay("Dormant");
      _level2._visible = false;
      _level0.sStatus = "You have lost your connection with the server.";
      _loc1_.reset();
      _loc1_.remove();
   };
   session.onException = function(reasonID, reason)
   {
      if(this._bDebug)
      {
         _level0.debug("Server exception occurred: " + reason + " (id=" + reasonID + ")");
      }
      _level0.sStatus = "Server Exception: " + reason;
   };
   session.onNotify = function(sMsg)
   {
      if(this._bDebug)
      {
         _level0.debug("Session.onNotify(" + sMsg + ")");
      }
   };
   session.onLocateUser = function(reply)
   {
      if(this._bDebug)
      {
         _level0.debug("Session.onLocateUser(" + reply + ")");
      }
      var aLocations = reply.childNodes;
      var bInLobby = false;
      var _loc2_ = new Array();
      i = 0;
      while(i < aLocations.length)
      {
         var _loc3_ = aLocations[i];
         var sRoomId = _loc3_.attributes.roomId;
         var sGroupId = _loc3_.attributes.groupID;
         if(sGroupId == "participants")
         {
            if(sRoomId == "Lobby")
            {
               bInLobby = true;
            }
            _loc2_.push(sRoomId);
         }
         i++;
      }
      var _loc1_ = "";
      var i = 0;
      while(i < _loc2_.length)
      {
         _loc1_ += _loc2_[i];
         if(i < _loc2_.length - 1)
         {
            _loc1_ += ", ";
         }
         i++;
      }
      if(_loc1_ == "")
      {
         _level2.mcLocateuser.sOutput = "Not found.";
      }
      else
      {
         _level2.mcLocateUser.sOutput = _loc1_;
      }
   };
   session.onLocateUserRejected = function(rid, rs)
   {
      if(this._bDebug)
      {
         _level0.debug("LocateUserRejected: " + rs);
      }
   };
   session.init = function()
   {
      var _loc1_ = this;
      _loc1_._bDebug = true;
      _loc1_._sLoginName;
      _loc1_._sLoginPassword;
      _loc1_._sIpAddress;
      _loc1_.setPort(9000);
      if(_loc1_._bDebug)
      {
         _level0.debug("Session.init()");
      }
   };
   session.getLoginName = function()
   {
      return this._sLoginName;
   };
   session.setLoginName = function(sLoginName)
   {
      if(this._bDebug)
      {
         _level0.debug("Session.setLoginName(" + sLoginName + ")");
      }
      this._sLoginName = sLoginName;
   };
   session.getLoginPassword = function()
   {
      return this._sLoginPassword;
   };
   session.setLoginPassword = function(sLoginPassword)
   {
      if(this._bDebug)
      {
         _level0.debug("Session.setLoginPassword(" + sLoginPassword + ")");
      }
      this._sLoginPassword = sLoginPassword;
   };
   session.setIpAddress = function(sIpAddress)
   {
      _level0.debug("session.setIpAddress(" + sIpAddress + ")");
      this._sIpAddress = sIpAddress;
   };
   session.getIpAddress = function()
   {
      return this._sIpAddress;
   };
   session.setPort = function(iPort)
   {
      this._iPort = iPort;
   };
   session.getPort = function()
   {
      return this._iPort;
   };
   session.reset = function()
   {
      if(this._bDebug)
      {
         _level0.debug("Session.reset()");
      }
      _level1.gotoAndPlay("Dormant");
      _level1._visible = false;
      _level2.gotoAndPlay("Dormant");
      _level2._visible = false;
      _level0.mcLogo._visible = true;
      _level0.mcPod1._visible = true;
      _level0.mcPod2._visible = true;
      _level0.gotoAndPlay("Reset");
   };
   session.init();
   return session;
}
function ResourceText()
{
   this._bDebug = true;
   if(this._bDebug)
   {
      _level0.debug("new ResourceText()");
   }
}
trace("Shell: Includes");
if(Object.FFDK != "[FFDK Object]")
{
   var FFDK = Object.FFDK = new Object();
   FFDK.toString = function()
   {
      return "[FFDK Object]";
   };
}
if(typeof Object.debug == "undefined")
{
   Object.debug = function(m, t)
   {
      trace((!t ? "" : "[" + getTimer() + "]") + m);
      _level0.debug(m);
   };
}
if(typeof Object.debugXML == "undefined")
{
   Object.debugXML = function(m, t)
   {
      Object.debug(m,t);
   };
}
FFDK.newSession = function()
{
   var _loc1_ = new this.Session();
   _loc1_.init();
   return _loc1_;
};
FFDK.checkTimeouts = function()
{
   var _loc2_ = this.Session._instances;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      _loc2_[_loc1_]._requestQueue.checkTimeouts();
      _loc1_ = _loc1_ + 1;
   }
};
FFDK.encode = function(type, blob)
{
   var _loc1_ = "";
   if(type == "text/binhex")
   {
      var tmp = new String(blob);
      var _loc2_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < tmp.length)
      {
         _loc2_ = tmp.charCodeAt(_loc3_);
         _loc1_ += this._hexChar[(_loc2_ & 240) >> 4];
         _loc1_ += this._hexChar[_loc2_ & 15];
         _loc3_ = _loc3_ + 1;
      }
   }
   else if(type == "text/plain")
   {
      _loc1_ = new String(blob);
   }
   else
   {
      Object.debug("No codec for type \'" + type + "\' - defaulting to no encoding");
      _loc1_ = new String(blob);
   }
   return _loc1_;
};
FFDK.decode = function(type, str)
{
   var tmp = new String(str);
   var r = "";
   if(type == "text/binhex")
   {
      var j = 0;
      var _loc1_ = 0;
      var _loc2_ = 0;
      var d = 0;
      var e = "";
      var _loc3_ = 0;
      while(_loc3_ < tmp.length)
      {
         d = tmp.charCodeAt(_loc3_);
         _loc2_ = this._binChar[d];
         if(_loc2_ == -1)
         {
            return "Error at char position " + _loc3_ + ":  " + tmp.charAt(_loc3_);
         }
         if(_loc2_ != -2)
         {
            if(j % 2 == 0)
            {
               _loc1_ |= _loc2_ << 4;
            }
            else
            {
               _loc1_ |= _loc2_ & 15;
               e = String.fromCharCode(_loc1_);
               r += e;
               _loc1_ = 0;
            }
            j++;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   else if(type == "text/plain")
   {
      r = str;
   }
   else
   {
      Object.debug("No codec for type \'" + type + "\' - defaulting to no decoding");
      r = str;
   }
   return r;
};
FFDK._hexChar = new Array("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");
FFDK._binChar = new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-2,-2,-1,-1,-2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,-1,-1,-1,-1,-1,-1,-1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
FFDK.LinkCategory = function(i, t, d)
{
   var _loc1_ = this;
   _loc1_._id = i;
   _loc1_._title = t;
   _loc1_._description = d;
   _loc1_._roomLinks = new Object.FFDK.Map();
};
FFDK.LinkCategory.prototype.toString = function()
{
   var _loc1_ = this;
   return "[FFDK.LinkCategory(id=" + _loc1_._id + " title=" + _loc1_._title + " description=" + _loc1_._description + " roomLinks=" + _loc1_._roomLinks + ")]";
};
FFDK.LinkCategory.prototype._type = "FFDK.LinkCategory";
FFDK.LinkCategory.prototype.addRoomLink = function(rl)
{
   this._roomLinks.put(rl.getID(),rl);
};
FFDK.LinkCategory.prototype.getID = function()
{
   return this._id;
};
FFDK.LinkCategory.prototype.getRoomLink = function(id)
{
   return this._roomLinks["get"](id);
};
FFDK.LinkCategory.prototype.getRoomLinkCount = function()
{
   return this._roomLinks.size();
};
FFDK.LinkCategory.prototype.getRoomLinks = function()
{
   return this._roomLinks;
};
FFDK.LinkCategory.prototype.getTitle = function()
{
   return this._title;
};
FFDK.LinkCategory.prototype.removeRoomLink = function(id)
{
   return this._roomLinks.remove(id);
};
FFDK.Participant = function(n, r, g, s)
{
   var _loc1_ = this;
   _loc1_._name = n;
   _loc1_._room = r;
   _loc1_._groupID = g;
   _loc1_._seatID = s;
};
FFDK.Participant.prototype.toString = function()
{
   var _loc1_ = this;
   return "[FFDK.Participant(name=" + _loc1_._name + " roomID=" + _loc1_._room.getRoomID() + " groupID=" + _loc1_._groupID + " seatID=" + _loc1_._seatID + ")]";
};
FFDK.Participant.prototype._type = "FFDK.Participant";
FFDK.Participant.prototype.getAttribute = function(n)
{
   return eval("this._attributes." + n);
};
FFDK.Participant.prototype.getGroupID = function()
{
   return this._groupID;
};
FFDK.Participant.prototype.getName = function()
{
   return this._name;
};
FFDK.Participant.prototype.getRoom = function()
{
   return this._room;
};
FFDK.Participant.prototype.getSeatID = function()
{
   return this._seatID;
};
FFDK.Participant.prototype.sendChat = function(m)
{
   this._room.sendChat(m,this._name);
};
FFDK.Participant.prototype.sendAction = function(m)
{
   this._room.sendAction(m,this._name);
};
FFDK.ParticipantList = function(g)
{
   this._groupID = g;
   this._participants = new Object.FFDK.Map();
};
FFDK.ParticipantList.prototype.toString = function()
{
   return "[FFDK.ParticipantList(groupID=" + this._groupID + " participants=" + this._participants + ")]";
};
FFDK.ParticipantList.prototype._type = "FFDK.ParticipantList";
FFDK.ParticipantList.prototype.getGroupID = function()
{
   return this._groupID;
};
FFDK.ParticipantList.prototype.getParticipant = function(n)
{
   return this._participants["get"](n);
};
FFDK.ParticipantList.prototype.getParticipants = function()
{
   return this._participants;
};
FFDK.ParticipantList.prototype.getParticipantCount = function()
{
   return this._participants.size();
};
FFDK.ParticipantList.prototype.addParticipant = function(n, p)
{
   this._participants.put(n,p);
};
FFDK.ParticipantList.prototype.removeParticipant = function(n)
{
   return this._participants.remove(n);
};
FFDK.Request = function(nodeName, timeoutMS)
{
   var _loc2_ = arguments;
   var _loc3_ = this;
   _loc3_._request = new XML();
   _loc3_.attributes = _loc3_._request.attributes;
   _loc3_._request.nodeName = nodeName;
   var _loc1_ = 2;
   while(_loc1_ < _loc2_.length)
   {
      _loc3_._request.attributes[_loc2_[_loc1_]] = _loc2_[_loc1_ + 1];
      _loc1_ += 2;
   }
   _loc3_._timeoutMS = timeoutMS == null ? -1 : timeoutMS;
};
FFDK.Request.valueOf = function()
{
   return "[FFDK.Request Constructor]";
};
FFDK.Request.prototype.toString = function()
{
   return "[FFDK.Request (nodeName: " + this._request.nodeName + ", msgID:" + this._request.attributes.msgID + ")]";
};
FFDK.Request.prototype._type = "FFDK.Socket";
FFDK.Request.prototype.appendChild = function(a)
{
   this._request.appendChild(a);
};
FFDK.Request.prototype.createElement = function(a)
{
   return this._request.createElement(a);
};
FFDK.Request.prototype.createTextNode = function(a)
{
   return this._request.createTextNode(a);
};
FFDK.Request.prototype.removeNode = function(a)
{
   this._request.removeNode(a);
};
FFDK.Request._msgCounter = 1;
FFDK.Request.prototype.onRejected = function(rid, r)
{
   this._failureHandler(rid,r);
};
FFDK.Request.prototype.onTimeout = function(rid, r)
{
   this._failureHandler(rid,r);
};
FFDK.Request.prototype.getRequestXML = function()
{
   return this._request;
};
FFDK.Request.prototype.getReplyXML = function()
{
   return this._reply;
};
FFDK.Request.prototype.getMsgID = function()
{
   return this._msgID;
};
FFDK.Request.prototype.setMsgID = function(nn)
{
   var _loc2_ = this;
   var _loc1_ = _loc2_.constructor._msgCounter++;
   _loc2_.setAttribute("msgID",_loc1_);
   _loc2_._msgID = _loc1_;
   return _loc1_;
};
FFDK.Request.prototype.setAttribute = function(n, v)
{
   var _loc1_ = this._request.attributes[n];
   this._request.attributes[n] = v;
   return _loc1_;
};
FFDK.Request.prototype.appendNode = function(nn)
{
   var _loc3_ = this._request.createElement(nn);
   var _loc2_ = Arguments;
   var _loc1_ = 1;
   while(_loc1_ < _loc2_.length)
   {
      _loc3_.attributes[_loc2_[_loc1_]] = _loc2_[_loc1_ + 1];
      _loc1_ += 2;
   }
   this._request.appendChild(_loc3_);
};
FFDK.Request.prototype.appendTextNode = function(nn, sData)
{
   var _loc2_ = this;
   var _loc1_ = _loc2_._request.createElement(nn);
   _loc1_.appendChild(_loc2_._request.createTextNode(sData));
   _loc2_._request.appendChild(_loc1_);
};
FFDK.Request.prototype.appendBinhexedNode = function(nn, s)
{
   var _loc2_ = this;
   if(s != null)
   {
      var _loc1_ = _loc2_._request.createElement(nn);
      _loc1_.attributes.encoding = "text/binhex";
      var _loc3_ = Object.FFDK.encode("text/binhex",s);
      _loc1_.appendChild(_loc2_._request.createTextNode(_loc3_));
      _loc2_._request.appendChild(_loc1_);
   }
};
FFDK.Request.prototype.remove = function()
{
   var _loc1_ = this;
   delete _loc1_._request;
   delete _loc1_._reply;
   delete _loc1_._msgID;
};
FFDK.RequestQueue = function()
{
   this._requestArray = new Array();
};
FFDK.RequestQueue.prototype.toString = function()
{
   return "[FFDK.RequestQueue (size = " + this.size() + ")]";
};
FFDK.RequestQueue.prototype._type = "FFDK.RequestQueue";
FFDK.RequestQueue.prototype.size = function()
{
   return this._requestArray.length;
};
FFDK.RequestQueue.prototype.addRequest = function(r)
{
   var _loc2_ = r;
   var _loc1_ = this._requestArray;
   _loc2_._expireTime = _loc2_._timeoutMS <= 0 ? -1 : getTimer() + _loc2_._timeoutMS;
   var _loc3_ = _loc1_.length;
   for(i in _loc1_)
   {
      if(_loc2_._expireTime >= _loc1_[i]._expireTime)
      {
         break;
      }
      _loc3_ = _loc3_ - 1;
   }
   _loc1_.splice(_loc3_,0,_loc2_);
};
FFDK.RequestQueue.prototype.handleReply = function(m)
{
   var _loc2_ = m;
   var rpid = _loc2_.attributes.msgID;
   var ra = this._requestArray;
   var _loc3_ = 0;
   while(_loc3_ < ra.length)
   {
      var _loc1_ = ra[_loc3_];
      if(_loc1_._msgID == rpid)
      {
         ra.splice(_loc3_,1);
         _loc1_._reply = _loc2_;
         var nn = _loc2_.nodeName;
         if(nn.indexOf("Accepted") != -1)
         {
            _loc1_.onAccepted(_loc2_);
         }
         else if(nn.indexOf("Rejected") != -1)
         {
            var rid = Number(_loc2_.attributes.reasonID);
            _loc1_.onRejected(rid,_loc2_.attributes.reason);
         }
         else
         {
            Object.debug(">> Unhandled reply (FFDK.RequestQueue.handleReply), reply = " + _loc2_);
         }
         _loc1_.remove();
         var rs = true;
         break;
      }
      _loc3_ = _loc3_ + 1;
   }
   return rs;
};
FFDK.RequestQueue.prototype.clear = function()
{
   var _loc2_ = this._requestArray;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      _loc2_[_loc1_].remove();
      _loc1_ = _loc1_ + 1;
   }
   _loc2_ = [];
};
FFDK.RequestQueue.prototype.checkTimeouts = function()
{
   var ra = this._requestArray;
   var _loc1_ = undefined;
   var nn;
   var m;
   var _loc2_ = 0;
   while(_loc2_ < ra.length)
   {
      _loc1_ = ra[_loc2_];
      var _loc3_ = _loc1_._expireTime;
      if(_loc3_ != -1)
      {
         if(getTimer() < _loc3_)
         {
            break;
         }
         ra.splice(_loc2_,1);
         nn = _loc1_.getRequestXML().nodeName;
         m = "The request \'" + nn + "\' expired after " + _loc1_._timeoutMS + " ms.";
         _loc1_.onTimeout(404,m);
         _loc1_.remove();
      }
      _loc2_ = _loc2_ + 1;
   }
};
FFDK.Room = function(i, s)
{
   var _loc1_ = this;
   _loc1_._enterStatus = "outside";
   _loc1_._linkCategories = new Object.FFDK.Map();
   _loc1_._participantLists = new Object.FFDK.Map();
   _loc1_._roomID = i;
   _loc1_._roomDefAttr = new Object.FFDK.Map();
   _loc1_._session = s;
};
FFDK.Room.prototype.toString = function()
{
   var _loc2_ = this;
   var _loc1_ = undefined;
   _loc1_ = "[FFDK.Room]\n   roomID=" + _loc2_._roomID + "\n   enterStatus=" + _loc2_._enterStatus + "\n   groupID=" + _loc2_._groupID + "\n   seatID=" + _loc2_._seatID + "\n   roomCount=" + _loc2_.getRoomCount() + "\n   participantCount=" + _loc2_.getParticipantCount() + "\n   [Room Attributes]" + (_loc2_._roomDefAttr != null ? "\n      " + _loc2_._roomDefAttr : "") + "\n   [Activity Attributes]" + (_loc2_._activityAttr != null ? "\n      " + _loc2_._activityAttr : "") + "\n   [CustomData]" + (_loc2_._customData != null ? "\n      " + _loc2_._customData : "");
   var lcs = _loc2_.getLinkCategories().values();
   i = 0;
   while(i < lcs.length)
   {
      _loc1_ += "\n   " + lcs[i];
      i++;
   }
   var _loc3_ = _loc2_.getParticipantLists().values();
   i = 0;
   while(i < _loc3_.length)
   {
      _loc1_ += "\n   " + _loc3_[i];
      i++;
   }
   return _loc1_;
};
FFDK.Room.prototype._type = "FFDK.Room";
FFDK.Room.prototype.getActivityAttribute = function(n)
{
   return eval("this._activityAttr." + n);
};
FFDK.Room.prototype.getCustomData = function()
{
   return this._customData;
};
FFDK.Room.prototype.getEnterStatus = function()
{
   return this._enterStatus;
};
FFDK.Room.prototype.getGroupPassword = function()
{
   return this._groupPassword;
};
FFDK.Room.prototype.getLinkCategories = function()
{
   return this._linkCategories;
};
FFDK.Room.prototype.getParticipantCount = function()
{
   var _loc2_ = this.getParticipantLists().values();
   var _loc1_ = 0;
   i = 0;
   while(i < _loc2_.length)
   {
      _loc1_ += _loc2_[i].getParticipantCount();
      i++;
   }
   return _loc1_;
};
FFDK.Room.prototype.getParticipantList = function(g)
{
   return this._participantLists["get"](g);
};
FFDK.Room.prototype.getParticipantLists = function()
{
   return this._participantLists;
};
FFDK.Room.prototype.getRoomAttribute = function(n)
{
   return eval("this._roomDefAttr." + n);
};
FFDK.Room.prototype.getRoomCount = function()
{
   return this._roomCount;
};
FFDK.Room.prototype.getRoomID = function()
{
   return this._roomID;
};
FFDK.Room.prototype.getRoomPassword = function()
{
   return this._roomPassword;
};
FFDK.Room.prototype.getSession = function()
{
   return this._session;
};
FFDK.Room.prototype.getTitle = function()
{
   return this._title;
};
FFDK.Room.prototype.enter = function(g, s, c, rp, gp)
{
   var _loc1_ = this;
   if(_loc1_._enterStatus != "outside" || _loc1_._session.getLoginStatus() != "logged_in")
   {
      return false;
   }
   _loc1_.sendEnter(g,s,c,rp,gp);
   return true;
};
FFDK.Room.prototype.exit = function()
{
   if(this._enterStatus != "inside")
   {
      return false;
   }
   this.sendExit();
   return true;
};
FFDK.Room.prototype.setParticipantGroup = function(g, s, gp)
{
   if(this._enterStatus != "inside")
   {
      return false;
   }
   return this.sendSetParticipantGroup(g,s,gp);
};
FFDK.Room.prototype.sendChat = function(c, r)
{
   var _loc3_ = c;
   if(_loc3_ == null || _loc3_ == "" || this._enterStatus != "inside")
   {
      return false;
   }
   var _loc1_ = new XML();
   var _loc2_ = _loc1_.createElement("Chat");
   _loc2_.attributes.encoding = "text/binhex";
   _loc2_.appendChild(_loc1_.createTextNode(Object.FFDK.encode("text/binhex",_loc3_)));
   _loc1_.appendChild(_loc2_);
   this.sendAction(_loc1_,r);
   return true;
};
FFDK.Room.prototype.sendAction = function(x, rla)
{
   var _loc2_ = rla;
   var _loc3_ = x;
   Object.debug(">> FFDK.Room.sendAction called");
   if(_loc3_ == null || this._enterStatus != "inside")
   {
      return false;
   }
   var msg = new XML();
   msg.nodeName = "Room.Action";
   if(_loc3_._type == "XML")
   {
      _loc3_ = [_loc3_];
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      msg.appendChild(_loc3_[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   if(_loc2_ != null)
   {
      if(typeof _loc2_ == "string")
      {
         _loc2_ = [_loc2_];
      }
      var rln = msg.createElement("RecipientList");
      rln.attributes.count = _loc2_.length;
      _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         rln.attributes["v" + _loc1_] = Object.FFDK.encode("text/binhex",_loc2_[_loc1_]);
         _loc1_ = _loc1_ + 1;
      }
      rln.attributes.encoding = "text/binhex";
      msg.appendChild(rln);
   }
   this.sendMessage(msg);
};
FFDK.Room.prototype.remove = function()
{
   var _loc1_ = this;
   if(_loc1_._enterStatus == "inside")
   {
      _loc1_.exit();
   }
   _loc1_._session.getRooms().remove(_loc1_._roomID);
   _loc1_._enterStatus == "removed";
   delete _loc1_._groupID;
   delete _loc1_._groupPassword;
   delete _loc1_._roomID;
   delete _loc1_._roomPassword;
   delete _loc1_._seatID;
   delete _loc1_._session;
   delete _loc1_._roomCount;
   _loc1_._activityAttr.clear();
   delete _loc1_._activityAttr;
   _loc1_._participantLists.clear();
   delete _loc1_._participantLists;
   _loc1_._roomDefAttr.clear();
   delete _loc1_._roomDefAttr;
};
FFDK.Room.prototype.__onAction = function(xml)
{
   var nn;
   var _loc1_ = undefined;
   var _loc3_ = undefined;
   var _loc2_ = xml.attributes.username;
   var rln = xml.getNamedNode("RecipientList");
   if(rln != null)
   {
      rla = rln.getXListData();
      rln.removeNode();
   }
   _loc1_ = xml.firstChild;
   while(_loc1_ != null)
   {
      nn = _loc1_.nodeName;
      if(nn == "Chat")
      {
         _loc3_ = Object.FFDK.decode(_loc1_.attributes.encoding,_loc1_.firstChild.nodeValue);
         this.onChat(_loc3_,_loc2_,rla);
      }
      else
      {
         this.onAction(_loc1_,_loc2_,rla);
      }
      _loc1_ = _loc1_.nextSibling;
   }
};
FFDK.Room.prototype.__onParticipantEntered = function(xml)
{
   var _loc1_ = this.addParticipant(xml);
   this.onParticipantEntered(_loc1_);
   return true;
};
FFDK.Room.prototype.__onParticipantExited = function(xml)
{
   var _loc1_ = this.removeParticipant(xml);
   this.onParticipantExited(_loc1_);
   return true;
};
FFDK.Room.prototype.__onParticipantEjected = function(xml)
{
   _level0.debug("FFDK.__onParticipantEjected(" + xml + ")");
   this.onParticipantEjected(xml.attributes.reason);
};
FFDK.Room.prototype.sendRequest = function(rq)
{
   var _loc1_ = this;
   var _loc2_ = rq;
   _loc2_.setAttribute("roomID",_loc1_._roomID);
   _loc2_._room = _loc1_;
   _loc1_._session.sendRequest(_loc2_);
};
FFDK.Room.prototype.sendMessage = function(msg)
{
   var _loc1_ = this;
   var _loc2_ = msg;
   _loc2_.attributes.roomID = _loc1_._roomID;
   _loc2_._room = _loc1_;
   _loc1_._session.sendMessage(_loc2_);
};
FFDK.Room.prototype.sendEnter = function(g, s, c, rp, gp)
{
   var _loc1_ = this;
   var _loc2_ = new Object.FFDK.Request("Room.Enter",_loc1_._session._timeoutMS);
   _loc2_._room = _loc1_;
   _loc2_.setAttribute("roomID",_loc1_._roomID);
   if(g != null)
   {
      _loc2_.setAttribute("groupID",g);
   }
   if(s != null)
   {
      _loc2_.setAttribute("seatID",s);
   }
   if(c != null)
   {
      _loc1_._clientType = c;
      _loc2_.setAttribute("clientType",_loc1_._clientType);
   }
   if(rp != null)
   {
      _loc1_._roomPassword = rp;
      _loc2_.setAttribute("roomPassword",_loc1_._roomPassword);
   }
   if(gp != null)
   {
      _loc1_._groupPassword = gp;
      _loc2_.setAttribute("groupPassword",_loc1_._groupPassword);
   }
   _loc2_.onAccepted = function(xml)
   {
      var _loc1_ = this;
      _loc1_._room._enterStatus = "inside";
      _loc1_._room.parseEnterAcceptedXML(xml);
      _loc1_._room.onEnter();
   };
   _loc2_.onRejected = _loc2_.onTimeout = function(rid, r)
   {
      var _loc1_ = this;
      _loc1_._room._enterStatus = "outside";
      delete _loc1_._groupPassword;
      delete _loc1_._roomPassword;
      _loc1_._room.onEnterFailed(rid,r);
   };
   _loc1_._enterStatus = "entering";
   _loc1_._session.sendRequest(_loc2_);
};
FFDK.Room.prototype.parseEnterAcceptedXML = function(xml)
{
   this._groupID = xml.attributes.groupID;
   this._title = xml.attributes.title;
   this._roomCount = xml.attributes.roomCount;
   this._seatID = xml.attributes.seatID;
   var cn1 = xml.firstChild;
   while(cn1 != null)
   {
      var _loc3_ = cn1.nodeName;
      if(_loc3_ == "RoomDefinition")
      {
         cn1.parseBooleans();
         this._roomDefAttr = cn1.attributes;
         var cn2 = cn1.firstChild;
         while(cn2 != null)
         {
            _loc3_ = cn2.nodeName;
            if(_loc3_ == "ActivityAttributes")
            {
               this._activityAttr = cn2.attributes;
            }
            if(_loc3_ == "CustomData")
            {
               this._customData = cn2;
            }
            else if(_loc3_ == "LinkCategory")
            {
               cn2.parseBooleans();
               var lco = new Object.FFDK.LinkCategory(cn2.attributes.id,cn2.attributes.title,cn2.attributes.description);
               var _loc1_ = cn2.firstChild;
               while(_loc1_ != null)
               {
                  if(_loc1_.nodeName == "RoomLink")
                  {
                     var _loc2_ = _loc1_.attributes;
                     if(_loc2_.title == null)
                     {
                        _loc2_.title = _loc2_.id;
                     }
                     var rlo = new Object.FFDK.RoomLink(_loc2_.id,_loc2_.title,_loc1_.getNamedNode("CustomData"));
                     lco.addRoomLink(rlo);
                  }
                  _loc1_ = _loc1_.nextSibling;
               }
               this._linkCategories.put(cn2.attributes.id,lco);
            }
            cn2 = cn2.nextSibling;
         }
      }
      else if(_loc3_ == "ParticipantList")
      {
         var pl = new Object.FFDK.ParticipantList(cn1.attributes.groupID);
         this._participantLists.put(cn1.attributes.groupID,pl);
         var cn2 = cn1.firstChild;
         while(cn2 != null)
         {
            _loc3_ = cn2.nodeName;
            if(_loc3_ == "Participant")
            {
               var p = new Object.FFDK.Participant(cn2.attributes.username,this,cn1.attributes.groupID,cn2.attributes.seatID);
               pl.addParticipant(cn2.attributes.username,p);
            }
            cn2 = cn2.nextSibling;
         }
      }
      cn1 = cn1.nextSibling;
   }
};
FFDK.Room.prototype.sendExit = function()
{
   var _loc1_ = this;
   var _loc2_ = new Object.FFDK.Request("Room.Exit");
   _loc2_.onAccepted = function()
   {
      this._room._enterStatus = "outside";
      this._room.onExit();
   };
   _loc1_._enterStatus = "exiting";
   _loc1_.sendRequest(_loc2_);
};
FFDK.Room.prototype.sendSetParticipantGroup = function(g, s, gp)
{
   var _loc2_ = this;
   if(g == null)
   {
      return false;
   }
   var _loc1_ = new Object.FFDK.Request("Room.SetParticipantGroup",_loc2_._session._timeoutMS);
   _loc1_._room = _loc2_;
   _loc1_.setAttribute("roomID",_loc2_._roomID);
   _loc1_.setAttribute("groupID",g);
   if(s != null)
   {
      _loc1_.setAttribute("seatID",s);
   }
   if(gp != null)
   {
      _loc1_.setAttribute("groupPassword",gp);
   }
   _loc1_.onAccepted = function(xml)
   {
      var _loc1_ = xml;
      this._room.parseSetParticipantGroupAcceptedXML(_loc1_);
      this._room.onSetParticipantGroup(_loc1_.attributes.groupID,_loc1_.attributes.seatID,_loc1_.attributes.lastGroupID,_loc1_.attributes.lastSeatID);
   };
   _loc1_.onRejected = _loc1_.onTimeout = function(rid, r)
   {
      delete this._groupPassword;
      this._room.onSetParticipantGroupFailed(rid,r);
   };
   _loc2_._session.sendRequest(_loc1_);
   return true;
};
FFDK.Room.prototype.parseSetParticipantGroupAcceptedXML = function(xml)
{
   this._groupID = xml.attributes.groupID;
   this._seatID = xml.attributes.seatID;
};
FFDK.Room.prototype.addParticipant = function(xml)
{
   var n = xml.attributes.username;
   var _loc1_ = xml.attributes.groupID;
   var s = xml.attributes.seatID;
   var _loc2_ = undefined;
   if((_loc2_ = this._participantLists["get"](_loc1_)) == null)
   {
      _loc2_ = new Object.FFDK.ParticipantList(_loc1_);
      this._participantLists.put(_loc1_,_loc2_);
   }
   var _loc3_ = new Object.FFDK.Participant(n,this,_loc1_,s);
   _loc2_.addParticipant(n,_loc3_);
   return _loc3_;
};
FFDK.Room.prototype.removeParticipant = function(xml)
{
   var _loc3_ = xml;
   var n = _loc3_.attributes.username;
   var g = _loc3_.attributes.groupID;
   var s = _loc3_.attributes.seatID;
   var _loc1_ = undefined;
   var _loc2_ = undefined;
   if((_loc1_ = this._participantLists["get"](g)) != null)
   {
      _loc2_ = _loc1_.removeParticipant(n);
   }
   return _loc2_;
};
FFDK.RoomLink = function(i, t, c)
{
   var _loc1_ = this;
   _loc1_._id = i;
   _loc1_._title = t;
   _loc1_._customdata = c;
};
FFDK.RoomLink.prototype.toString = function()
{
   var _loc1_ = this;
   return "[FFDK.RoomLink(id=" + _loc1_._id + " title=" + _loc1_._title + " customdata=" + _loc1_._customdata + ")]";
};
FFDK.RoomLink.prototype._type = "FFDK.RoomLink";
FFDK.RoomLink.prototype.getCustomData = function()
{
   return this._customData;
};
FFDK.RoomLink.prototype.getID = function()
{
   return this._id;
};
FFDK.RoomLink.prototype.getTitle = function()
{
   return this._title;
};
var $copyright = "Fortress Flash Development Kit \n\nCopyright (c) 2000-2002 XadrA LLC. All rights reserved.";
FFDK.Session = function()
{
};
FFDK.Session.prototype.init = function()
{
   var _loc1_ = this;
   _loc1_._socket = new Object.FFDK.Socket(_loc1_);
   _loc1_._rooms = new Object.FFDK.Map();
   _loc1_._requestQueue = new Object.FFDK.RequestQueue(_loc1_);
   _loc1_._loginStatus = "logged_out";
   _loc1_.constructor._instances.push(_loc1_);
};
FFDK.Session.valueOf = function()
{
   return "[FFDK.Session Constructor]";
};
FFDK.Session.prototype.toString = function()
{
   var _loc1_ = "[FFDK.Session (status:" + this.getOpenStatus() + "/" + this.getLoginStatus() + ")]";
   return _loc1_;
};
FFDK.Session.prototype._type = "FFDK.Session";
FFDK.Session.prototype._timeoutMS = 15000;
FFDK.Session._instances = new Array();
FFDK.Session.prototype.getOpenStatus = function()
{
   return this._socket.getStatus();
};
FFDK.Session.prototype.getLoginStatus = function()
{
   return this._loginStatus;
};
FFDK.Session.prototype.getHost = function()
{
   return this._host;
};
FFDK.Session.prototype.getPort = function()
{
   return this._port;
};
FFDK.Session.prototype.getUsername = function()
{
   return this._username;
};
FFDK.Session.prototype.getPassword = function()
{
   return this._password;
};
FFDK.Session.prototype.getLoginTicket = function()
{
   return this._loginTicket;
};
FFDK.Session.prototype.getTicket = function(d)
{
   return this._ticket;
};
FFDK.Session.prototype.open = function(host, port)
{
   var _loc2_ = this;
   if(_loc2_.getOpenStatus() != "closed")
   {
      return false;
   }
   var _loc1_ = undefined;
   var _loc3_ = undefined;
   if(typeof port != "number")
   {
      _loc1_ = "the port is not a number";
      _loc3_ = 1;
   }
   else if(port < 1024)
   {
      _loc1_ = "the port is smaller than 1024";
      _loc3_ = 2;
   }
   else if(typeof host != "string")
   {
      _loc1_ = "the host is not a string";
      _loc3_ = 3;
   }
   if(_loc1_ != null)
   {
      _loc2_.onOpenFailed(_loc3_,_loc1_ + ".");
      return true;
   }
   var r = _loc2_._socket.connect(host,port);
   if(r)
   {
      _loc2_._host = host;
      _loc2_._port = port;
      return true;
   }
   _loc1_ = "The _socket.connect() method call returned false.";
   _loc2_.onOpenFailed(4,_loc1_);
   return true;
};
FFDK.Session.prototype.close = function()
{
   var _loc1_ = this;
   if(_loc1_.getOpenStatus() != "opened")
   {
      return false;
   }
   if(_loc1_._loginStatus == "logging_in")
   {
      _loc1_._loginStatus = "logged_in";
   }
   if(_loc1_._loginStatus == "logged_in")
   {
      _loc1_.logout();
   }
   _loc1_._loginStatus = "logged_out";
   _loc1_._socket.close();
   _loc1_._host = null;
   _loc1_._port = null;
   return true;
};
FFDK.Session.prototype.login = function(username, password, loginTicket)
{
   var _loc1_ = this;
   if(_loc1_.getOpenStatus() != "opened")
   {
      return false;
   }
   if(username != null)
   {
      _loc1_._username = username;
   }
   if(password != null)
   {
      _loc1_._password = password;
   }
   if(loginTicket != null)
   {
      _loc1_._loginTicket = loginTicket;
   }
   _loc1_.sendLogin();
   return true;
};
FFDK.Session.prototype.logout = function()
{
   var _loc3_ = this;
   _level0.debug(">> FFDK.Session.logout() called; session = " + _loc3_);
   if(_loc3_._loginStatus != "logged_in")
   {
      return false;
   }
   var _loc2_ = _loc3_._rooms.values();
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      _loc2_[_loc1_].exit();
      _loc2_[_loc1_].remove();
      _loc1_ = _loc1_ + 1;
   }
   _loc3_._rooms.clear();
   _loc3_._requestQueue.clear();
   _loc3_.sendLogout();
   _loc3_._ticket = null;
   _loc3_._username = null;
   _loc3_._password = null;
   _loc3_._loginTicket = null;
   return true;
};
FFDK.Session.prototype.remove = function()
{
   var _loc2_ = this;
   _loc2_._socket.remove();
   delete _loc2_._socket;
   delete _loc2_._host;
   delete _loc2_._port;
   delete _loc2_._loginStatus;
   delete _loc2_._ticket;
   delete _loc2_._username;
   delete _loc2_._password;
   delete _loc2_._loginTicket;
   var ra = _loc2_._rooms.values();
   var _loc1_ = 0;
   while(_loc1_ < ra.length)
   {
      ra[_loc1_].remove();
      _loc1_ = _loc1_ + 1;
   }
   _loc2_._rooms.clear();
   delete _loc2_._rooms;
   _loc2_._requestQueue.clear();
   delete _loc2_._requestQueue;
   var _loc3_ = _loc2_.constructor._instances;
   _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      if(_loc3_[_loc1_] == _loc2_)
      {
         _loc3_.splice(_loc1_,1)[0];
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
};
FFDK.Session.prototype.newRoom = function(id)
{
   var _loc2_ = id;
   var _loc3_ = this;
   var _loc1_ = _loc3_.getRoom(_loc2_);
   if(_loc1_ == null)
   {
      _loc1_ = new Object.FFDK.Room(_loc2_,_loc3_);
      _loc3_._rooms.put(_loc2_,_loc1_);
   }
   return _loc1_;
};
FFDK.Session.prototype.getRoom = function(id)
{
   return this._rooms["get"](id);
};
FFDK.Session.prototype.getRooms = function(id)
{
   return this._rooms;
};
FFDK.Session.prototype.getRoomCount = function()
{
   return this._rooms.size();
};
FFDK.Session.prototype.sendRequest = function(rq)
{
   var _loc1_ = rq;
   var _loc2_ = this;
   _loc1_._session = _loc2_;
   _loc1_.setAttribute("clientID",_loc2_._ticket);
   _loc1_.setMsgID();
   _loc2_._requestQueue.addRequest(_loc1_);
   _loc2_._socket.send(_loc1_.getRequestXML());
   if(Object.FFDK._doDebugXML)
   {
      Object.debugXML(">> Sending Request: " + _loc1_.getRequestXML());
   }
};
FFDK.Session.prototype.sendMessage = function(msg)
{
   var _loc1_ = msg;
   _loc1_.attributes.clientID = this._ticket;
   this._socket.send(_loc1_);
   if(Object.FFDK._doDebugXML)
   {
      Object.debugXML(">> Sending message: " + _loc1_);
   }
};
FFDK.Session.prototype.onSocketClose = function()
{
   this.reset();
   this.onClose();
};
FFDK.Session.prototype.onRoomException = function(roomID, reason, reasonID, msgID)
{
   this._rooms["get"](roomID).onException(reason,reasonID,msgID);
};
FFDK.Session.prototype.onRoomMessage = function(roomID, m, nn)
{
   var _loc1_ = this._rooms["get"](roomID);
   if(!_loc1_._requestQueue.handleReply(m))
   {
      if(nn == "ParticipantEjected")
      {
         _level0.debug("session participantejected");
      }
      _loc1_["__on" + nn](m);
   }
};
FFDK.Session.prototype.reset = function()
{
   var _loc3_ = this;
   if(_loc3_.getOpenStatus() != "closed")
   {
      _loc3_._socket.close();
   }
   _loc3_._host = null;
   _loc3_._port = null;
   _loc3_._ticket = null;
   _loc3_._username = null;
   _loc3_._password = null;
   _loc3_._loginTicket = null;
   _loc3_._loginStatus = "logged_out";
   var _loc2_ = _loc3_._rooms.values();
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      _loc2_[_loc1_].exit();
      _loc2_[_loc1_].remove();
      _loc1_ = _loc1_ + 1;
   }
   _loc3_._rooms.clear();
   _loc3_._requestQueue.clear();
};
FFDK.Session.prototype.sendLogin = function()
{
   var _loc1_ = this;
   var _loc2_ = new Object.FFDK.Request("System.Login",_loc1_._timeoutMS);
   _loc2_.appendBinhexedNode("Username",_loc1_._username);
   _loc2_.appendBinhexedNode("Password",_loc1_._password);
   _loc2_.appendBinhexedNode("Ticket",_loc1_._loginTicket);
   _loc2_.onAccepted = function()
   {
      var _loc1_ = this;
      _loc1_._session._loginStatus = "logged_in";
      _loc1_._session._ticket = _loc1_._reply.getNamedNode("Ticket").firstChild.nodeValue;
      var _loc2_ = Object.FFDK.decode("text/binhex",_loc1_._reply.getNamedNode("Username").firstChild.nodeValue);
      if(_loc2_ != null)
      {
         _loc1_._session._username = _loc2_;
      }
      _loc1_._session.onLogin();
   };
   _loc2_.onRejected = _loc2_.onTimeout = function(rid, r)
   {
      var _loc1_ = this;
      _loc1_._session._loginStatus = "logged_out";
      delete _loc1_._username;
      delete _loc1_._password;
      delete _loc1_._loginTicket;
      _loc1_._session.onLoginFailed(rid,r);
   };
   _loc1_._loginStatus = "logging_in";
   _loc1_.sendRequest(_loc2_);
};
FFDK.Session.prototype.sendLogout = function()
{
   var _loc1_ = this;
   var _loc2_ = new Object.FFDK.Request("System.Logout",_loc1_._timeoutMS);
   var _loc3_ = _loc2_.createElement("Ticket");
   _loc3_.appendChild(_loc2_.createTextNode(_loc1_.getTicket()));
   _loc2_.appendChild(_loc3_);
   _loc2_.onAccepted = _loc2_.onRejected = function()
   {
      var _loc1_ = this;
      _loc1_._session._loginStatus = "logged_out";
      delete _loc1_._username;
      delete _loc1_._password;
      delete _loc1_._loginTicket;
      _loc1_._session.onLogout();
   };
   _loc1_._loginStatus = "logging_out";
   _loc1_.sendRequest(_loc2_);
};
FFDK.Session.prototype.locateUser = function(username)
{
   this.sendLocateUser(username);
};
FFDK.Session.prototype.sendLocateUser = function(username)
{
   var _loc2_ = this;
   Object.debug(">> FFDK.Session.sendLocateUser() called, this;" + _loc2_);
   var _loc1_ = new Object.FFDK.Request("System.LocateUser",_loc2_._timeoutMS);
   _loc1_.setAttribute("name",username);
   _loc1_.onAccepted = function()
   {
      Object.debug(">> LocateUser Request.onAccepted called");
      this._session.onLocateUser(this._reply);
   };
   _loc1_.onRejected = _loc1_.onTimeout = function(rid, r)
   {
      this._session.onLocateUserRejected(rid,r);
   };
   _loc2_.sendRequest(_loc1_);
};
FFDK.Socket = function(session)
{
   this._session = session;
   this._status = "closed";
};
FFDK.Socket.valueOf = function()
{
   return "[FFDK.Socket Constructor]";
};
FFDK.Socket.prototype.toString = function()
{
   return "[FFDK.Socket (status=" + this._status + ")]";
};
FFDK.Socket.prototype._type = "FFDK.Socket";
FFDK.Socket.prototype.__proto__ = XMLSocket.prototype;
FFDK.Socket.prototype.connectXMLSocket = XMLSocket.prototype.connect;
FFDK.Socket.prototype.closeXMLSocket = XMLSocket.prototype.close;
FFDK.Socket.prototype.getStatus = function()
{
   return this._status;
};
FFDK.Socket.prototype.getSession = function()
{
   return this._session;
};
FFDK.Socket.prototype.connect = function(host, port)
{
   var _loc2_ = this;
   _loc2_._status = "opening";
   var _loc1_ = _loc2_.connectXMLSocket(host,port);
   if(!_loc1_)
   {
      _loc2_._status = "closed";
   }
   return _loc1_;
};
FFDK.Socket.prototype.close = function()
{
   this._status = "closed";
   this.closeXMLSocket();
};
FFDK.Socket.prototype.remove = function()
{
   var _loc1_ = this;
   _loc1_.closeXMLSocket();
   delete _loc1_._status;
   delete _loc1_._session;
};
FFDK.Socket.prototype.onConnect = function(s)
{
   var _loc1_ = this;
   if(s)
   {
      _loc1_._status = "opened";
      _loc1_._session.onOpen();
   }
   else
   {
      _loc1_._status = "closed";
      var _loc2_ = "The socket could not connect to " + _loc1_._session.getHost() + ":" + _loc1_._session.getPort() + ".";
      _loc1_._session.onOpenFailed(5,_loc2_);
   }
};
FFDK.Socket.prototype.onClose = function()
{
   var _loc1_ = this;
   if(_loc1_._status != "closed")
   {
      _loc1_._status = "closed";
      _loc1_._session.onSocketClose();
   }
};
FFDK.Socket.prototype.onXML = function(m)
{
   var _loc2_ = m;
   if(Object.FFDK._doDebugXML)
   {
      Object.debugXML(">> Inbound XML: " + _loc2_);
   }
   _loc2_ = _loc2_.firstChild;
   var nn = _loc2_.nodeName.split(".");
   var nn0 = nn[0];
   var _loc3_ = nn[1];
   var _loc1_ = _loc2_.attributes;
   if(_loc3_ == "Exception")
   {
      if(_loc1_.errMsgID != null)
      {
         _loc1_.msgID = _loc1_.errMsgID;
         delete _loc1_.errMsgID;
         this._session._requestQueue.handleReply(_loc2_);
      }
      else if(_loc1_.roomID != null)
      {
         this._session.onRoomException(_loc1_.roomID,_loc1_.reason,_loc1_.reasonID,_loc1_.msgID);
      }
      else
      {
         this._session.onException(_loc1_.reason,_loc1_.reasonID,_loc1_.msgID);
      }
   }
   else if(!this._session._requestQueue.handleReply(_loc2_))
   {
      if(nn0 == "System")
      {
         if(_loc3_ == "Notify")
         {
            _loc2_ = Object.FFDK.decode(_loc2_.attributes.encoding,_loc2_.firstChild.nodeValue);
            this._session.onNotify(_loc2_,_loc1_.msgID);
         }
         else if(_loc3_ == "HaltedApp")
         {
            _loc2_ = Object.FFDK.decode(_loc2_.attributes.encoding,_loc2_.firstChild.nodeValue);
            this._session.onHaltedApp(_loc1_.appID,_loc1_.msgID);
         }
         else if(_loc3_ == "Heartbeat")
         {
            this.send(new XML("<System.Heartbeat/>"));
         }
         else
         {
            this._session["on" + _loc3_](_loc2_);
         }
      }
      else if(nn0 == "Room")
      {
         if(_loc3_ == "CreateAccepted")
         {
            _loc1_.roomID = _loc1_.newRoomID;
         }
         if(_loc3_ == "ParticipantEjected")
         {
            _level0.debug("socket participantejected");
         }
         this._session.onRoomMessage(_loc1_.roomID,_loc2_,_loc3_);
      }
      else
      {
         Object.debug(">> Unexpected XML was received from the server; " + _loc2_);
      }
   }
};
FFDK.newMap = function()
{
   return new this.Map();
};
FFDK.Map = function()
{
   this._k = new Array();
   this._v = new Array();
};
FFDK.Map.valueOf = function()
{
   return "[FFDK.Map Constructor]";
};
FFDK.Map.prototype.toString = function()
{
   var _loc1_ = this;
   var _loc2_ = "[FFDK.Map(size=" + _loc1_._k.length;
   i = 0;
   while(i < _loc1_._k.length)
   {
      _loc2_ += " " + _loc1_._k[i] + "=" + _loc1_._v[i];
      i++;
   }
   _loc2_ += ")]";
   return _loc2_;
};
FFDK.Map.prototype._type = "FFDK.Map";
FFDK.Map.prototype.clear = function()
{
   this._k = [];
   this._v = [];
};
FFDK.Map.prototype.contains = function(k)
{
   var _loc2_ = this;
   var _loc3_ = false;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_._k.length)
   {
      if(_loc2_._k[_loc1_] == k)
      {
         _loc3_ = true;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
};
FFDK.Map.prototype.entrySet = function(k)
{
   var _loc2_ = this;
   var r = new Array();
   var _loc1_ = 0;
   while(_loc1_ < _loc2_._k.length)
   {
      r.push({key:_loc2_._k[_loc1_],value:_loc2_._v[_loc1_]});
      _loc1_ = _loc1_ + 1;
   }
   return r;
};
FFDK.Map.prototype["get"] = function(k)
{
   var _loc2_ = this;
   var _loc3_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_._k.length)
   {
      if(_loc2_._k[_loc1_] == k)
      {
         _loc3_ = _loc2_._v[_loc1_];
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
};
FFDK.Map.prototype.isEmpty = function()
{
   return this._v.length != 0 ? false : true;
};
FFDK.Map.prototype.keySet = function(k)
{
   return this._k;
};
FFDK.Map.prototype.put = function(k, e)
{
   var _loc2_ = this;
   e;
   var _loc1_ = _loc2_.remove(k);
   _loc2_._k.push(k);
   _loc2_._v.push(e);
   if(_loc1_ != null)
   {
      return _loc1_;
   }
};
FFDK.Map.prototype.remove = function(k)
{
   var _loc2_ = this;
   var _loc3_ = null;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_._k.length)
   {
      if(_loc2_._k[_loc1_] == k)
      {
         _loc2_._k.splice(_loc1_,1);
         _loc3_ = _loc2_._v.splice(_loc1_,1)[0];
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
};
FFDK.Map.prototype.size = function()
{
   return this._v.length;
};
FFDK.Map.prototype.values = function(k)
{
   return this._v;
};
Boolean.prototype._type = "Boolean";
String.prototype._type = "String";
Math.randomInt = function(a, b)
{
   var _loc1_ = a;
   var _loc2_ = b;
   if(_loc2_ < _loc1_)
   {
      var _loc3_ = _loc1_;
      _loc1_ = _loc2_;
      _loc2_ = _loc3_;
   }
   return Math.floor(Math.random() * (_loc2_ - _loc1_ + 1)) + _loc1_;
};
MovieClip.prototype._S_attachMovie = MovieClip.prototype.attachMovie;
MovieClip.prototype.attachMovie = function(id, n, d)
{
   this._S_attachMovie(id,n,d);
   return this[n];
};
String.prototype.charAt = function(index)
{
   return this.substr(index + 1,1);
};
String.prototype.concat = function()
{
   var _loc3_ = arguments;
   var _loc2_ = this.toString();
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      _loc2_ += _loc3_[_loc1_];
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
};
String.prototype.indexOf = function(sub, i)
{
   var _loc1_ = i;
   if(_loc1_ == null)
   {
      _loc1_ = 0;
   }
   var _loc2_ = sub.length;
   var _loc3_ = this.length - _loc2_ + 1;
   while(_loc3_ >= _loc1_ && this.substr(1 + _loc1_++,_loc2_) != sub)
   {
   }
   if(_loc3_ < _loc1_)
   {
      return -1;
   }
   return _loc1_ - 1;
};
String.prototype.lastIndexOf = function(sub, i)
{
   var _loc1_ = i;
   var _loc2_ = sub;
   var _loc3_ = this;
   size = _loc2_.length;
   _loc1_ != null ? (_loc1_ = _loc1_ + 1) : (_loc1_ = _loc3_.length - size + 1);
   if(_loc2_.length == 0)
   {
      return _loc1_ - 1;
   }
   while(_loc1_ >= 0 && _loc3_.substr(_loc1_--,size) != _loc2_)
   {
   }
   if(_loc1_ != -1)
   {
      _loc1_;
   }
   return -1;
};
String.prototype.slice = function(s, e)
{
   return this.substr(s + 1,e - s);
};
String.prototype.split = function(d)
{
   if(d != null)
   {
      var r = new Array();
      var s = this.length;
      var _loc1_ = undefined;
      var _loc3_ = undefined;
      var n = 0;
      if(d != "")
      {
         var _loc2_ = 0;
         while(_loc2_ < s)
         {
            _loc3_ = this.substr(_loc2_ + 1,1);
            if(_loc3_ == d)
            {
               r[n] = _loc1_;
               _loc1_ = "";
               n++;
            }
            else
            {
               _loc1_ += _loc3_;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc1_ != "")
         {
            r[n] = _loc1_;
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < s)
         {
            r[_loc2_] = this.substr(_loc2_ + 1,1);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   else
   {
      r = new Array(this.toString());
   }
   return r;
};
String.prototype.substr = function(s, l)
{
   var _loc1_ = l;
   if(_loc1_ == null)
   {
      _loc1_ = this.length - s;
   }
   return this.substr(s + 1,_loc1_);
};
XML.prototype._type = "XML";
XMLnode.prototype._type = "XMLnode";
XML.prototype.getNamedNode = XMLnode.prototype.getNamedNode = function(nn)
{
   var _loc3_ = nn;
   var _loc2_ = undefined;
   var _loc1_ = this.firstChild;
   while(_loc1_ != null)
   {
      if(_loc1_.nodeName == _loc3_)
      {
         _loc2_ = _loc1_;
         break;
      }
      _loc1_ = _loc1_.nextSibling;
   }
   return _loc2_;
};
XML.prototype.stripWhitespace = XMLnode.prototype.stripWhitespace = function()
{
   var _loc2_ = this.childNodes;
   var _loc3_ = 0;
   while(_loc3_ < _loc2_.length)
   {
      if(_loc2_[_loc3_].nodeType == 3)
      {
         var _loc1_ = 0;
         var e = true;
         _loc1_ = 0;
         while(_loc1_ < _loc2_[_loc3_].nodeValue.length)
         {
            if(_loc2_[_loc3_].nodeValue.charCodeAt(_loc1_) > 32)
            {
               e = false;
               break;
            }
            _loc1_ = _loc1_ + 1;
         }
         if(e)
         {
            _loc2_[_loc3_].removeNode();
         }
      }
      _loc3_ = _loc3_ + 1;
   }
   var k = 0;
   while(k < _loc2_.length)
   {
      _loc2_[k].stripWhitespace();
      k++;
   }
};
XML.prototype.parseBooleans = XMLnode.prototype.parseBooleans = function()
{
   var _loc2_ = this.attributes;
   var _loc1_ = undefined;
   for(i in _loc2_)
   {
      _loc1_ = new String(_loc2_[i]);
      _loc1_ = _loc1_.toUpperCase();
      if(_loc1_ == "TRUE")
      {
         _loc2_[i] = true;
      }
      else if(_loc1_ == "FALSE")
      {
         _loc2_[i] = false;
      }
   }
};
XMLnode.prototype.getXListData = function()
{
   this.parseBooleans();
   var v;
   var _loc1_ = this.attributes;
   var _loc3_ = new Array();
   var enc = _loc1_.encoding;
   if(enc != null && enc != "text/plain")
   {
      var _loc2_ = 0;
      while(_loc2_ < _loc1_.count)
      {
         _loc3_[_loc2_] = Object.FFDK.decode(enc,_loc1_["v" + _loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   else
   {
      _loc2_ = 0;
      while(_loc2_ < _loc1_.count)
      {
         _loc3_[_loc2_] = _loc1_["v" + _loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   return _loc3_;
};
XMLnode.prototype.getXSetData = function()
{
   this.parseBooleans();
   var v;
   var vo;
   var _loc1_ = this.attributes;
   var _loc2_ = Object.FFDK.newMap();
   var _loc3_ = _loc1_.encoding;
   if(_loc3_ != null && _loc3_ != "text/plain")
   {
      for(i in _loc1_)
      {
         if(i != "count" && i != "encoding")
         {
            _loc2_.put(i,Object.FFDK.decode(_loc3_,_loc1_[i]));
         }
      }
   }
   else
   {
      for(i in _loc1_)
      {
         if(i != "count" && i != "encoding")
         {
            _loc2_.put(i,_loc1_[i]);
         }
      }
   }
   return _loc2_;
};
FFDK.newSTF = function(stfMC, tfName, handle, hB)
{
   trace(">> FFDK.newSTF called.");
   var _loc1_ = new this.STF(stfMC,tfName,handle,hB);
   handle._visible = false;
   return _loc1_;
};
FFDK.newSTF.valueOf = function()
{
   return "[FFDK.newSTF Action]";
};
FFDK.STF = function(stfMC, tf, h, hB)
{
   var _loc1_ = this;
   var _loc2_ = hB;
   var _loc3_ = stfMC;
   trace(">> FFDK.STF constructor called. This=" + _loc1_ + " stfMC: " + _loc3_ + ", tf: " + tf + ", h: " + h + ", hb: " + _loc2_);
   if(tf == null)
   {
      tf = "tf";
   }
   if(h == null)
   {
      h = _loc3_.stfHandle;
   }
   _loc1_.h = h;
   _loc1_.mcP = targetPath(_loc3_);
   _loc1_.tfP = targetPath(_loc3_) + "." + tf;
   _loc1_.bT = Math.floor(_loc2_.getBounds(_loc2_._parent).yMin);
   _loc1_.bB = Math.floor(_loc2_.getBounds(_loc2_._parent).yMax);
   _loc1_.bH = _loc1_.bB - _loc1_.bT;
   _loc3_.stfO = _loc1_;
};
FFDK.setSTF_sC = function(mc)
{
   trace("setSTF_sC(" + mc + ")");
   this.STF.prototype._sC = mc;
};
FFDK.STF.prototype.tS = -1;
FFDK.STF.prototype.addText = function(t, asChat)
{
   if(asChat != false)
   {
      asChat = true;
   }
   if(t != null)
   {
      var nt = eval(this.tfP);
      if(nt == "<P ALIGN=\"LEFT\"></P>")
      {
         nt = "";
      }
      var L = nt.length;
      if(L > 0)
      {
         nt += "\n";
      }
      nt += t;
      if(this._mL < L && this._mL > 0)
      {
         var i = 1 + Math.floor(L / 4);
         nt = nt.substr(i,L - i);
         L = nt.length;
         while(nt.indexOf("\n") > 0)
         {
            nt = nt.substr(2,L - 1);
            L = nt.length;
         }
         nt = "... " + nt;
      }
      this.setText(nt,asChat);
   }
};
FFDK.STF.prototype.setText = function(t, asChat)
{
   var _loc1_ = this;
   if(asChat == true)
   {
      _loc1_.tS = -1;
   }
   else
   {
      _loc1_.tS = 1;
   }
   _loc1_.tfP = t;
   var _loc2_ = _loc1_._sC.stfTextFieldUpdater;
   _loc2_.stfO = _loc1_;
   _loc2_.play();
};
FFDK.STF.prototype.getText = function()
{
   return eval(this.tfP);
};
FFDK.STF.prototype.clearText = function()
{
   this.setText("");
};
FFDK.STF.prototype.setMaxLength = function(v)
{
   this._mL = v;
};
FFDK.STF.prototype.onSUP = function()
{
   var _loc2_ = this;
   trace(">> STF.onSUP (onScrollUpPressed) called.");
   var _loc1_ = _loc2_._sC.stfScrollButtonPressedLoop;
   trace("_sC: " + _loc2_._sC);
   trace("t: " + _loc1_);
   _loc1_.d = -1;
   _loc1_.stfO = _loc2_;
   _loc1_.play();
};
FFDK.STF.prototype.onSDP = function()
{
   trace(">> STF.onSDP (onScrollDownPressed) called.");
   var _loc1_ = this._sC.stfScrollButtonPressedLoop;
   trace("t: " + _loc1_);
   _loc1_.d = 1;
   _loc1_.stfO = this;
   _loc1_.play();
};
FFDK.STF.prototype.onSBR = function()
{
   trace(">> STF.onSBR (onScrollButtonReleased) called.");
   var _loc1_ = this._sC.stfScrollButtonPressedLoop;
   trace("t: " + _loc1_);
   _loc1_.gotoAndStop(1);
   delete _loc1_.stfO;
};
FFDK.STF.prototype.onHP = function()
{
   var _loc1_ = this;
   trace(">> FFDK.STF.onHP (onHandlePressed) called.");
   var _loc3_ = _loc1_.h._x;
   _loc1_.h.startDrag(false,_loc3_,_loc1_.bT,_loc3_,_loc1_.bB);
   var _loc2_ = _loc1_._sC.stfHandleDraggedLoop;
   _loc2_.stfO = _loc1_;
   _loc2_.gotoAndPlay("Loop");
};
FFDK.STF.prototype.onHR = function()
{
   var _loc2_ = this;
   _loc2_.h.stopDrag();
   var _loc1_ = _loc2_._sC.stfHandleDraggedLoop;
   _loc1_.gotoAndStop(1);
   delete _loc1_.stfO;
   _loc2_.onHD();
};
FFDK.STF.prototype.onHD = function()
{
   var _loc1_ = this;
   _loc1_.sTS(1 + Math.round((_loc1_.h._y - _loc1_.bT) * (_loc1_.gTMs() - 1) / _loc1_.bH));
};
FFDK.STF.prototype.s = function(d)
{
   var _loc1_ = this;
   if(_loc1_.gTMs() > 1)
   {
      _loc1_.sTS(_loc1_.gTS() + d);
      if(_loc1_.gTS() == _loc1_.gTMs())
      {
         _loc1_.h._y = _loc1_.bB;
      }
      else
      {
         _loc1_.h._y = _loc1_.bT + (_loc1_.gTS() - 1) * _loc1_.bH / (_loc1_.gTMs() - 1);
      }
   }
};
FFDK.STF.prototype.onTFU = function()
{
   var _loc1_ = this;
   var _loc2_ = _loc1_.gTMs();
   delete _loc1_._sC.stfTextFieldUpdater.stfO;
   if(_loc2_ > 1)
   {
      _loc1_.h._visible = true;
   }
   else
   {
      _loc1_.h._visible = false;
   }
   if(_loc1_.tS == -1)
   {
      _loc1_.sTS(_loc2_);
      _loc1_.h._y = _loc1_.bB;
   }
   else
   {
      _loc1_.sTS(_loc1_.tS);
      _loc1_.h._y = _loc1_.bT + (_loc1_.tS - 1) * _loc1_.bH / (_loc2_ - 1);
   }
};
FFDK.STF.prototype.sTS = function(v)
{
   eval(this.tfP).scroll = v;
};
FFDK.STF.prototype.gTS = function()
{
   return eval(this.tfP).scroll;
};
FFDK.STF.prototype.gTMs = function()
{
   return eval(this.tfP).maxscroll;
};
FFDK.STF.prototype.remove = function()
{
   delete eval(this.mcP).stfO;
   delete this.h;
   delete this.mcP;
   delete this.tfP;
   delete this.bT;
   delete this.bB;
   delete this.bH;
   delete this.tS;
};
FFDK.STF.prototype.toString = function()
{
   var txtFld = eval(this.tfP).slice(0,24);
   txtFld = txtFld.split("\n").join(" ");
   return "[STFObject txtFld=\'" + txtFld + "\']";
};
ResourceText.prototype.getTextFromID = function(iId)
{
   var _loc1_ = iId;
   if(this._bDebug)
   {
      _level0.debug("ResourceText.replaceText(" + _loc1_ + ")");
   }
   if(_loc1_ == 1)
   {
      return "We?re waiting on two more players. You are the Primary Player.  Once there are three players in the room, you will be given the chance to start the game.";
   }
   if(_loc1_ == 2)
   {
      return "We?re waiting on at least one more player.";
   }
   if(_loc1_ == 3)
   {
      return "We now have the minimum number of players needed to get started.";
   }
   if(_loc1_ == 4)
   {
      return "Hey, we now have four people in the game!";
   }
   if(_loc1_ == 5)
   {
      return "Alright, we\'ve got a full house tonight!";
   }
   if(_loc1_ == 6)
   {
      return "Do you want to start the game now or wait for more players?";
   }
   if(_loc1_ == 7)
   {
      return "Ok, you now have some time to wait for more players.";
   }
   if(_loc1_ == 8)
   {
      return "{captain} has decided to wait for more players.";
   }
   if(_loc1_ == 9)
   {
      return "Ok {oldCaptain} left, so now we have {remainingPlayers} players, and {newCaptain} is now the Primary Player.";
   }
   if(_loc1_ == 10)
   {
      return "Ok, let\'s get this game started!";
   }
   if(_loc1_ == 11)
   {
      return "Not enough players left to continue the game better luck next time!";
   }
   if(_loc1_ == 16)
   {
      return "Game Over! Hope you had fun. Head back to the lobby to play again.";
   }
   if(_loc1_ == 17)
   {
      return "You are about to be redirected back to the lobby.";
   }
   if(_loc1_ == 18)
   {
      return "Ok, we?re half way there. Keep it up!";
   }
   if(_loc1_ == 20)
   {
      return "You currently have earned {decibels} decibels.";
   }
   if(_loc1_ == 21)
   {
      return "You have reached your daily decibel limit.  You can keep playing, but you?ll have to come back tomorrow to earn more decibels!";
   }
   if(_loc1_ == 22)
   {
      return "Ok it\'s now {Player}\'s turn.";
   }
   if(_loc1_ == 23)
   {
      return "Ouch, {Player} loses a turn!";
   }
   if(_loc1_ == 24)
   {
      return "Way to go, {Player} found a wildcard!";
   }
   if(_loc1_ == 25)
   {
      return "Ok {Player} found a match!";
   }
   if(_loc1_ == 26)
   {
      return "{Player} missed...";
   }
   if(_loc1_ == 27)
   {
      return "{Player} left the game.";
   }
};
ResourceText.prototype.replaceText = function(attributes)
{
   if(this.doDebug)
   {
      trace("ResourceText.replaceText()");
   }
   var _loc1_ = "";
   var text = this.getTextFromID(attributes.id);
   if(text.indexOf("{") == -1)
   {
      return text;
   }
   var leftSplit = text.split("{");
   _loc1_ += leftSplit[0];
   var _loc3_ = 1;
   while(_loc3_ < leftSplit.length)
   {
      var leftText = leftSplit[_loc3_];
      var _loc2_ = leftText.split("}");
      var attribute = _loc2_[0];
      var remainingText = _loc2_[1];
      var attributeValue = attributes[attribute];
      _loc1_ += attributeValue;
      _loc1_ += remainingText;
      _loc3_ = _loc3_ + 1;
   }
   return _loc1_;
};
_level0._oResourceText = new ResourceText();
Object.FFDK._doDebugXML = false;
loadMovieNum("debug.swf",3,"GET");
_level0._bDebugWindow = false;
_level0._bDebugOutput = false;
this.gotoAndPlay("ValidateUser");
