import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  final Function(Color) onColorSelected;

  const ColorPalette({Key? key, required this.onColorSelected}) : super(key: key);

  static const List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    // Add more colors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors
          .map((color) => GestureDetector(
                onTap: () => onColorSelected(color),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
