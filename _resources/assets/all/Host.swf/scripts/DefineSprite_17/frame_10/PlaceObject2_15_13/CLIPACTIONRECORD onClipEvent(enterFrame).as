onClipEvent(enterFrame){
   var iFramesLoaded = _parent.mcAudioLoader._framesLoaded;
   var iBuffer = _parent._parent._oHost.getBuffer();
   if(iFramesLoaded >= iBuffer)
   {
      _parent._parent._oHost.voLoaded();
   }
   _parent.sFramesLoaded = _parent.mcAudioLoader._framesLoaded;
   _parent.sCurrentFrame = _parent.mcAudioLoader._currentFrame;
   _parent.sTotalFrames = _parent.mcAudioLoader._totalFrames;
}
