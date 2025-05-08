
PImage flash,ender,swiftness,strength;
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
void setup() {
  flash=loadImage("flash.png");
  ender=loadImage("ender.png");
  swiftness=loadImage("swiftness.png");
  strength=loadImage("strength.png");
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
  ballSped=3.5;
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
}

void draw() {
  background(220);
  textAlign(CENTER);
  //score
  stroke(0);
  fill(0);
  text(""+score1,585,15);
  text(""+score2,585,585);
  //ability cooldowns
  //flash
  flash.resize(30,30);
  image(flash,0,0);
  fill(235,235,235,215);
  rect(0,0,flashCooldownText,30);
  noFill();
  stroke(0);
  rect(0,0,30,30);
  flashCooldownText=(map(flashCooldown,0,1300,0,30));
  //tele
  fill(255);
  rect(0,30,30,30);
  ender.resize(30,30);
  image(ender,1,32);
  fill(235,235,235,215);
  noStroke();
  rect(0,30,teleCooldownText,30);
  noFill();
  stroke(0);
  rect(0,30,30,30);
  teleCooldownText=(map(teleCooldown,0,1000,0,30));
  //boost
  swiftness.resize(30,30);
  image(swiftness,0,570);
  stroke(0);
  rect(0,570,30,30);
  noStroke();
  fill(235,235,235,215);
  rect(0,570,boostCooldownText,30);
  boostCooldownText=(map(boostCooldown,0,720,0,30));
  //powerShot
  strength.resize(30,30);
  image(strength,0,540);
  stroke(0);
  noFill();
  rect(0,540,30,30);
  noStroke();
  fill(235,235,235,215);
  rect(0,540,powerCooldownText,30);
  powerCooldownText=(map(powerCooldown,0,600,0,30));
  println(shot);
  //ability desc
  fill(0);
  if(mouseX>=0 && mouseX<=30 && mouseY>=0 && mouseY<=30) text("FLASHBANG Q",69,17);
  if(mouseX>=0 && mouseX<=30 && mouseY>=30 && mouseY<=60) text("Teleports you to mouse E",96,51);
  if(mouseX>=0 && mouseX<=30 && mouseY>=570 && mouseY<=600) text("Speed boost P", 70,587.5);
  if(mouseX>=0 && mouseX<=30 && mouseY>=540 && mouseY<=570) text("Your next shot has more power O",116,557.5);
  //
  stroke(0);
  line(0,height/2,width,height/2);
  //player 1
  if (w && y>=r/2) y-=speed1;
  if (a && x>=r/2) x-=speed1;
  if (s && y<=300-r/2) y+=speed1;
  if (d && x<= 600-r/2) x+=speed1;
  fill(255);
  circle(x, y, r);
  //player 2
  if (w2 && y2>=300+r2/2) y2-=speed2;
  if (a2 && x2>=r2/2) x2-=speed2;
  if (s2 && y2<=600-r2/2) y2+=speed2;
  if (d2 && x2<= 600-r2/2) x2+=speed2;
  fill(0);
  circle(x2, y2, r2);
  //ball
  fill(255);
  circle(bx, by, bd);
  if (by<=5) vby=3;
  if (by>=595) vby=-3;
  by=by+vby;
  bx=bx+vbx;
  if (bx<=5) vbx=3;
  if (bx>=595) vbx=-3;
  if (dist(x, y, bx, by)<r/2+bd/2) {
    vby=(by-y)/3.5;
    vbx=(bx-x)/3.5;
  }
  if (dist(x2, y2, bx, by)<r2/2+bd/2) {
    vby=(by-y2)/ballSped;
    vbx=(bx-x2)/ballSped;
    shot=0;
  }
  //ability's
  //tele
  if (teleCooldown!=0) teleCooldown--;
  if (tele && teleCooldown==0) {
    enderOn=true;
    enderX=x;
    enderY=y;
    //x=mouseX;
   // y=mouseY;
    teleCooldown=1000;
  }
  if(enderOn){
    ender.resize(30,30);
    image(ender,enderX,enderY);
    enderX+=evx/8;
    enderY+=evy/8;
    evx=mouseX-x;
    evy=mouseY-y;
    if(dist(enderX,enderY,mouseX,mouseY)<3 || enderX<=15 || enderX>=width-15 || enderY<=14 || enderY>=width/2-32){
      x=enderX;
      y=enderY;
      enderOn=false;
    }
  }
  //flash
  if(flashCooldown!=0) flashCooldown--;
  if(flashed && flashCooldown==0){
    f=350;
    flashCooldown=1300;
  }
  if(f!=0) f--;
  noStroke();
  fill(255,255,255,f);
  rect(0,0,width,height);
  if(by<=bd/2){
     by=height/2;
     bx=width/2;
     vby=0;
     vbx=0;
     x=width/2;
     y=r/2;
     x2=width/2;
     y2=600-r/2;
     score2++;
  }
  if(by>=600-bd/2){
     by=height/2;
     bx=width/2;
     vby=0;
     vbx=0;
     x=width/2;
     y=r/2;
     x2=width/2;
     y2=600-r/2;
     score1++;
  }
  //boost
  if(boost && boostCooldown==0){
    boostLength=240;
    boostCooldown=720;
  } else if(boostCooldown!=0) boostCooldown--;
  if(boostLength!=0) boostLength--;
  if(boostLength!=0){
    speed2=7;
  }else speed2=5;
  //power
  if(power) shot=1;
  if(shot==0) ballSped=3.5;
  if(power && powerCooldown==0 && shot==1){
    ballSped=2;
    powerCooldown=600;
  } 
  if(powerCooldown!=0) powerCooldown--;
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
