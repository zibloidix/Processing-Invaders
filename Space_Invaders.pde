import processing.sound.*;

GUI gui;
Sky sky;
Player player;
Bulet[] bulets;
GameSound sound;
Target[] targets;
DataManager dataManager = new DataManager();
int targetCount = 5;
boolean stopDraw = true;

int[][] targetMap = {
                      {0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0,
                       0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
                       
                      {0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0,
                      0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0,
                      0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0 },
                       
                      {0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0,
                      0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
                      0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0 }
                    };

void loadMapTarget(int levelNumber){
  int targetNumber = 0;
  int x = 0;
  int y = 50;

  for(int i=0; i <= targetMap[levelNumber].length-1; i++){
    if(targetMap[levelNumber][i] != 0){
      targetNumber += 1;
    }
  }
  
  targetCount = targetNumber;
  targets = new Target[ targetNumber ];
  
  int rowIndex = 1;
  for(int n=0; n <= targetMap[levelNumber].length-1; n++){
    if(targetMap[levelNumber][n] != 0){
      targets[targetNumber-1] = new Target(loadImage("targetNormal.gif"), loadImage("targetDead.gif"), sound, dataManager, player, x, y);
      targets[targetNumber-1].draw();
      targetNumber -= 1;
    }
    
    if(x == width-25){
      x = 0;
    }
    else {
      x += 25;
    }
    
    if(rowIndex == 20){
      y += 25*2;
      rowIndex = 1;
    }
    else {
      rowIndex += 1;
    }
  }
}

void loadTargets(){
 targets = new Target[targetCount];
 int targetWidth = new Target().width;
 int spaceCount = targetCount - 1;
 int x = (width - ((targetCount + spaceCount) * targetWidth)) / 2;
 int y = 50;
 for(int i=0; i<= targetCount-1; i++){
   targets[i] = new Target(loadImage("targetNormal.gif"), loadImage("targetDead.gif"), sound, dataManager, player, x, y);
   targets[i].draw();
   x += targetWidth * 2;
 }
}

void drawTargets(){
  for(int i=0; i<= targetCount-1; i++){
    targets[i].draw();
  }
}

void loadBulets(){
  bulets = new Bulet[dataManager.buletCount];
  for(int i=0; i<=bulets.length-1; i++){
    bulets[i] = new Bulet(targets, player, sound, dataManager);
  }
}

void drawBulets(){
  for(int i=0; i<=bulets.length-1; i++){
    bulets[i].draw();
  }
}

void setup(){
  size(500, 500);
  sky = new Sky();
  
  
  sound = new GameSound(new SoundFile(this, "fire.wav"), 
                        new SoundFile(this, "boom.wav"), 
                        new SoundFile(this, "theme.wav"),
                        new SoundFile(this, "catch.wav"),
                        new SoundFile(this, "hit.wav"),
                        new SoundFile(this, "player_dead.wav"),
                        new SoundFile(this, "final.wav"));
  player = new Player(loadImage("playerNormal.gif"), 
                      loadImage("playerDamage100.gif"), 
                      loadImage("playerDamage75.gif"), 
                      loadImage("playerDamage50.gif"), 
                      loadImage("playerDamage25.gif"),
                      width, height, sound);
  gui = new GUI(loadFont("munro.vlw"), loadImage("startScreen.gif"), dataManager, player, sound);
  
  loadMapTarget(1);
  //loadTargets();
  loadBulets();
  sound.playTheme();
}

void draw(){
  println(millis());
  if(stopDraw == false){
    clear();
    sky.draw();
    player.draw();
    drawTargets();
    drawBulets();
    
  }
  gui.draw();
  if(dataManager.killsCount == targetCount){
    dataManager.allTargetsKills = true;
  }
}

void keyPressed(){
  if(dataManager.hideStartScreen == true){
    player.fly(keyCode);
  }
  
  if(keyCode == 38 && player.health > 0 && dataManager.hideStartScreen == true){
    if(dataManager.buletCount >= 0 && bulets[dataManager.buletCount-1] != null){
      bulets[dataManager.buletCount-1].fire();
      sound.playFire();
      dataManager.buletCount -= 1;
    }
    if(dataManager.buletCount <= 0){
      dataManager.buletCount = 10;
    }
  }

  if(keyCode == 48 && dataManager.hideStartScreen == true){
    loadMapTarget(0);
    dataManager.allTargetsKills = false;
    dataManager.killsCount = 0;
    dataManager.buletCount = 10;
    player.restart();
    loadBulets();
    dataManager.hideStartScreen = true;
    this.dataManager.gameOver = false;
    this.dataManager.playFinalSong = false;
  }
  if(keyCode == 49 && dataManager.hideStartScreen == true){
    loadMapTarget(1);
    dataManager.allTargetsKills = false;
    dataManager.killsCount = 0;
    dataManager.buletCount = 10;
    player.restart();
    loadBulets();
    dataManager.hideStartScreen = true;
    this.dataManager.gameOver = false;
    this.dataManager.playFinalSong = false;
   
  }
  if(keyCode == 50 && dataManager.hideStartScreen == true){
    loadMapTarget(2);
    dataManager.allTargetsKills = false;
    dataManager.killsCount = 0;
    dataManager.buletCount = 10;
    player.restart();
    loadBulets();
    dataManager.hideStartScreen = true;
    this.dataManager.gameOver = false;
    this.dataManager.playFinalSong = false;
  }
  if(keyCode == 10){
    dataManager.hideStartScreen = true;
    stopDraw = false;
  }
  
}