class gameObject {
  float x, y, chance, fakeChance;
  int opening, luck;
  boolean open, opened;
  gameObject(float x, float y, int luck) {
    //x and y of chest
    this.x=x;
    this.y=y;
    this.luck=luck;
    opening=0;
    chance=random(0, 100.1);
    fakeChance=random(0, 100);
  }
  void show() {
  }

  void open() {
    println(opening);
    rectMode(CENTER);
    if (opened) {
      //opening animation
      if (opening<421)opening=opening+2;
      if (opening<=420 && opening>120) {
        image(open3, x, y);
        //luck
        if (chance<=100.1){
          fill(150,20,70);
          rect(x+cs/2,y,cs/2,cs/2);
        }
        if (chance<=100) {
          image(legendary,x+cs/2-4,y-4);
          //fill(0, 255, 0);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (chance<=99-luck) {
          image(exotic,x+cs/2-4,y-4);
          //fill(0);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (chance<=95-luck) {
          image(rare,x+cs/2-4,y-4);
          //fill(255);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (chance<=80-luck) {
          image(uncommon,x+cs/2-4,y-4);
          //fill(0, 0, 255);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (chance<=50-luck) {
          image(common,x+cs/2-4,y-4);
          //fill(255, 0, 0);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
      }
      if (opening<=280 && opening>=120) {
        if (frameCount % 9 == 0) {
          fakeChance=random(0, 100);
        }
        if (fakeChance<=100-luck) {
          image(legendary,x+cs/2-4,y-4);
          //fill(0, 255, 0);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (fakeChance<=80-luck) {
          image(exotic,x+cs/2-4,y-4);
          //fill(0);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (fakeChance<=60-luck) {
          image(rare,x+cs/2-4,y-4);
          //fill(255);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (fakeChance<=20-luck) {
          image(uncommon,x+cs/2-4,y-4);
          //fill(0, 0, 255);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
        if (fakeChance<=19-luck) {
          image(common,x+cs/2-4,y-4);
          //fill(255, 0, 0);
          //rect(x+cs/2, y, cs/2, cs/2);
        }
      }
      if (opening<=120) image(open2, x, y);
      if (opening<=60) image(open1, x, y);
      //luck
    } else if (opened==false && open==false) {
      image(chest, x, y);
    }
  }
}
