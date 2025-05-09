void intro(){
  textAlign(CENTER);
  rectMode(CENTER);
  start.resize(600,600);
  image(start,0,0);
  stroke(bla);
  tactile(260,340,486,514);
  fill(255);
  rect(300,500,80,28);
  fill(0);
  textSize(15);
  text("start",300,504);
  if(mouseX>=260 && mouseX<=340 && mouseY>=486 && mouseY<=514 && mousePressed){
    startGame=true;
    startScreen=false;
  }
}
