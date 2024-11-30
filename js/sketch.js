const canvasSketch = require('canvas-sketch');

const settings = {
  dimensions: [ 2048, 2048 ],
  pixelsPerInch: 300,
  animate: true,
  fps: 60,
  duration: 16
};

const sketch = () => {
  const margin = 120;
  const cols = 14;
  const rows = 8;

  return ({ context, width, height, playhead }) => {
    context.fillStyle = 'hsl(0, 0%, 98%)';
    context.fillRect(0, 0, width, height);

    const tileWidth = (width - 2 * margin) / cols;
    const tileHeight = (height - 2 * margin) / rows;

    const animationSpeed = 2;
    const goldenAngle = 137.5 * (Math.PI / 180);

    for (let i = 0; i < cols; i++) {
      for (let j = 0; j < rows; j++) {
        const tilePosX = margin + tileWidth * i;
        const tilePosY = margin + tileHeight * j;

        // context.strokeStyle = 'grey';
        // context.strokeRect(tilePosX, tilePosY, tileWidth, tileHeight);

        context.save();
        context.strokeStyle = 'hsl(240, 100%, 50%)';
        context.lineWidth = 12;
        context.lineCap = 'round';

        context.translate(tilePosX + tileWidth / 2, tilePosY + tileHeight / 2);
        context.rotate(Math.sin(playhead * Math.PI * 2 * animationSpeed + i * 0.2 + j * 0.2) * Math.PI / 2);

        context.beginPath();
        context.moveTo(-tileWidth / 4, 0);
        context.lineTo(tileWidth / 4, 0);
        // context.arc(0, 0, tileWidth / 3, 0, Math.PI * 2);

        context.stroke();

        context.restore();
      }
    }
  };
};

canvasSketch(sketch, settings);
