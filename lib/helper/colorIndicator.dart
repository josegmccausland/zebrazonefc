import 'package:flutter/widgets.dart';

Color getColor(homeName, homeScore, awayName, awayScore) {
  Color winColor = Color(0xFF2CC511);
  Color loseColor = Color(0xffd63031);
  Color drawColor = Color(0xFFD6D6D6);
  Color unplayedColor = Color(0xff6c5ce7);
  if (homeScore.toString() == ' ' && awayScore.toString() == ' ') {
    return unplayedColor;
  }
  var hscore = int.parse(homeScore);
  var ascore = int.parse(awayScore);
  var myTeam = 'juventus';
  homeName = homeName.toLowerCase();
  awayName = awayName.toLowerCase();

  if (homeName == myTeam && hscore > ascore) {
    //home win
    return winColor;
  } else if (homeName == myTeam && hscore < ascore) {
    // home lose
    return loseColor;
  } else if (awayName == myTeam && hscore < ascore) {
    // away win
    return winColor;
  } else if (awayName == myTeam && hscore > ascore) {
    // away lose
    return loseColor;
  } else {
    // draw
    return drawColor;
  }
}
