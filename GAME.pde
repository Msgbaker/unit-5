import processing.sound.*;

SoundFile flashBang;
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
int mode,startGame,startScreen,gameOver,player1lose,player2lose;
void setup() {
  flashBang=new SoundFile(this,"
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
  mode=0;
  startGame=1;
  startScreen=0;
  player1lose=2;
  player2lose=-1;
}

void draw() {
  rectMode(CORNER);
  if(mode==startScreen) intro(); 
  else if(mode==startGame) gameStarted();
  else if(mode==player1lose) loseScreen1();
  else if(mode==player2lose) loseScreen2();
  if(score2==15){
    score1=0;
    score2=0;
    mode=2;
  }
  if(score1==15){
    score1=0;
    score2=0;
    mode=-1;
  }
}

  void keyPressed() {
    //player 2
    if (keyCode==UP) w2=true;
    if (keyCode==LEFT) a2=true;
    if (keyCode==DOWN) s2=true;
    if (keyCode==RIGHT) d2=true;
    if (key=='p') boost=true;
    //player 1
    if (key=='w'||key=='W') w=true;
    if (key=='a'||key=='A') a=true;
    if (key=='s'||key=='S') s=true;
    if (key=='d'||key=='D') d=true;
    if (key=='e'||key=='E') tele=true;
    if (key=='q'||key=='Q') flashed=true;
    if (key=='r'||key=='R') eTele=true;
    if(key=='o'||key=='O') power=true;
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
    if (key=='w'||key=='W') w=false;
    if (key=='a'||key=='A') a=false;
    if (key=='s'||key=='S') s=false;
    if (key=='d'||key=='D') d=false;
    if (key=='e'||key=='E') tele=false;
    if (key=='q'||key=='Q') flashed=false;
    if (key=='r'||key=='R') eTele=false;
    
  }
