// Elsa Bringard | october 10 | screen saver
float xpos, ypos, strokeW, pointCount;

void setup () {
  background(random(100, 255));
  size (displayWidth, displayHeight);
  xpos = random(width);
  ypos = random(height);
}

void draw () {
  strokeW = random(1, 15);
  pointCount = random(1, 20);
  stroke(random(50), random(100), random (255));
  strokeWeight(strokeW);
  if (xpos  > width || xpos < 0  || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  } else {
    if (random(100)>70) {
      strokeWeight(strokeW);
      moveLeft(xpos, ypos, pointCount);
    } else if (random(100)>65) {
      strokeWeight(strokeW);
      moveUp(xpos, ypos, pointCount);
    } else if (random(100)>55) {
      strokeWeight(strokeW);
      moveRight(xpos, ypos, pointCount);
    } else {
      strokeWeight(strokeW);
      moveDown(xpos, ypos, pointCount);
    }
  }
}

    void moveRight(float startX, float startY, float moveCount) {
      for (float i=0; i<moveCount; i++) {
        point(startX + i, startY);
        xpos = startX + i;
        ypos = startY;
      }
    }
    void moveLeft(float startX, float startY, float moveCount) {
      for (float i=0; i<moveCount; i++) {
        point(startX-i, startY);
        xpos = startX - i;
        ypos = startY;
      }
    }

    void moveUp(float startX, float startY, float moveCount) {
      for (float i=0; i<moveCount; i++) {
        point(startX, startY - i);
        xpos = startX;
        ypos = startY - i;
      }
    }

    void moveDown(float startX, float startY, float moveCount) {
      for (float i=0; i<moveCount; i++) {
        point(startX, startY + i);
        xpos = startX;
        ypos = startY + i;
      }
    }
