ArrayList<gameObject> objects;
lootCrate Chest;

int luck;
float cs;
PImage chest, open1, open2, open3;
PImage common,uncommon,rare,exotic,legendary;
void setup() {
  size(200, 200);
  //chest size
  cs=16;
  //chest images
  chest=loadImage("chest/chest.png");
  open1=loadImage("chest/open1.png");
  open2=loadImage("chest/open2.png");
  open3=loadImage("chest/open3.png");
  //rarities images
  common=loadImage("rarities/common.png");
  uncommon=loadImage("rarities/uncommon.png");
  rare=loadImage("rarities/rare.png");
  exotic=loadImage("rarities/exotic.png");
  legendary=loadImage("rarities/legendary.png");
  objects=new ArrayList<gameObject>();
  luck=1;
  for (int i = 0; i < 10; i++) {
    objects.add(new lootCrate(random(0, width), random(height),1+luck));
  }
}
void draw() {
  background(200);
  int a=0;
  while (a<objects.size()) {
    gameObject obj=objects.get(a);
    obj.show();
    obj.open();
    a++;
  }
}
//void lootCrateLuck(float x, float y) {
  //pushMatrix();
  //translate(x, y);
  //rectMode(CENTER);
  //chance=random(0, 100);
  //item=chance;
  //if (item<=legendaryChance) {
  //}
  //if (item<=99-luck) {
  //}
  //if (item<=95-luck) {
  //}
  //if (item<=80-luck) {
  //}
  //if (item<=50-luck) {
  //}
  //popMatrix();
//}
