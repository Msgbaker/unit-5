
float chance,luck,item,legendaryChance;
PImage chest;
void setup(){
  size(200,200);
  luck=0;
  legendaryChance=100;
  chest=loadImage("chest.png");
}
void draw(){
  if(luck<0) legendaryChance=101;
}
void keyPressed(){
  if(key=='e') lootCrate(width/2,height/2); 
}
void lootCrate(float x,float y){
  pushMatrix();
  translate(x,y);
  rectMode(CENTER);
  image(chest,0,0);
  chance=random(0,100);
  item=chance;
  if(item<=legendaryChance){

  }
  if(item<=99-luck){

  }
  if(item<=95-luck){

  }
  if(item<=80-luck){

  }
  if(item<=50-luck){

  }
  popMatrix();
}
