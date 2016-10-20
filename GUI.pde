class GUI{
  PFont font;
  Player player;
  int fontSize = 20;
  GameSound gameSound;
  PImage startScreenImage;
  DataManager dataManager;
  color fontColor = #F5F5F5;
  
  GUI(PFont font, PImage startScreenImage, DataManager dataManager, Player player, GameSound gameSound){
    this.font = font;
    this.player = player;
    this.gameSound = gameSound;
    this.dataManager = dataManager;
    this.startScreenImage = startScreenImage;
  }
  
  void draw(){
    pushStyle();
    fill(this.fontColor);
      textFont(this.font, this.fontSize);
      text("Space Invaders", 190, 20);
      text("Kills: " + this.dataManager.killsCount, 15, 20);
      text("Damage: " + this.dataManager.totalDamage, 375, 20);
      text("Rocket: " + this.dataManager.buletCount, 400, 485);
      text("Missed: " + this.dataManager.missedRocket, 15, 485);
      fill(#FD5454);
      text("Health: " + this.player.health, 200, 485);
    popStyle();
    
    if(this.dataManager.allTargetsKills == true){
      this.message();
      if(this.dataManager.playFinalSong == false){
        gameSound.playFinalSound();
        this.dataManager.playFinalSong = true;
      }
    }
    
    if(this.dataManager.gameOver == true || this.player.health <= 0){
      println("GAMEOVER");
      this.gameOver();
      this.dataManager.gameOver = false;
      if(this.player.playDead == false){
        this.gameSound.playPlayerDeadSoundFile();
        this.player.playDead = true;
      }
      this.dataManager.gameOver = false;
    }
    //else {
    //  this.dataManager.gameOver = false;
    //}
    
    if(this.dataManager.hideStartScreen == false){
      this.startScreen();
    }

  }
  
  void message(){
    pushStyle();
      fill(0,0,0, 100);
      rect(0, 0, 500, 500);
    popStyle();
      
      pushStyle();
        strokeWeight(3);
        stroke(#525455);
        fill(#1B1E1F);
        rect(100, 200, 300, 100);
      popStyle();
      
      pushStyle();
        fill(#77A236);
        text("Congratulations!", 180, 230);
        fill(#878889);
        text("All enemies are dead!", 165, 260);
        text("Press 0, 1, 2 to load a new level ...", 120, 280);
      popStyle();
  }
  
    void gameOver(){
    pushStyle();
      fill(0,0,0, 100);
      rect(0, 0, 500, 500);
    popStyle();
      
      pushStyle();
        strokeWeight(3);
        stroke(#525455);
        fill(#1B1E1F);
        rect(100, 200, 300, 100);
      popStyle();
      
      pushStyle();
        fill(#FF0000);
        text("GAME OVER!", 200, 230);
        fill(#878889);
        text("You could not kill enemies!", 140, 260);
        text("The aliens have destroyed Earth...", 115, 280);
      popStyle();
  }
  
  void startScreen(){
    pushStyle();
      noStroke();
      fill(#282F31);
      rect(0,0, 500, 500);
      image(startScreenImage, 0, 0);
    popStyle();
  }
}