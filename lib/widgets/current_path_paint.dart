import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketching_app/state/points_state.dart';

class CurrentPathPaint extends StatelessWidget {
  const CurrentPathPaint();

  @override
  Widget build(BuildContext context) {
    final currentPathState = Provider.of<CurrentPathState>(context, listen: false);
    final canvasPathState = Provider.of<CanvasPathState>(context, listen: false);

    return Consumer<CurrentPathState>(
      builder: (_, model, child) => Stack(
        fit: StackFit.expand,
        children: [
          RepaintBoundary(
            child: CustomPaint(
              isComplex: true,
              painter: CurrentPathPainter(model.points),
              child: Container(),
            ),
          ),
          child
        ],
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (details) {
          currentPathState.addPoint(details.localPosition);

          currentPathState.addPoint(details.localPosition);
        },
        onPanUpdate: (details) =>
            currentPathState.addPoint(details.localPosition),
        onPanEnd: (details) {
          canvasPathState.addPath(currentPathState.points);
          currentPathState.resetPoint();
        },
      ),
    );
  }
}

class CurrentPathPainter extends CustomPainter {
  List<Offset> points;

  CurrentPathPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPoints(PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
