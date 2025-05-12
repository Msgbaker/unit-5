void gameStarted(){
  background(220);
  
  textAlign(CENTER);
  //score
  stroke(0);
  fill(0);
  text(""+score1,585,15);  text(""+score2,585,585);
  //ability cooldowns
  //flash
  flash.resize(30,30);
  image(flash,0,0);
  noStroke();
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
  textSize(12);
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
    vby=(by-y)/3.6;
    vbx=(bx-x)/3.6;
    if(vby<0) vby=vby*-1;
    if(vbx<0) vbx=vbx*-1;
  }
  if (dist(x2, y2, bx, by)<r2/2+bd/2) {
    vby=(by-y2)/ballSped;
    vbx=(bx-x2)/ballSped;
    if(vby>0) vby=vby*-1;
    if(vbx>0) vbx=vbx*-1;
    shot=0;
  }

  println(vby);
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
    speed2=6;
  }else speed2=5;
  //power
  if(power) shot=1;
  if(shot==0) ballSped=3.6;
  if(power && powerCooldown==0 && shot==1){
    ballSped=2;
    powerCooldown=600;
  } 
  if(powerCooldown!=0) powerCooldown--;
}
