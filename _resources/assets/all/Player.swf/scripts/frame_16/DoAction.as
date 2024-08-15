trace("FACE LEFT");
stop();
var myParts = this._url.split("/");
myParts.pop();
var myUrl = myParts.join("/") + "/avatar_engine.swf";
trace("*********** myUrl: " + myUrl + " **********");
this.mcVego.mcAvatar.loadMovie(myUrl);
