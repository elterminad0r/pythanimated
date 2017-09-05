void pythag(float base, float lth, int depth) {
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

float th = 0;

void setup() {
  size(1500, 800);
  stroke(255);
}

void draw() {
  translate(width / 2 - 25, 50);
  background(0);
  pythag(100, radians(th % 90), 5);
  th += 0.5;
}
