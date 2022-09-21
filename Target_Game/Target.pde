class Target {
  //class variable
  PImage targetImage;
  float xPos;
  float yPos;
  boolean beenHit = false;

  //class construction
  Target() {
    imageMode(CENTER);
    targetImage = loadImage("target.png");
    xPos = random(100, 1040);
    yPos = random(120, 540);
  }

  //class function
  void display() {
    //display the ball
    pushMatrix();
    translate(xPos, yPos);
    image(targetImage, 0, 0);
    popMatrix();
  }
}
