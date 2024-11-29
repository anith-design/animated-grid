int cols = 24;
int rows = 16;
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
  background(255);

  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      float tilePosX = gridMargin + tileWidth * x;
      float tilePosY = gridMargin + tileHeight * y;

      //stroke(175);
      //strokeWeight(1);
      //rect(tilePosX, tilePosY, tileWidth, tileHeight);

      //stroke(map(sin(frameCount * 0.01 + x * 0.1), -1, 1, 0, 360), 100, 200);
      stroke(50);
      noFill();
      strokeWeight(map(sin(frameCount * animationSpeed + x * 0.1), -1, 1, 1, 10));
      
      //float offset = sin(frameCount * 0.05 + x * 0.01) * tileHeight * 0.6;
      //line(tilePosX, tilePosY + offset, tilePosX + tileWidth, tilePosY + offset);

      //float offset1 = sin(frameCount * 0.05 + x * 0.25) * tileHeight * 0.4;
      //float offset2 = cos(frameCount * 0.05 + x * 0.25) * tileWidth * 0.4;

      //noFill();
      //bezier(tilePosX, tilePosY + offset1,
      //  tilePosX + tileWidth * 0.3, tilePosY + offset2,
      //  tilePosX + tileWidth * 1.2, tilePosY - offset2,
      //  tilePosX + tileWidth, tilePosY + offset1);

      pushMatrix();
      translate(tilePosX + tileWidth / 2, tilePosY + tileHeight / 2);
      rotate(sin(frameCount * 0.025 + x * 0.25) * HALF_PI);
      line(-tileWidth / 2, 0, tileWidth / 2, 0);
      popMatrix();
    }
  }
}
