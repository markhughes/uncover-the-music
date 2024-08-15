on(release){
   this._parent.mcProdIp.setState(false);
   this._parent.mcTestIp.setState(false);
   this._parent.mcDevIp.setState(false);
   this._parent.mcLocalIp.setState(false);
   this.setState(true);
}
