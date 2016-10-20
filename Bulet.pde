class Bulet{
  int x;
  int y;
  int speed = 6;
  int width = 1;
  int height = 4;
  int damage = 10;
  boolean fly = false;
  color buletColor = #FF0000;
  Target[] targets;
  GameSound sound;
  Player player;
  DataManager dataManager;
  
  
  Bulet(){
    
  }
  
  Bulet(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  Bulet(int[] buletXY){
    this.x = buletXY[0];
    this.y = buletXY[1];
  }
  
  Bulet(Target[] targets, Player player, GameSound sound, DataManager dataManager){
    this.player = player;
    this.x = this.player.x;
    this.y = this.player.y;
    this.targets = targets;
    this.sound = sound;
    this.dataManager = dataManager;
  }
  
  Bulet(int x, int y, Target[] targets){
    this.x = x;
    this.y = y;
    this.targets = targets;
  }
  
  boolean collision(){
    for(int i = 0; i <= this.targets.length - 1; i++){
      if( this.x >= targets[i].x && this.x <= targets[i].x + targets[i].width && this.y >= targets[i].y && this.y <= targets[i].y + targets[i].height ){
        targets[i].hit(this);
        this.boom();
        this.reload();
        this.sound.playHit();
        return true;
      }
    }
    return false;
  }
  
  void draw(){
    if(this.fly == true && this.collision() == false){
      pushStyle();
        noStroke();
        fill(buletColor);
        rect(this.x, this.y, this.width, this.height);
      popStyle();
      this.move();
    }
  }
  
  void fire(){
    if(this.fly == false){
      this.x = this.player.x + this.player.width/2;
      this.fly = true;
    }
  }
  
  void move(){
    this.y -= this.speed;
    if(this.y <= 0){
      this.dataManager.missedRocket += 1;
      this.reload();
    }
    
  }
  
  void reload(){
    this.fly = false;
    this.x = this.player.x + this.player.width/2;
    this.y = this.player.y;
  }
  
  void boom(){
    pushStyle();
    stroke(#FF8E03);
      strokeWeight(5);
      fill(#FF3903);
      ellipse(this.x, this.y+5, 12, 12);
    popStyle();
  }

}