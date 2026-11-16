
import 'dart:ui';
import '../../domain/grid.dart';

/// Draws precomputed grid geometry onto a Canvas.
void drawGrid({
  required Canvas canvas,
  required Size size,
  required GridGeometry geometry,
  required Color color,
}) {
  final gridPaint = Paint()
    ..color = color
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  // Vertical lines: top → bottom.
  for (final x in geometry.verticalLines) {
    canvas.drawLine(
      Offset(x, 0),
      Offset(x, size.height),
      gridPaint,
    );
  }

  // Horizontal lines: left → right.
  for (final y in geometry.horizontalLines) {
    canvas.drawLine(
      Offset(0, y),
      Offset(size.width, y),
      gridPaint,
    );
  }
}
