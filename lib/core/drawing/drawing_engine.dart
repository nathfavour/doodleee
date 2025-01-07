import 'package:flutter/material.dart';
import 'shape_models.dart';

class DrawingEngine {
  final List<Shape> shapes = [];
  Shape? _currentShape;
  late DrawingPainter painter;

  DrawingEngine() {
    painter = DrawingPainter(shapes);
  }

  void addPoint(Offset point, Color color) {
    if (_currentShape == null) {
      _currentShape = Shape(points: [point], color: color);
      shapes.add(_currentShape!);
    } else {
      _currentShape!.points.add(point);
    }
    painter = DrawingPainter(shapes);
  }

  void autocorrect() {
    // Implement autocorrect logic
  }

  void clear() {
    shapes.clear();
    painter = DrawingPainter(shapes);
  }
}

class DrawingPainter extends CustomPainter {
  final List<Shape> shapes;

  DrawingPainter(this.shapes);

  @override
  void paint(Canvas canvas, Size size) {
    for (var shape in shapes) {
      Paint paint = Paint()
        ..color = shape.color
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round;
      for (int i = 0; i < shape.points.length - 1; i++) {
        if (shape.points[i] != null && shape.points[i + 1] != null) {
          canvas.drawLine(shape.points[i], shape.points[i + 1], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
