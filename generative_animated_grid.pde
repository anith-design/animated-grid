int cols = 12;
int rows = 4;
float tileWidth, tileHeight;
float gridMargin = 120;
float animationSpeed = 0.01;

void setup() {
  size(800, 800);
  pixelDensity(2);

  tileWidth = (width - 2 * gridMargin) / cols;
  tileHeight = (height - 2 * gridMargin) / rows;
}

void draw() {
  background(0);

  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      float tilePosX = gridMargin + tileWidth * x;
      float tilePosY = gridMargin + tileHeight * y;

      //stroke(175);
      //strokeWeight(1);
      //rect(tilePosX, tilePosY, tileWidth, tileHeight);

      //stroke(50);
      // noFill();
      stroke(map(sin(frameCount * 0.01 + x * 0.1), -1, 1, 0, 360), 100, 200);
      strokeWeight(map(sin(frameCount * animationSpeed + x * 0.1), -1, 1, 5, 10));
      
      //float offset = sin(frameCount * 0.025 + x * 0.5) * tileHeight * 0.2;
      //line(tilePosX, tilePosY + offset, tilePosX + tileWidth, tilePosY + offset);

      push();
      
      translate(tilePosX + tileWidth / 2, tilePosY + tileHeight / 2);
      rotate(sin(frameCount * 0.025 + x * 0.2) * HALF_PI);
      line(-tileWidth / 2, 0, tileWidth / 2, 0);

      pop();
    }
  }
}
