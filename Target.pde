class Target{
  int x;
  int y;
  int id;
  int width = 25;
  int height = 25;
  int health = 100;
  boolean dead = false;
  boolean canFire = false;
  int startTime;
  
  Player player;
  GameSound sound;
  DataManager dataManager;
  PImage targetImageDead;
  PImage targetImageNormal;
  PImage targetImage = targetImageNormal;
  TargetBulet bulet;
  Target(){
    
  }
  
  Target(PImage targetImageNormal, PImage targetImageDead, GameSound sound, DataManager dataManager, Player player, int x, int y){
    this.targetImageNormal = targetImageNormal;
    this.targetImageDead = targetImageDead;
    this.dataManager = dataManager;
    this.player = player;
    this.sound = sound;
    this.x = x;
    this.y = y;
    bulet = new TargetBulet(this, this.player);
  }
  
  void draw(){
    if(this.health > 0){
      if(this.health <= 20){
        image(this.targetImageDead, this.x, this.y);
      }
      else{
        image(this.targetImageNormal, this.x, this.y);
      }
      bulet.draw();
      this.fire();
    }
    else {
      if(this.health <= 0 && this.dead == false){
        this.sound.playBoom();
        this.dead = true;
      }
    }
    this.move();
  }
  
  void move(){
    if(this.dataManager.hideStartScreen == true){
      if(millis() > this.startTime + 9000){
        this.startTime = millis();
        this.y += 25;
      }
    }

    if(this.y > 350){
      this.dataManager.gameOver = true;
    }
    
  }
  
  void hit(Bulet bulet){
    this.health -= bulet.damage;
    this.dataManager.totalDamage += bulet.damage;
    if(this.health <= 0 && this.dead == false){
      this.sound.playBoom();
      this.dead = true;
      dataManager.killsCount += 1;
      
    // Hide target from the bulet way
    this.x = -1000;
    this.x = 1000;
    
    }
  }
  
  void fire(){
    int randomNumber = int(random(0, 1000));
    if( randomNumber <= 9 || randomNumber == 99 || randomNumber == 999 && this.canFire == false){
      this.canFire = true;
    }
  }
  
}