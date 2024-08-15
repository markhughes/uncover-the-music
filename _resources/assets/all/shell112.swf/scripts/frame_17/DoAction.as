function validationComplete(bSuccess)
{
   var _loc1_ = this;
   _level0.debug("ValidationComplete() " + arguments);
   if(!bSuccess)
   {
      _loc1_.sStatus = "Error during validation.";
   }
   else if(_level0._login)
   {
      _loc1_.gotoandplay("State Check");
   }
   else
   {
      _loc1_.sStatus = "You must be logged in to CokeMusic to play.";
   }
}
function Base64()
{
}
function XMLManager(oController)
{
   var _loc1_ = this;
   _loc1_._bDebug = true;
   if(_loc1_._bDebug)
   {
      trace("new XMLManager()");
   }
   _loc1_._oController = oController;
}
function ServerGateway(oController)
{
   var _loc1_ = this;
   _loc1_._bDebug = true;
   _loc1_.debug("new ServerGateway() " + arguments);
   _loc1_._oController = oController;
   _loc1_._sBaseURI = _loc1_.setBaseURI();
   _loc1_._sServlet = "/gamesUser.do";
   _loc1_._sAction = "scAction";
   _loc1_._oXMLManager = new XMLManager(_loc1_);
   _loc1_._bLoading;
   _loc1_._sCurrentUrl;
   _loc1_._bEncrypt = false;
   _loc1_._oBase64 = new Base64();
}
function ValidateUser(mcRoot, sGame)
{
   var _loc1_ = this;
   _loc1_._bDebug = true;
   _loc1_._mcRoot = mcRoot;
   _loc1_._sGame = sGame;
   _loc1_._sAction = "validate";
   _loc1_._oServerGateway = new ServerGateway(_loc1_);
}
stop();
if(Key.isDown(16))
{
   this.gotoandplay("Secret Login Password");
   return undefined;
}
B64 = Base64.prototype;
B64.$encoder = function(aVal)
{
   var _loc1_ = aVal;
   if(_loc1_ <= 25)
   {
      return _loc1_ + 65;
   }
   if(_loc1_ <= 51)
   {
      return _loc1_ - 26 + 97;
   }
   if(_loc1_ <= 61)
   {
      return _loc1_ - 52 + 48;
   }
   if(_loc1_ == 62)
   {
      return 43;
   }
   if(_loc1_ == 63)
   {
      return 47;
   }
   return 61;
};
B64.$decoder = function(aVal)
{
   var _loc1_ = aVal;
   if(_loc1_ == 47)
   {
      return 63;
   }
   if(_loc1_ == 43)
   {
      return 62;
   }
   if(_loc1_ >= 65 && _loc1_ <= 90)
   {
      return _loc1_ - 65;
   }
   if(_loc1_ >= 97 && _loc1_ <= 122)
   {
      return _loc1_ + 26 - 97;
   }
   if(_loc1_ >= 48 && _loc1_ <= 57)
   {
      return _loc1_ + 52 - 48;
   }
   return 0;
};
B64.encode = function(aString)
{
   var inputLength;
   var _loc1_ = undefined;
   var decoded;
   var bytePosition = 0;
   var result = new Array();
   var fillBytes = 0;
   var _loc3_ = 0;
   while(_loc3_ < aString.length)
   {
      _loc1_ = [0,0,0];
      decoded = [0,0,0,0];
      var _loc2_ = 0;
      while(_loc2_ < _loc1_.length)
      {
         if(_loc3_ + _loc2_ >= aString.length)
         {
            fillBytes++;
         }
         else
         {
            _loc1_[_loc2_] = aString.charAt(_loc3_ + _loc2_).charCodeAt(0);
         }
         _loc2_ = _loc2_ + 1;
      }
      decoded[0] = _loc1_[0] >> 2 & 63;
      decoded[1] = (_loc1_[0] << 4 | _loc1_[1] >> 4) & 63;
      decoded[2] = (_loc1_[1] << 2 | _loc1_[2] >> 6) & 63;
      decoded[3] = _loc1_[2] & 63;
      _loc2_ = 0;
      while(_loc2_ < 4)
      {
         if(_loc2_ >= 4 - fillBytes)
         {
            result[bytePosition++] = "=";
         }
         else
         {
            result[bytePosition++] = String.fromCharCode(this.$encoder(decoded[_loc2_]));
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc3_ += 3;
   }
   return result.join("");
};
B64.decode = function(aString)
{
   var _loc3_ = aString;
   var output;
   var _loc1_ = undefined;
   output = "";
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      _loc1_ = [0,0,0,0];
      _loc1_[0] = this.$decoder(_loc3_.charCodeAt(_loc2_));
      _loc1_[1] = this.$decoder(_loc3_.charCodeAt(_loc2_ + 1));
      _loc1_[2] = this.$decoder(_loc3_.charCodeAt(_loc2_ + 2));
      _loc1_[3] = this.$decoder(_loc3_.charCodeAt(_loc2_ + 3));
      t = ["","",""];
      t[0] = String.fromCharCode((_loc1_[0] << 2 | _loc1_[1] >> 4) & 255);
      t[1] = String.fromCharCode((_loc1_[1] << 4 | _loc1_[2] >> 2) & 255);
      t[2] = String.fromCharCode((_loc1_[2] << 6 | _loc1_[3]) & 255);
      output += t.join("");
      _loc2_ += 4;
   }
   return output;
};
XMLManager.prototype.load = function(sFile, callbackObject, callbackMethod, errorMethod)
{
   var _loc1_ = this;
   if(_loc1_._bDebug)
   {
      trace("XMLManager.load(" + sFile + "," + callbackObject + "," + callbackMethod + "," + errorMethod);
   }
   _loc1_.callbackObject = callbackObject;
   _loc1_.callbackMethod = callbackMethod;
   _loc1_.errorMethod = errorMethod;
   _loc1_._oXml = new XML();
   _loc1_._oXml.ignoreWhite = true;
   _loc1_._oXml._creator = _loc1_;
   _loc1_._oXml.onData = _loc1_.onData;
   _loc1_._oXml.load(sFile);
};
XMLManager.prototype.onData = function(data)
{
   var _loc1_ = this;
   var _loc2_ = data;
   if(_loc1_._creator._bDebug)
   {
      trace("XMLManager.onData(" + _loc2_ + ")");
   }
   if(_loc2_ == undefined || _loc2_ == "")
   {
      trace("XMLManager.onData() ERROR NO DATA");
      _loc1_._creator.returnError();
   }
   else
   {
      _loc1_.parseXML(_loc2_);
      _loc1_._creator.onLoad(_loc1_.status,_loc1_,_loc2_);
   }
};
XMLManager.prototype.onLoad = function(success, xmlDoc)
{
   var _loc1_ = this;
   if(_loc1_._bDebug)
   {
      trace("XMLManager.onLoad(" + success + ")");
   }
   if(success != 0 || xmlDoc == undefined)
   {
      trace("XMLManager.onLoad() ERROR");
      _loc1_.returnError();
   }
   else
   {
      _loc1_.callbackObject[_loc1_.callbackMethod](_loc1_._oXML,data);
   }
};
XMLManager.prototype.returnError = function()
{
   this.callbackObject[this.errorMethod]();
};
XMLManager.prototype.removeLineBreaks = function(string)
{
   var _loc3_ = string;
   if(this._bDebug)
   {
      trace("XMLManager.removeLineBreaks()");
   }
   var newString = "";
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = _loc3_.charCodeAt(_loc2_);
      if(!(_loc1_ == 9 || _loc1_ == 10 || _loc1_ == 13))
      {
         newString += _loc3_.charAt(_loc2_);
      }
      _loc2_ = _loc2_ + 1;
   }
   return newString;
};
XMLManager.prototype.getNode = function(oXml, sNodeName)
{
   var _loc3_ = oXml.childNodes;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = _loc3_[_loc2_];
      if(_loc1_.nodeName == sNodeName)
      {
         return _loc1_;
      }
      _loc2_ = _loc2_ + 1;
   }
};
XMLManager.prototype.getNodes = function(xml, sNodeName)
{
   var aNodes = new Array();
   var _loc3_ = xml.childNodes;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = _loc3_[_loc2_];
      if(_loc1_.nodeName == sNodeName)
      {
         aNodes.push(_loc1_);
      }
      _loc2_ = _loc2_ + 1;
   }
   return aNodes;
};
XMLManager.prototype.getNodeById = function(oXml, iId)
{
   var aChildren = oXml.childNodes;
   var _loc2_ = 0;
   while(_loc2_ < aChildren.length)
   {
      var _loc1_ = aChildren[_loc2_];
      var _loc3_ = _loc1_.attributes.id;
      if(_loc3_ == iId)
      {
         return _loc1_;
      }
      _loc2_ = _loc2_ + 1;
   }
};
ServerGateway.prototype.setBaseURI = function()
{
   return _level0.httpUrl;
};
ServerGateway.prototype.sendOutgoingMessage = function(sAction, aArguments)
{
   var _loc1_ = this;
   _loc1_.debug("ServerGateway.sendOutgoingMessage() " + arguments);
   _loc1_._sCurrentUrl = _loc1_.createUrl(sAction,aArguments);
   _loc1_.debug("sCurrentUrl: " + _loc1_._sCurrentUrl);
   _loc1_._oXMLManager.load(_loc1_._sCurrentUrl,_loc1_,"processIncomingMessage","error");
   _loc1_.setLoading(true);
};
ServerGateway.prototype.processIncomingMessage = function(oXml, sData)
{
   var _loc1_ = this;
   var _loc2_ = oXml;
   _loc1_.debug("ServerGateway.processIncomingMessage() " + arguments);
   _loc1_.setLoading(false);
   var _loc3_ = Number(_loc2_.attributes.error);
   if(_loc3_ != 0)
   {
      _loc1_._oController.processIncomingError(_loc2_);
   }
   else
   {
      _loc1_._oController.processIncomingMessage(_loc2_);
   }
};
ServerGateway.prototype.createUrl = function(sAction, aArguments)
{
   this.debug("ServerGateway.createUrl() " + arguments);
   var sUrl = this._sBaseURI + this._sServlet + "?" + this._sAction + "=" + this.encode(sAction);
   var _loc2_ = 0;
   while(_loc2_ < aArguments.length)
   {
      var _loc1_ = aArguments[_loc2_];
      var sName = _loc1_[0];
      var _loc3_ = _loc1_[1];
      var sAddition = "&" + sName + "=" + this.encode(_loc3_);
      sUrl += sAddition;
      _loc2_ = _loc2_ + 1;
   }
   sUrl += "&random=" + getTimer();
   return sUrl;
};
ServerGateway.prototype.encrypt = function(sString)
{
   return this._oBase64.encode(sString);
};
ServerGateway.prototype.decrypt = function(sString)
{
   if(!this._bEncrypt)
   {
      return unescape(sString);
   }
   return this._oBase64.decode(sString);
};
ServerGateway.prototype.encode = function(sString)
{
   if(this._bEncrypt)
   {
      return this.encrypt(sString);
   }
   return escape(sString);
};
ServerGateway.prototype.error = function()
{
   this.debug("ServerGateway.error()");
   var _loc1_ = new XML();
   var _loc2_ = _loc1_.createElement("Result");
   _loc2_.attributes.error = "-2";
   _loc1_.appendChild(_loc2_);
   this._oController.processIncomingError(_loc1_);
};
ServerGateway.prototype.debug = function(sMessage, bForce)
{
   if(this._bDebug)
   {
      _level0.debug("Servergateway:" + sMessage);
      return undefined;
   }
   if(bForce)
   {
      _level0.debug("Servergateway:" + sMessage,true);
      return undefined;
   }
};
ValidateUser.prototype.validate = function()
{
   var _loc1_ = this;
   _loc1_.debug("validate() " + arguments);
   _loc1_._mcRoot.sStatus = "Getting login details...";
   if(_level0._tTest == "true")
   {
      var bLogin = true;
      var _loc3_ = "O";
      var sScreenName = _level0._tScreenName;
      var sAvatar = _level0._tAvatar;
      var iServer = _level0._tServer != "" ? _level0._tServer : "2";
      _loc1_.processUserData(bLogin,_loc3_,sScreenName,sAvatar,iServer);
   }
   else
   {
      var _loc2_ = new Array();
      _loc2_ = _loc1_.addArgument(_loc2_,"game",_loc1_._sGame);
      _loc1_._oServerGateway.sendOutgoingMessage(_loc1_._sAction,_loc2_);
   }
};
ValidateUser.prototype.addArgument = function(aArguments, sName, sValue)
{
   var _loc1_ = new Array();
   _loc1_.push(sName);
   _loc1_.push(sValue);
   aArguments.push(_loc1_);
   return aArguments;
};
ValidateUser.prototype.processIncomingMessage = function(oXml)
{
   var _loc1_ = this;
   _loc1_.debug("processIncomingMessage() " + arguments,true);
   var _loc2_ = oXml.firstChild;
   var sError = _loc2_.attributes.error;
   var sAction = _loc2_.attributes.scAction;
   var sGame = _loc2_.attributes.game;
   _loc1_._mcRoot.sStatus = "";
   if(sAction != _loc1_._sAction)
   {
      _loc1_.debug("validate: sError: " + sError);
      _loc1_._mcRoot.sStatus = "Error in action";
   }
   else if(sError != "0")
   {
      _loc1_._mcRoot.sStatus = "There has been an error during login. Error: " + sError;
   }
   else
   {
      var bLogin = _loc2_.attributes.login == "true";
      var sScreenName = _loc1_._oServerGateway.decrypt(_loc2_.attributes.screenName);
      if(sScreenName == "" || sScreenName == undefined)
      {
         sScreenName = undefined;
      }
      var sAvatar = _loc1_._oServerGateway.decrypt(_loc2_.attributes.avatar);
      if(sAvatar == "" || sAvatar == undefined)
      {
         sAvatar = undefined;
      }
      var sState = _loc1_._oServerGateway.decrypt(_loc2_.attributes.state);
      if(sState != "O" && sState != "C" && sState != "F")
      {
         sState = "C";
      }
      var _loc3_ = Number(_loc1_._oServerGateway.decrypt(_loc2_.attributes.server));
      if(_loc3_ != 1 && _loc3_ != 2 && _loc3_ != 3 && _loc3_ != 4 && _loc3_ != 5)
      {
         _loc3_ = undefined;
      }
      _loc1_.processUserData(bLogin,sState,sScreenName,sAvatar,_loc3_);
   }
};
ValidateUser.prototype.processUserData = function(bLogin, sState, sScreenName, sAvatar, iServer)
{
   var _loc1_ = this;
   _loc1_.debug("processUserData() " + arguments,true);
   _level0._login = bLogin;
   _level0._state = sState;
   _level0._screenName = sScreenName;
   _level0._avatar = sAvatar;
   _level0._server = String(iServer);
   _loc1_.debug("_level0._login: " + _level0._login,true);
   _loc1_.debug("_level0._state: " + _level0._state,true);
   _loc1_.debug("_level0._screenName: " + _level0._screenName,true);
   _loc1_.debug("_level0._avatar: " + _level0._avatar,true);
   _loc1_.debug("_level0._server: " + _level0._server,true);
   _loc1_._mcRoot.validationComplete(true);
};
ValidateUser.prototype.processIncomingError = function(oXml)
{
   var _loc1_ = this;
   _loc1_.debug("processIncomingError() " + arguments);
   _loc1_._mcRoot.sStatus = "There has been an unknown error during login";
   _loc1_._mcRoot.validationComplete(false);
};
ValidateUser.prototype.debug = function(sMessage, bForce)
{
   if(this._bDebug)
   {
      _level0.debug("ValidateUser:" + sMessage,bForce);
      return undefined;
   }
};
this._oValidateUser = new ValidateUser(this,"RevealChallenge");
this._oValidateUser.validate();
