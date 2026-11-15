
import 'package:flutter/widgets.dart';

class RectPainter extends CustomPainter {
  final double gridSpacing;

  const RectPainter({required this.gridSpacing});

  static const Color _axisColor = Color.fromARGB(255, 0, 110, 255);

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
    final gridPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 0, 0)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final [clientWidth, clienHeigth] = <double>[size.width, size.height];
    final centerX = clientWidth / 2;
    final centerY = clienHeigth / 2;

    final minVerticalIndex =
        (-centerX / gridSpacing).ceil();

    final maxVerticalIndex =
        ((clientWidth - centerX) / gridSpacing).floor();

    final minHorizontalIndex =
        (-centerY / gridSpacing).ceil();

    final maxHorizontalIndex =
        ((clienHeigth - centerY) / gridSpacing).floor();

    // Vertical lines
    for (var i = minVerticalIndex; i <= maxVerticalIndex; i++) {
      final x = centerX + i * gridSpacing;
      final [from, to] = <Offset>[Offset(x, 0), Offset(x, clientWidth)];

      canvas.drawLine(
        from,
        to,
        gridPaint,
      );
    }

    // Horizontal lines
    for (var i = minHorizontalIndex; i <= maxHorizontalIndex; i++) {
      final y = centerY + i * gridSpacing;
      final [from, to] = <Offset>[Offset(0, y), Offset(clientWidth, y)];

      canvas.drawLine(
        from,
        to,
        gridPaint,
      );
    }

    // 3. Coordinate axes
    final axisPaint = Paint()
      ..color = _axisColor
      ..strokeWidth = 1.5
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

  @override
  bool shouldRepaint(covariant RectPainter oldDelegate) {
    return gridSpacing != oldDelegate.gridSpacing;
  }
}
