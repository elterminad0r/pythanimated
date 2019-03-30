final float TOTAL_BASE = 90;
final int TOTAL_DEPTH = 7;
final int STEPS = 400;

final boolean RECORDING = false;

void pythag(float base, float lth, int depth) {
  fill((float)depth / TOTAL_DEPTH * 255 * 5 / 6.0f, 255, 255);
  
  rect(0, 0, base, base);
  
  if (depth > 0) {
    pushMatrix();
    translate(0, base);
    rotate(lth);
    pythag(base * cos(lth), lth, depth - 1);
    popMatrix();

    pushMatrix();
    float rbase = base * sin(lth);
    translate(base, base);
    rotate(lth - PI / 2);
    translate(-rbase, 0);
    pythag(rbase, lth, depth - 1);
    popMatrix();
  }
}

int th = 0;

void setup() {
  size(1000, 1000);
  noStroke();
  colorMode(HSB, 255, 255, 255);
}

void draw() {
  translate(width / 2 - TOTAL_BASE / 2, 50);
  background(0);
  pythag(TOTAL_BASE, HALF_PI * (th % STEPS) / STEPS, TOTAL_DEPTH);
  th += 1;
  
  if (RECORDING && th < STEPS) {
    saveFrame("frames/pyth-#######.png");
  }
}
