//Target Game
//Andy Wei
//CS 30
//
//Expand on the Target Game developed in the demos 

//Initialize all the variables.
ArrayList<Game> myGame = new ArrayList<Game>();
ArrayList<Explosion> exps = new ArrayList<Explosion>();
int current = 0;

void setup() {
  size(1068, 600);
  myGame.add(new Game());
  //make all the targets before the game begin
  myGame.get(0).createTargets();
  myGame.get(0).createExplosion();
  for(int i = 0; i < 20; i ++){
    exps.add(new Explosion());
  }
}

void draw() {
  
  myGame.get(0).play();
  quickInput();
  if(myGame.get(0).targetNum < 20){
    Target t = myGame.get(0).targets.get(myGame.get(0).targetNum);
    if(myGame.get(0).targets.get(myGame.get(0).targetNum).beenHit == true){
      exps.get(myGame.get(0).targetNum).display(t.xPos, t.yPos);
    }
  }
}

void keyPressed() {
  //shoot the ball by pressing space
  if (key == ' ') {
    if (myGame.get(0).ballNum > 0) {
      myGame.get(0).createShot();
      myGame.get(0).ballNum --;
    }
  }
  if (keyCode == ENTER) {
    if (myGame.get(0).gameEnd) {
      myGame.add(new Game());
      myGame.get(1).createTargets();
      myGame.get(1).createExplosion();
      myGame.remove(0);
      exps = new ArrayList<Explosion>();
      for(int i = 0; i < 20; i ++){
      exps.add(new Explosion());
  }
    }
  }
}

void quickInput() {
  //use for keyboard input that checked every frame (arrow key)
  if (keyPressed && myGame.get(0).gameEnd == false) {
    if (keyCode == UP) {
      myGame.get(0).increasePower(true);
    } else if (keyCode == DOWN) {
      myGame.get(0).increasePower(false);
    } else if (keyCode == LEFT) {
      myGame.get(0).increaseAngle(true);
    } else if (keyCode == RIGHT) {
      myGame.get(0).increaseAngle(false);
    }
  }
}
