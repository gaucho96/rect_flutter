
import 'package:flutter/widgets.dart';
import 'rendering/grid_rendering.dart';

class RectPainter extends CustomPainter {
  final double gridSpacing;

  const RectPainter({required this.gridSpacing});
  
  static const bool showXYOrigin = true;
  static const Color _axisColor = Color.fromARGB(255, 255, 0, 0);
  static const Color _gridColor = Color.fromARGB(255, 0, 0, 0);

  @override
  void paint(Canvas canvas, Size size) {
    
    // 1. Background
    final backgroundPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Offset.zero & size,
      backgroundPaint,
    );

    // 2. Grid
    drawGrid(
      canvas: canvas,
      size: size,
      spacing: gridSpacing,
      color: _gridColor,
    );


    final [clientWidth, clienHeigth] = <double>[size.width, size.height];
      final centerX = clientWidth / 2, centerY = clienHeigth / 2;

    if (showXYOrigin) {

      // 3. Coordinate axes
      final axisPaint = Paint()
        ..color = _axisColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      canvas.drawLine(
        Offset(centerX, 0),
        Offset(centerX, clienHeigth),
        axisPaint,
      );

      canvas.drawLine(
        Offset(0, centerY),
        Offset(clientWidth, centerY),
        axisPaint,
      );

    }

  }

  @override
  bool shouldRepaint(covariant RectPainter oldDelegate) {
    return gridSpacing != oldDelegate.gridSpacing;
  }
}
