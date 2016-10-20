class Sky{
  int starNumber = 20;
  int smallStarNumber = 40;
  int[] starX = new int[this.starNumber];
  int[] starY = new int[this.starNumber];
  int[] smallStarX = new int[this.smallStarNumber];
  int[] smallStarY = new int[this.smallStarNumber];
  color smallStarColor = #404750;
  color starColorOne = #4F687C;
  color starColorTwo = #445B6C;
  color backgroundColor = #263343;
  int backgroundWidth = 500;
  int backgroundHeight = 500;
  int[] starsCoodinates = new int [this.starNumber];
  
  Sky(){
    for(int i = 0; i <= this.starNumber-1; i++){
      starX[i] = int( random( 20, this.backgroundWidth-20 ) + int(random(50, 100)) * 0.1 );
      starY[i] = int( random( 20, this.backgroundHeight-20 ) + int(random(-100, 0)) * 0.5 );
    }
    for(int i = 0; i <= this.smallStarNumber-1; i++){
      smallStarX[i] = int( random( 20, this.backgroundWidth-20 ) + int(random(50, 100)) * 0.1 );
      smallStarY[i] = int( random( 20, this.backgroundHeight-20 ) + int(random(-100, 0)) * 0.5 );
    }
  }
  
  void drawStars(){
    pushStyle();
    for(int i = 0; i <= this.starNumber-1; i++){
      if( int(random(0, 1)) == 0 ){
        fill(starColorOne);
      }
      else {
        fill(starColorOne);
      }
        noStroke();
        rect(starX[i], starY[i], 2, 6);
        rect(starX[i]-2, starY[i]+2, 6, 2); 
    }
    popStyle();
    
    pushStyle();
    noStroke();
    fill(this.smallStarColor);
    for(int i = 0; i <= this.smallStarNumber-1; i++){
      rect(this.smallStarX[i], this.smallStarY[i], 1, 1);
    }
    popStyle();
    
  }
  
  void draw(){
    // Draw background;
    pushStyle();
    fill(backgroundColor);
    rect(0, 0, this.backgroundWidth, this.backgroundHeight);
    popStyle();
    
    // Draw stars;
    this.drawStars();
  }  
}