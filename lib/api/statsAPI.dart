import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zebrazone/models/models.dart';

class StatsApi {
  final String baseUrl;

  StatsApi(this.baseUrl);
  Future<Map<String, List<StatsModel>>> getStats() async {
    Map<String, List<StatsModel>> result;
    try {
      final response = await Future.wait([
        http.get('$baseUrl/goal'),
        http.get('$baseUrl/assist'),
        http.get('$baseUrl/ontarget'),
        http.get('$baseUrl/dribbles'),
        http.get('$baseUrl/kpasses'),
        http.get('$baseUrl/bigchance'),
        http.get('$baseUrl/accurate_pass'),
        http.get('$baseUrl/clean_sheet'),
        http.get('$baseUrl/tackle'),
        http.get('$baseUrl/red'),
        http.get('$baseUrl/yellow'),
      ]);
      result = {
        "goal": returnResponse(response[0]),
        "assist": returnResponse(response[1]),
        "ontarget": returnResponse(response[2]),
        "dribbles": returnResponse(response[3]),
        "kpasses": returnResponse(response[4]),
        "bigchance": returnResponse(response[5]),
        "accuratePass": returnResponse(response[6]),
        "cleanSheet": returnResponse(response[7]),
        "tackle": returnResponse(response[8]),
        "red": returnResponse(response[9]),
        "yellow": returnResponse(response[10]),
      };
    } catch (e) {
      throw Exception('No Internet connection');
    }
    return result;
  }
}

List<StatsModel> returnResponse(http.Response response) {
  var result;

  if (response.statusCode == 200 || response.statusCode == 201) {
    var body = jsonDecode(response.body);
    result = body['message'];
  } else {
    throw Exception('Something went wrong!!');
  }
  return result.map((news) => StatsModel.fromJson(news)).toList();
}
