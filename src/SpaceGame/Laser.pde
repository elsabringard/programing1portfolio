class Laser {
  int x, y, w, h, speed;
  color c1;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w=4;
    h = 10;
    speed = 10;
    c1 = color(#00FA1F);
  }

  void display() {
    //x = tempX;
    //y = tempY;
    rectMode(CENTER);
    noStroke();
    fill(c1);
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<laser.w/2) {
      return true;
    } else {
      return false;
    }
  }
}
