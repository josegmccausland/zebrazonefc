import 'package:zebrazone/models/fixtureModel.dart';

int findNextGame(List<FixtureModel> data) {
  var result = 0;
  for (int i = 0; i < data.length; i++) {
    if (!data[i].status.finished) {
      result = i;
      break;
    }
  }
  return result;
}
