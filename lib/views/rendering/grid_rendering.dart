
import 'dart:ui';
import '../../domain/grid.dart';

/// Draws vertical and horizontal grid lines on [canvas].
///
/// Grid positions are calculated independently by the domain layer.
void drawGrid({
  required Canvas canvas,
  required Size size,
  required double spacing,
  required Color color,
}) {

  final [clientWidth, clienHeight] = <double>[size.width, size.height];
    final centerX = clientWidth / 2, centerY = clienHeight / 2;

  final positionsX = gridLinePositions(
    extent: clientWidth,
    center: centerX,
    spacing: spacing,
  );

  final positionsY = gridLinePositions(
    extent: clienHeight,
    center: centerY,
    spacing: spacing,
  );

  final gridPaint = Paint()
    ..color = color
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke;

  // Vertical lines: top → bottom.
  for (final x in positionsX) {
    canvas.drawLine(
      /* from: */Offset(x, 0),
      /* to: */  Offset(x, clienHeight),
      gridPaint,
    );
  }

  // Horizontal lines: left → right.
  for (final y in positionsY) {
    canvas.drawLine(
      /* from: */Offset(0, y),
      /* to: */  Offset(clientWidth, y),
      gridPaint,
    );
  }
  
}
