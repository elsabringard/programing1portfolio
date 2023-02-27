class Rock {
  int x, y, speed, diam;
  PImage rock;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 10));
    diam = 50;
    rock = loadImage("rock.png");
  }

  void display() {
    rock.resize(150, 150);
    imageMode(CENTER);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }
}
