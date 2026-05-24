
import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 95, 199, 121);

const List<Color> _colorTheme = [
 
  _customColor,
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.red,
  Colors.yellow,

];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):assert(selectedColor >= 0 && selectedColor <= _colorTheme.length -1,
  'selectedColor debe ser un valor entre 0 y ${_colorTheme.length -1}');
  
  ThemeData theme(){

    return ThemeData(  useMaterial3: true,
     colorSchemeSeed: _colorTheme[selectedColor],
      //brightness: Brightness.dark
     
    
    );
    
  }
}