this._visible = false;
if(typeof _level0.FFDK.newSTF != "function")
{
   var m = "ERROR: _level0.FFDK.newSTF not available.";
   trace(m);
   this.stfT = m;
}
else
{
   trace("Debug ready");
   this.stfDebug = _level0.FFDK.newSTF(this,"stfT",this.stfH,this.stfB);
   this.stfDebug.setMaxLength(40000);
   _parent.addText = function(m)
   {
      this.mcH.stfDebug.addText(m);
   };
   _parent.setText = function(m)
   {
      this.mcH.stfDebug.setText(m);
   };
   _parent.clearText = function(m)
   {
      this.mcH.stfDebug.clearText(m);
   };
}
