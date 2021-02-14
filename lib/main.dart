import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketching_app/state/points_state.dart';
import 'package:sketching_app/widgets/drawzo_canvas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sketching App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => CanvasPathState(),
          child: DrawzoCanvas(),
        )
      ),
    );
  }
}
