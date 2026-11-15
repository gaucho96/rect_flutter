
import 'package:flutter/widgets.dart';
import 'rect_painter.dart';

class RectStage extends StatelessWidget {
  const RectStage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(painter: RectPainter(gridSpacing: 40));
  }
}
