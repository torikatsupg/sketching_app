import 'dart:core';

import 'package:flutter/material.dart';

class CanvasPathState extends ChangeNotifier {
  List<List<Offset>> _points;

  CanvasPathState() {
    _points = [];
  }

  List<List<Offset>> get points => _points;

  addPath(List<Offset> path) {
    _points.add(path);
    notifyListeners();
  }
}

class CurrentPathState with ChangeNotifier {
  List<Offset> _points;

  CurrentPathState() {
    _points = [];
  }

  List<Offset> get points => _points;

  void addPoint(Offset point) {
    _points.add(point);
    notifyListeners();
  }

  void resetPoint() {
    _points = [];
    notifyListeners();
  }
}