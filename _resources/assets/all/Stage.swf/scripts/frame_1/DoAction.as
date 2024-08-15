function Stage(mcRoot)
{
   this._bDebug = true;
   if(this._bDebug)
   {
      trace("new Stage(" + mcRoot + ")");
   }
   this._mcRoot = mcRoot;
}
stop();
this._oStage = new Stage(this);
