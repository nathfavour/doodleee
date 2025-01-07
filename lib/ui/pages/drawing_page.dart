import 'package:flutter/material.dart';
import '../widgets/doodle_canvas.dart';
import '../widgets/color_palette.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  State<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  Color _selectedColor = Colors.black;

  void _onColorSelected(Color color) {
    setState(() {
      _selectedColor = color;
      // Update drawing engine with selected color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing'),
      ),
      body: Column(
        children: [
          ColorPalette(onColorSelected: _onColorSelected),
          Expanded(
            child: DoodleCanvas(),
          ),
        ],
      ),
    );
  }
}
