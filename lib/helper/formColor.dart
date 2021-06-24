import 'package:flutter/widgets.dart';

Color formColor(String letter) {
  Color winColor = Color(0xFF2CC511);
  Color loseColor = Color(0xffd63031);
  Color drawColor = Color(0xFF5A4B4B);
  letter = letter.toLowerCase();
  if (letter == 'w') {
    return winColor;
  } else if (letter == 'l') {
    return loseColor;
  } else {
    return drawColor;
  }
}
