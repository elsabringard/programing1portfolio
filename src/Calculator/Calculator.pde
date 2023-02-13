// Elsa Bringard | november 2022 | calculator project
Button[] numButtons = new Button [10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean Left = true;

void setup () {
  size(320, 540);
  numButtons[0] = new Button (120, 420, 60, 40, '0');
  numButtons[1] = new Button (40, 360, 60, 40, '1');
  numButtons[2] = new Button (120, 360, 60, 40, '2');
  numButtons[3] = new Button (200, 360, 60, 40, '3');
  numButtons[4] = new Button (40, 300, 60, 40, '4');
  numButtons[5] = new Button (120, 300, 60, 40, '5');
  numButtons[6] = new Button (200, 300, 60, 40, '6');
  numButtons[7] = new Button (40, 240, 60, 40, '7');
  numButtons[8] = new Button (120, 240, 60, 40, '8');
  numButtons[9] = new Button (200, 240, 60, 40, '9');
  opButtons[0] = new Button(240, 490, 140, 60, '=');
  opButtons[1] = new Button(280, 360, 60, 40, '+');
  opButtons[2] = new Button(200, 420, 60, 40, '±');
  opButtons[3] = new Button(40, 420, 60, 40, '.');
  opButtons[4] = new Button(280, 420, 60, 40, '-');
  opButtons[5] = new Button(280, 300, 60, 40, 'x');
  opButtons[6] = new Button(280, 240, 60, 40, '÷');
  opButtons[7] = new Button(40, 180, 60, 40, '√');
  opButtons[8] = new Button(120, 180, 60, 40, 'π');
  opButtons[9] = new Button(200, 180, 60, 40, '%');
  opButtons[10] = new Button(280, 180, 60, 40, '²');
  opButtons[11] = new Button(80, 490, 140, 60, 'c');
}

void draw () {
  background (#397289);
  for (int i=0; i< numButtons.length; i++) {
    numButtons[i].display ();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i< opButtons.length; i++) {
    opButtons[i].display ();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  // num buttons keyboard
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 109) { // -
    handleEvent("-", false);
  } else if (keyCode == 107) { // +
    handleEvent("+", false);
  } else if (keyCode == 106) { // x
    handleEvent("x", false);
  } else if (keyCode == 111) { // ÷
    handleEvent("÷", false);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("=", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() <16) {
    if (dVal.equals("0.0")) {
      dVal =  val;
    } else {
      dVal += val;
    }
    if (Left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) { // All opButtons here
    dVal = "0.0";
    Left = true;
    l = 0.0;
    r = 0.0;
    result = 0;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0";
    Left = false;
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0";
    Left = false;
  } else if (val.equals("x")) {
    op = 'x';
    dVal = "0";
    Left = false;
  } else if (val.equals("=")) {
    performCalculation();
  }
}

void mouseReleased() {
  for (int  i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 55) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int  i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c' ) {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons [i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons [i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons [i].val == 'x') {
      handleEvent("x", false);
    } else if (opButtons[i].on && opButtons [i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons [i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons [i].val == 'π') {
      if (Left) {
        l=PI;
        dVal = str(l);
      } else {
        r= PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (Left) {
        l=l*0.01;
        dVal = str(l);
      } else {
        r=r*0.01;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (Left) {
        l=sqrt(l);
        dVal = str(l);
      } else {
        r=sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons [i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons [i].val == '±') {
      if (Left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      if (Left) {
        l=sq(l);
        dVal = str(l);
      } else {
        r=sq(r);
        dVal = str(r);
      }
    }
    println ("l:" + l + " r:" + r + " op:" + op + " Left:" + Left + " result:" + result );
  }
}

void updateDisplay () {
  fill (245);
  stroke(0);
  strokeWeight(1.25);
  rect (160, 80, 300, 140);
  fill (0);
  textAlign(RIGHT);

  //Render scaling text
  if (dVal.length()<9) {
    textSize(70);
  } else if (dVal.length()<11) {
    textSize (55);
  } else if (dVal.length()<15) {
    textSize (40);
  } else if (dVal.length()<16) {
    textSize (35);
  }
  text(dVal, 290, 140);
}
void performCalculation () {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result= l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '²') {
    result = l * l;
  } else if (op == 'π') {
    result = l*3.14159265359;
  } else if (op == '%') {
    result = l/100;
  } else if (op == '√') {
    result = sqrt(l);
  }
  dVal = str(result);
  l = result;
  Left  = true;
}
