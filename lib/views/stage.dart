
import 'package:flutter/widgets.dart';
import 'painter.dart';

class Stage extends StatelessWidget {
  const Stage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      // Stack is Directionality-sensitive, thus to avoid app-level Error we MUST explicitly set [textDirection], for example:
      textDirection: TextDirection.ltr,
      
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: Grid(
          showGrid: !false,
          gridConfig: (
            hidden: false,
            spacing: 40.0,
          ),
        )),
      ],
    );
  }
}
