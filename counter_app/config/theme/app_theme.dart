import 'package:flutter/material.dart';

const Color _customcolor = Colors.deepPurple;

const List<Color> _colorThemes = [
  _customcolor,
  Colors.amber,
  Colors.blueGrey,
  Colors.cyan,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor < _colorThemes.length,
        'El color debe ser desde 0 hasta ${_colorThemes.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
