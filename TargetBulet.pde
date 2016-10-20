class TargetBulet{
  int x;
  int y;
  int speed = 6;
  int width = 1;
  int height = 4;
  int damage = 15;
  Target parent;
  Player player;
  
  TargetBulet(Target parent, Player player){
    this.parent = parent;
    this.player = player;
    this.x = this.parent.x + this.parent.width/2;
    this.y = this.parent.y + this.parent.width;
    println(this.parent.x, this.parent.y);
  }
  
  void draw(){
    if(this.parent.canFire == true){
      
      if(this.collision() != true){
        pushStyle();
          noStroke();
          fill(#00ECFF);
          rect(this.x, this.y, this.width, this.height);
        popStyle();
        this.move();
      }
    }
  }
  
  void move(){
    this.y += this.speed;
    if(this.y > 500){
      this.y = this.parent.y;
      this.parent.canFire = false;
    }
  }
  
  boolean collision(){
    if(this.player.health > 0){
        int x = this.x;
        int y = this.y;
        if(x >= this.player.x && x <= this.player.x + this.player.width && y >= this.player.y && y <= this.player.y + this.player.height){
          player.hit(this);
          this.y = this.parent.y;
          this.parent.canFire = false;
          return true;
        }
        
      }
      return false;
    }
    
}