class Ball {
  //class variable
  PVector pos;
  PVector velocity;
  PVector acceleration;
  PImage ballImage;
  boolean alive = true;
  ArrayList<Smoke> Smokes = new ArrayList<Smoke>();
  float endPos;
  int smokeDisappear = 0;

  //class construction
  Ball(PVector v) {
    pos = new PVector(70, 520);
    velocity = v;
    acceleration = new PVector(0, 0.3);
    alive = true;
    ballImage = loadImage("Cannonball.png"); //radius 20
  }

  //class function
  void move() {
    //move the ball and change the velocity by acceleration
    pos = pos.add(velocity);
    velocity = velocity.add(acceleration);
  }

  void display() {
    //display the ball
    if (alive) {
      pushMatrix();
      translate(pos.x, pos.y);
      image(ballImage, 0, 0);
      popMatrix();
    }
  }

  void hitGround() {
    //check if the ball hit the ground
    if (pos.y + 20 >= 566) {
      if (pos.y - velocity.y < 566) {
        endPos = pos.x;
      }
      if (Smokes.size() < 80) {
        Smokes.add(new Smoke(endPos, 566));
      }
    }
    for (int i = 0; i < Smokes.size(); i ++) {
      Smokes.get(i).move();
      Smokes.get(i).display();
      alive = false;
    }
  }

  //check if the ball hit the target
  boolean hitTarget(Target t) {
    float d = dist(pos.x, pos.y, t.xPos, t.yPos);
    if (d < 40) {
      alive = false;
      return true;
    } else {
      return false;
    }
  }

  boolean isAlive() {
    return alive;
  }
}
