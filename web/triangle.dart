import "dart:html";
import "dart:async";
import "dart:math";

//
//
// Code was a bit obfuscated - tried to make clearer.... :-)
//
//

Timer t;
int l = 1;
var path = [];
var surface;
var canvas;

main() {
  t = new Timer.periodic(new Duration(milliseconds: 25), (q) => animateText());
  double j = ((640 * 1.5).roundToDouble() / 360.0);
  double h = (300 / 2);
  double i = (PI / 180);
  for (int g = 0; g < 360; g++) {
    path.add([(j * g).round(), (h + (h * sin(i * g))).round()]);
  }
  surface = querySelector("#surface");
  canvas = surface.getContext("2d");
}

animateText() {
  int j = 100;
  canvas.fillStyle = "#ffcc00";
  canvas.clearRect(0, 0, 640, 480);
  for (int h = 0; h < 4; h++) {
    for (int g = 0; g < 6; g++) {
      canvas.fillStyle = "rgb(0,0," + ((g + 4) * h * 10).toString() + ")";
      drawTriangle(canvas, g * j, h * j, j);
    }
  }
  canvas.fillStyle = "#ff5500";
  canvas.font = "bold 42px Arial";
  var i = path[l];
  drawText(canvas, i[0], i[1], "Dart is AWESOME!");
  l++;
  if (l > 359 || i[0] > 640) l = 0;
}

drawText(canvas, x, y, text) {
  canvas.fillText(text, x, y);
}

drawTriangle(q, h, i, g) {
  int j = h + (g / 2).round();
  int BB = i;
  int CB = h;
  int DB = i + g;
  int EB = h + g;
  int FB = i + g;
  q
    ..beginPath()
    ..moveTo(j, BB)
    ..lineTo(CB, DB)
    ..lineTo(EB, FB)
    ..fill();
}
