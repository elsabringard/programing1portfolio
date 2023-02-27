// Elsa Bringard | november 28 | Space game
import processing.sound.*;
SoundFile blaster;
Ship s1;
Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList <PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star [] stars = new Star[1000];
int score, level, rockRate, Rocks, Lasers, ammo, rocksPassed;
boolean play;

void setup() {
  size (800, 800);
  s1 = new Ship();
  rockRate = 500;
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  blaster = new SoundFile(this, "blast.wav");
  for (int i=0; i<stars.length; i++) {
    stars [i] = new Star ();
  }
  score = 0;
  level = 1;
  //Laser Count = 1000;
  play = false;
  rocksPassed=0;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    
    //level handling
    if (frameCount % 1000 ==10) {
      level++;
      rockRate-=10;
    }
    
    background(1);

    //rendering stars
    for (int i=0; i<stars.length; i++) {
      stars [i].display ();
      stars [i].move ();
    }
    noCursor();
    

    // Add PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("PowerUps:" + powerups.size());
    }

    // Rendering PowerUps and Detectiong ship collision
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=100;
        } else {
          s1.ammo+=100;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
        Rocks ++;
      } else {
        pu.display();
        pu.move();
      }
    }

    // Add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rocks:" + rocks.size());
    }

    // Rendering rocks and Detectiong ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        // todo call the explosion animation
        //add a sound for explosion
        // todo: consider adding rock health
        score -= 25;
        rocksPassed++;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        Rocks ++;
      } else {
        r.display();
        r.move();
      }
    }

    //Render lasers on the screen and detect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+=50;
          //Todo: add sound to collision
          //Todo: Add animation to the collision
          //todo: dectrament to rock health
          lasers.remove(l);
          rocks.remove(r);
        }
        if (l.reachedTop()) {
          Lasers ++;
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }

    s1.display(mouseX, mouseY);
    infoPanel();

    // Game over logic
    if (s1.health<1 || Rocks > 10) {
      gameOver();
      noLoop();
    }
  }
}

//Add laser based on event
void mousePressed() {
  blaster.stop();
  blaster.play();
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add (new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else  if (s1.fire() && s1.turretCount == 2) {
    lasers.add (new Laser(s1.x - 20, s1.y));
    lasers.add (new Laser(s1.x + 20, s1.y));
    println("Lasers:" + lasers.size());
  } else  if (s1.fire() && s1.turretCount == 3) {
    lasers.add (new Laser(s1.x + 20, s1.y));
    lasers.add (new Laser(s1.x - 20, s1.y));
    lasers.add (new Laser(s1.x + 0, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void keyPressed() {
  blaster.stop();
  blaster.play();
  if (key == ' ') {
    if (s1.fire() && s1.turretCount == 1) {
      lasers.add (new Laser(s1.x, s1.y));
      println("Lasers:" + lasers.size());
    } else  if (s1.fire() && s1.turretCount == 2) {
      lasers.add (new Laser(s1.x - 20, s1.y));
      lasers.add (new Laser(s1.x + 20, s1.y));
      println("Lasers:" + lasers.size());
    } else  if (s1.fire() && s1.turretCount == 3) {
      lasers.add (new Laser(s1.x + 20, s1.y));
      lasers.add (new Laser(s1.x - 20, s1.y));
      lasers.add (new Laser(s1.x +0, s1.y));
      println("Lasers:" + lasers.size());
    }
  }
}


void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(23);
  text("Score:" + score, 60, 40);
  text("Level:" + level, 200, 40);
  text("Rocks Passed:" + Rocks, 350, 40);
  text("Laser Count:" + Lasers, 530, 40);
  text("Health:" + s1.health, 690, 40);
  //text("Rocks Passed" + rocksPassed, 700, 40);
}

void startScreen() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(222);
  fill(#0F9018);
  textAlign(CENTER);
  text("OH NO you dead! Game over!!!", width/2, height/2);
  play = false;
  noLoop();
}
