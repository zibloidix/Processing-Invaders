class GameSound{
  SoundFile catchSoundFile;
  SoundFile fireSoundFile;
  SoundFile boomSoundFile;
  SoundFile themeSoundFile;
  SoundFile playerHitSoundFile;
  SoundFile playerDeadSoundFile;
  SoundFile finalSoundFile;
  
  
  GameSound(SoundFile fireSoundFile, 
            SoundFile boomSoundFile, 
            SoundFile themeSoundFile, 
            SoundFile catchSoundFile, 
            SoundFile playerHitSoundFile, 
            SoundFile playerDeadSoundFile,
            SoundFile finalSoundFile){
    this.fireSoundFile = fireSoundFile;
    this.boomSoundFile = boomSoundFile;
    this.themeSoundFile = themeSoundFile;
    this.catchSoundFile = catchSoundFile;
    this.playerHitSoundFile = playerHitSoundFile;
    this.playerDeadSoundFile = playerDeadSoundFile;
    this.finalSoundFile = finalSoundFile;
  }
  
  void playTheme(){
    this.themeSoundFile.loop();
  }
  
  void playFire(){
    this.fireSoundFile.play();
  }
  
  void playBoom(){
    this.boomSoundFile.play();
  }
  
  void playHit(){
    this.catchSoundFile.play();
  }
  
  void playPlayerHit(){
    this.playerHitSoundFile.play();
  }
  
  void playPlayerDeadSoundFile(){
    this.playerDeadSoundFile.play();
  }
  
  void playFinalSound(){
    this.finalSoundFile.play();
  }
  
}