class Player{
  PImage playerImageNormal;
  PImage playerImageDamege100;
  PImage playerImageDamege75;
  PImage playerImageDamege50;
  PImage playerImageDamege25;
  int width = 25;
  int height = 25;
  int x;
  int y = 430;
  int health = 100;
  GameSound sound;
  boolean playDead = false;
  
  Player(PImage playerImageNormal, PImage playerImageDamege100, PImage playerImageDamege75, PImage playerImageDamege50, PImage playerImageDamege25, int width, int height, GameSound sound){
    this.playerImageNormal = playerImageNormal;
    this.playerImageDamege100 = playerImageDamege100;
    this.playerImageDamege75 = playerImageDamege75;
    this.playerImageDamege50 = playerImageDamege50;
    this.playerImageDamege25 = playerImageDamege25;
    this.x = 225;
    this.sound = sound;
  }
  
  void hit(TargetBulet bulet){
    if(this.health > 0){
      this.sound.playPlayerHit();
      this.health -= bulet.damage;
    }
    if(this.health <= 0 && playDead == false){
      this.sound.playPlayerDeadSoundFile();
      playDead = true;
    }
  }
  
  void draw(){
    if(this.health > 75){
      image(playerImageNormal, this.x, this.y);
    }
    if(this.health <= 75 && this.health > 50){
      image(playerImageDamege25, this.x, this.y);
    }
    if(this.health <= 50 && this.health > 25){
      image(playerImageDamege50, this.x, this.y);
    }
    if(this.health <= 50 && this.health > 25){
      image(playerImageDamege75, this.x, this.y);
    }
    if(this.health <= 25 && this.health > 0){
      image(playerImageDamege100, this.x, this.y);
    }
    
  }
  
  void restart(){
    this.playDead = false;
    this.health = 100;
    this.x = 225;
    this.y = 430;
  }
  
  void fly(int code){
    if(this.health > 0){
      if(code == 37){
        this.x -= 25;
      }
      if(code == 39){
        this.x += 25;
      }
    }
    else {
      this.x = 1000;
      this.y = 1000;
    }
  }
  
   int[] position(){
     int[] buletXY = new int[2];
     buletXY[0] = this.x + 13;
     buletXY[1] = this.y;
     return buletXY;
  }
}