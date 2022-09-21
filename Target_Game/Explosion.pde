class Explosion {
  //class variavle
  PImage[] exp = new PImage[6];
  int current = 0;
  int fram = 1;
  
  //class construction
  Explosion(){
    for (int i = 1; i < 7; i ++) {
      exp[i - 1] = loadImage("ex"+i+".png");
    }
  }
  
  
  //class function
  void display(float x, float y){
    if(current < 6){
   image(exp[current], x, y);
   if(fram % 8 == 0){
     current ++;
   }
     fram ++;
   }
  }
  
  
  
}
