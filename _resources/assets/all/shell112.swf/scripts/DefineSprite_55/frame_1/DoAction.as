function doPopUp()
{
   if(type == "basic")
   {
      getURL("javascript:window.open(\'" add url add "\',\'" add winName add "\',\'width=" add winW add ",height=" add winH add ",top=" add winTop add ",screeny=" add winTop add ",left=" add winLeft add ",screenx=" add winLeft add ",toolbar=" add tools add ",scrollbars=" add scroll add ",resizable=" add resize add ",menubar=" add menu add ",status=" add status add ",directories=" add directory add ",location=" add location add "\'); void(0);","");
   }
   else if(type == "center")
   {
      getURL("javascript:window.open(\'" add url add "\',\'" add winName add "\',\'width=" add winW add ",height=" add winH add ",top=\'+((screen.height/2)-(" add winH / 2 add "))+\',left=\'+((screen.width/2)-(" add winW / 2 add "))+\',toolbar=" add tools add ",scrollbars=" add scroll add ",resizable=" add resize add ",menubar=" add menu add ",status=" add status add ",directories=" add directory add ",location=" add location add "\'); void(0);","");
   }
   else if(type == "full")
   {
      getURL("javascript:window.open(\'" add url add "\',\'" add winName add "\',\'screeny=0,screenx=0,fullscreen=yes,outerHeight=\' + screen.availHeight + \',outerWidth=\' + screen.availWidth); void(0);","");
   }
   else
   {
      return undefined;
   }
}
stop();
