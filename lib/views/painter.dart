
import 'package:flutter/widgets.dart';
import './grid.config.dart';
import './rendering/grid_rendering.dart';
import '../domain/grid.dart';

class Grid extends CustomPainter {
  final GridConfig gridConfig;
  final bool showGrid;

  const Grid({required this.gridConfig, this.showGrid = true});

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Background

    final backgroundPaint = Paint()
      ..color = gridBackgroundColor
      ..style = PaintingStyle.fill
      ;

    canvas.drawRect(
      Offset.zero & size,
      backgroundPaint,
    );

    // 2. Grid geometry

    final geometry = calculateGridGeometry(
      config: gridConfig,
      viewport: (
        width: size.width,
        height: size.height,
      ),
    );

    if (showGrid) {

    // 3. Grid rendering
      drawGrid(
        canvas: canvas,
        size: size,
        geometry: geometry,
        color: gridLineColor,
      );
    
    // 4. Coordinate axes

    final axisPaint = Paint()
      ..color = gridAxisColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    canvas.drawLine(
      Offset(centerX, 0),
      Offset(centerX, size.height),
      axisPaint,
    );

    canvas.drawLine(
      Offset(0, centerY),
      Offset(size.width, centerY),
      axisPaint,
    );

    /* end_if(gridConfig.hidden) */}
  }

  @override
  bool shouldRepaint(covariant Grid oldDelegate) {
    return false;
  }
}
