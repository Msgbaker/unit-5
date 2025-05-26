class lootCrate extends gameObject{
  lootCrate(float x, float y, int luck){
    //determines chest x and y
    super(x, y,luck); 
  }
  void open(){
    super.open();
    if(keyPressed && key=='e' && mouseX>=x-5 && mouseX<=x+cs+5 && mouseY>=y-5 && mouseY<=y+20){
      //determines if chest has been opened 
      opened=true;
      open=true;
    }
  }
}
