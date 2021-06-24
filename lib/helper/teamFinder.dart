import 'package:zebrazone/models/fixtureModel.dart';

findTeam(FixtureModel map) {
  var myTeam = 'Juventus';
  var othrTeam = map.opponent.name;
  var gameOn = map.lnameArr[0];
  var result = gameOn.toLowerCase() == 'h'
      ? {
          'home': myTeam,
          'hId': 9885,
          'away': othrTeam,
          'aId': map.opponent.id,
        }
      : {
          'away': myTeam,
          'aId': 9885,
          'hId': map.opponent.id,
          'home': othrTeam,
        };
  return result;
}
