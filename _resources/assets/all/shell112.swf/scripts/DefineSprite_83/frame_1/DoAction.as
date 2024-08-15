this._bChecked = false;
this.setState = function(bState)
{
   var _loc1_ = this;
   _loc1_._bChecked = bState;
   if(_loc1_._bChecked)
   {
      _loc1_.gotoAndStop("On");
   }
   else
   {
      _loc1_.gotoAndStop("Off");
   }
};
this.getState = function()
{
   return this._bChecked;
};
stop();
