onClipEvent(enterFrame){
   if(_parent.mcAudioLoader._currentFrame >= _parent.mcAudioLoader._totalFrames - 3)
   {
      _parent._parent._oHost.voDone();
   }
   _parent.sFramesLoaded = _parent.mcAudioLoader._framesLoaded;
   _parent.sCurrentFrame = _parent.mcAudioLoader._currentFrame;
   _parent.sTotalFrames = _parent.mcAudioLoader._totalFrames;
}
