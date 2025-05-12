void tactile(int x,int c,int y,int u){
  if(mouseX>=x && mouseX<=c && mouseY>=y && mouseY<=u) bla=white; else bla=black;
}
void startAgain(int x,int c,int y,int u){
  if(mouseX>=x && mouseX<=c && mouseY>=y && mouseY<=u && mousePressed){
    mode=0;
  }
}
