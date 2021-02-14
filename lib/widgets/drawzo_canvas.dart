import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketching_app/state/points_state.dart';
import 'package:sketching_app/widgets/current_path_paint.dart';

class DrawzoCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CanvasPathState>(
      builder: (_, model, child) => Stack(
        fit: StackFit.expand,
        children: [
          RepaintBoundary(
            child: CustomPaint(
              isComplex: true,
              painter: DrawzoCanvasPainter(model.points),
              child: Container(),
            ),
          ),
          child,
        ],
      ),
      child: ChangeNotifierProvider(
        create: (_) => CurrentPathState(),
        child: const CurrentPathPaint(),
      ),
    );
  }
}

class DrawzoCanvasPainter extends CustomPainter {
  List<List<Offset>> points;
  
  DrawzoCanvasPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..isAntiAlias = true
        ..strokeWidth = 8.0
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;
    for(final path in points) {
      canvas.drawPoints(PointMode.polygon, path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
