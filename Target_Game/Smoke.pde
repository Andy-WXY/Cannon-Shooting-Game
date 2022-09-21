class Smoke {
  //class variable
  float size;
  int lifeTime = 100;
  PVector location;
  PVector velocity = new PVector(0, random(-1, -0.5));
  float xPos, yPos;
  color c;

  //class construction
  Smoke(float x, float y) {
    location = new PVector(x + random(-13, 13), y);
    c = color(random(150, 200));
    size = random(16, 22);
    lifeTime = int(random(50, 100));
  }

  //class function
  void display() {
    //draw smoke
    fill(c, 200);
    noStroke();
    ellipse(location.x, location.y, size, size);
  }

  void move() {
    //move the smoke
    location.add(velocity);
    lifeTime -= 1;
  }
}
