

color white=#FFFFFF;
color black=#000000;
color bla=#000000;
PImage flash,ender,swiftness,strength,start;
//ability's
//p1
//score
int score1;
//tele
int teleCooldown;
boolean tele,enderOn;
float teleCooldownText,enderX,enderY,evy,evx;
//flash
int flashCooldown,f;
float flashCooldownText;
boolean flashed;
//enemytele
int eTeleCooldown;
float eTeleCooldownText;
boolean eTele;
//
//p2
//score
int score2;
//boost
int boostCooldown,boostLength;
float boostCooldownText;
boolean boost;
//powerShoot
int powerCooldown,shot;
float powerCooldownText;
boolean power;
//players
float x, y, r;
float x2, y2, r2;
float speed1,speed2;
//ball
float bx, by, bd,ballSped;
float vby, vbx, abx, aby;
//player 2 controls
boolean w, a, s, d;
boolean w2, a2, s2, d2;
boolean startGame,startScreen,gameOver;
boolean player1lose,player2lose;
void setup() {
  flash=loadImage("flash.png");
  ender=loadImage("ender.png");
  swiftness=loadImage("swiftness.png");
  strength=loadImage("strength.png");
  start=loadImage("start.png");
  size(600, 600);
  //player 1
  x=width/2;
  y=15;
  r=32;
  w=false;
  a=false;
  s=false;
  d=false;
  speed1=5;
  tele=false;
  flashed=false;
  //player 2
  x2=width/2;
  y2=585;
  r2=32;
  w2=false;
  a2=false;
  s2=false;
  d2=false;
  speed2=5;
  //ball
  bd=12;
  bx=width/2;
  by=height/2;
  vby=0;
  vbx=0;
  ballSped=3.6;
  teleCooldown=0;
  flashCooldown=0;
  boostCooldown=0;
  powerCooldown=0;
  //
  enderOn=false;
  boost=false;
  power=false;
  score1=0;
  score2=0;
  startGame=false;
  startScreen=true;
  player1lose=false;
  player2lose=false;
}

void draw() {
  rectMode(CORNER);
  if(startGame) gameStarted();
  if(startScreen) intro();
  if(score2==15){
    player1lose=true;
    startGame=false;
    score1=0;
    score2=0;
  }
  if(score1==15){
    score1=0;
    score2=0;
    startGame=false;
    player2lose=true;
  }
  if(player1lose) loseScreen1();
  if(player2lose) loseScreen2();
}

  void keyPressed() {
    //player 2
    if (keyCode==UP) w2=true;
    if (keyCode==LEFT) a2=true;
    if (keyCode==DOWN) s2=true;
    if (keyCode==RIGHT) d2=true;
    if (key=='p') boost=true;
    //player 1
    if (key=='w') w=true;
    if (key=='a') a=true;
    if (key=='s') s=true;
    if (key=='d') d=true;
    if (key=='e') tele=true;
    if (key=='q') flashed=true;
    if (key=='r') eTele=true;
    if(key=='o') power=true;
  }
  void keyReleased() {
    //player 2
    if (keyCode==UP) w2=false;
    if (keyCode==LEFT) a2=false;
    if (keyCode==DOWN) s2=false;
    if (keyCode==RIGHT) d2=false;
    if (key=='p') boost=false;
    if(key=='o') power=false;
    //player 1
    if (key=='w') w=false;
    if (key=='a') a=false;
    if (key=='s') s=false;
    if (key=='d') d=false;
    if (key=='e') tele=false;
    if (key=='q') flashed=false;
    if (key=='r') eTele=false;
    
  }
