import 'package:flutter/material.dart';
import '../../core/drawing/drawing_engine.dart';

class DoodleCanvas extends StatefulWidget {
  const DoodleCanvas({Key? key}) : super(key: key);

  @override
  _DoodleCanvasState createState() => _DoodleCanvasState();
}

class _DoodleCanvasState extends State<DoodleCanvas> {
  final DrawingEngine _drawingEngine = DrawingEngine();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _drawingEngine.addPoint(details.localPosition);
        });
      },
      onPanEnd: (details) {
        _drawingEngine.autocorrect();
      },
      child: CustomPaint(
        painter: _drawingEngine.painter,
        child: Container(),
      ),
    );
  }
}
