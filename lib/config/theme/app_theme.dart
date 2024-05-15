import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.deepPurple,
  Colors.lime,
  Colors.blue,
  Colors.deepOrange,
  Colors.teal,
  Colors.brown,
  Colors.green,
  Colors.grey,
  Colors.pink
];

class AppTheme{

  final int selectedColor;

  AppTheme({ 
    this.selectedColor = 0
  });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

  AppTheme copyWith({
    int? selectedColor,
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor
  ); 
}