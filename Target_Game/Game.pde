class Game {
  //class variable
  ArrayList<Ball> shots = new ArrayList<Ball>();
  ArrayList<Target> targets = new ArrayList<Target>();
  ArrayList<Explosion> exps = new ArrayList<Explosion>();
  PImage backImage, base, barrel, endBackImage;
  PImage[] exp = new PImage[6];
  PImage[] shotLeft = new PImage[21];
  PImage[] targetGet = new PImage[21];
  float canAngle = 0;
  float canPower = 10;
  float len;
  int targetNum = 20;
  int frame = 1;
  int ballNum = 20;
  int targetHit = 0;
  int expNum = 0;
  PFont f = createFont("Arial", 16, true);
  boolean gameEnd = false;

  //class construction
  Game() {
    imageMode(CENTER);
    loadImages();
  }

  //class function
  void play() {
    image(backImage, width / 2, height / 2);
    //draw a rectangle to show power
    len = map(canPower, 10, 22, 50, 350);
    fill(0);
    rect(0, 30, len, 65);

    //end the game after all the shot was used
    if (shots.size() == 0 && ballNum == 0) {
      endGame();
      fill(0);
      rect(0, 30, len, 65);
    }

    if (gameEnd == false) {
      //display ball left
      if (ballNum > 0) {
        image(shotLeft[ballNum], 520, 75);
      } else {
        image(shotLeft[0], 500, 75);
      }

      //display ball left
      image(targetGet[targetHit], 885, 75);


      //display each target
      if (targetNum > 0) {
        targets.get(targetNum - 1).display();
      }
    }

    for (int i = 0; i < shots.size(); i ++) {
      Ball b = shots.get(i);
      b.move();
      b.display();
      if (targetNum > 0) {
        if (b.hitTarget(targets.get(targetNum - 1))) {
          targets.get(targetNum - 1).beenHit = true;
          targetNum --;
          shots.remove(i);
          i--;
          targetHit ++;
        }
      }


      b.hitGround();
      if (b.isAlive() == false && b.Smokes.size() == 80) {
        shots.remove(i);
        i--;
      }
    }
    displayCannon();
  }

  void endGame() {
    //end the game
    image(endBackImage, width / 2, height / 2);
    Result();
    gameEnd = true;
  }

  void createShot() {
    //make a shot
    shots.add(new Ball(new PVector(canPower * cos(radians(canAngle)), canPower * sin(radians(canAngle) * - 1))));
  }

  void createExplosion() {
    //make Explosions
    for (int i = 0; i < 20; i ++) {
      exps.add(new Explosion());
    }
  }
  
  void createTargets() {
    //make targets
    for (int i = 0; i < 20; i ++) {
      targets.add(new Target());
    }
  }


  void displayCannon() {
    //draw the cannon (base and barrel)
    pushMatrix();
    translate(73, 525);
    rotate(radians(canAngle * - 1));
    image(barrel, 0, 0);
    popMatrix();
    image(base, 73, 525);
  }

  void increaseAngle(boolean increase) {
    //change the angle of the barrel
    if (increase && canAngle < 90) {
      canAngle += 1.5;
    } else if (increase == false && canAngle > 0) {
      canAngle -= 1.5;
    }
  }

  void increasePower(boolean increaseP) {
    //change the angle of the barrel
    if (increaseP && canPower < 22) {
      canPower += 0.2;
    } else if (increaseP == false && canPower > 10) {
      canPower -= 0.2;
    }
  }

  void Result() {
    //Print the result after game finished
    textAlign(CENTER);
    fill(255);
    if (targetHit == 20) {
      textFont(f, 70);
      text("Perfect!", width/2, 190);
      textFont(f, 28);
      text("Your accuracy was " + targetHit + " / 20    (" + (targetHit *100  / 20) +"%)", width/2, 310);
      textFont(f, 35);
      text("RANK : S", width/2, 360);
      textFont(f, 22);
      text("Press Enter to play again", width/2, 400);
    } else if (targetHit > 17) {
      textFont(f, 70);
      text("Excellent!", width/2, 190);
      textFont(f, 28);
      text("Your accuracy was " + targetHit + " / 20    (" + (targetHit *100  / 20) +"%)", width/2, 310);
      textFont(f, 35);
      text("RANK : A", width/2, 360);
      textFont(f, 22);
      text("Press Enter to play again", width/2, 400);
    } else if (targetHit > 14) {
      textFont(f, 70);
      text("Good Job!", width/2, 190);
      textFont(f, 28);
      text("Your accuracy was " + targetHit + " / 20    (" + (targetHit *100  / 20) +"%)", width/2, 310);
      textFont(f, 35);
      text("RANK : B", width/2, 360);
      textFont(f, 22);
      text("Press Enter to play again", width/2, 400);
    } else if (targetHit > 9) {
      textFont(f, 70);
      text("Not Bad!", width/2, 190);
      textFont(f, 28);
      text("Your accuracy was " + targetHit + " / 20    (" + (targetHit *100  / 20) +"%)", width/2, 310);
      textFont(f, 35);
      text("RANK : C", width/2, 360);
      textFont(f, 22);
      text("Press Enter to play again", width/2, 400);
    } else if (targetHit > 4) {
      textFont(f, 70);
      text("Nice Try!", width/2, 190);
      textFont(f, 28);
      text("Your accuracy was " + targetHit + " / 20    (" + (targetHit *100  / 20) +"%)", width/2, 310);
      textFont(f, 35);
      text("RANK : D", width/2, 360);
      textFont(f, 22);
      text("Press Enter to play again", width/2, 400);
    } else {
      textFont(f, 70);
      text("Better Luck Next Time!", width/2, 190);
      textFont(f, 28);
      text("Your accuracy was " + targetHit + " / 20    (" + (targetHit *100  / 20) +"%)", width/2, 310);
      textFont(f, 35);
      text("RANK : F", width/2, 360);
      textFont(f, 22);
      text("Press Enter to play again", width/2, 400);
    }
  }

  void loadImages() {
    //load all the images
    backImage = loadImage("background.png");
    endBackImage = loadImage("backgroundReport.png");
    base = loadImage("base.png");
    barrel = loadImage("barrel.png");
    for (int i = 1; i < 7; i ++) {
      exp[i - 1] = loadImage("ex"+i+".png");
    }
    for (int i = 0; i < 21; i ++) {
      shotLeft[i] = loadImage("shots"+i+".png");
    }
    for (int i = 0; i < 21; i ++) {
      targetGet[i] = loadImage("target"+i+".png");
    }
  }
}
