import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zebrazone/models/models.dart';

class FootballApi {
  final String baseUrl;
  FootballApi(this.baseUrl);

  Future<List<TableModel>> getSerieATable() async {
    var result;
    final url = '$baseUrl/api/v1/buckthorn/zonefootball/zebrazone/table';
    try {
      final response = await http.get(url);
      result = _returnResponse(response)['table'];
    } catch (e) {
      throw Exception('No Internet connection');
    }
    return result.map((teams) => TableModel.fromJson(teams)).toList();
  }

  Future<List<FixtureModel>> getJuventusFixture() async {
    var result;
    final url = '$baseUrl/api/v1/buckthorn/zonefootball/zebrazone/fixture';
    try {
      final response = await http.get(url);
      result = _returnResponse(response)['fixture'];
    } catch (e) {
      throw Exception('No Internet connection');
    }
    return result.map((fixture) => FixtureModel.fromJson(fixture)).toList();
  }

  Future<List<SquadModel>> getJuventusSquad() async {
    var result;
    final url = '$baseUrl/api/v1/buckthorn/zonefootball/zebrazone/squad';
    try {
      final response = await http.get(url);
      result = _returnResponse(response)['squad'];
    } catch (e) {
      throw Exception('No Internet connection');
    }
    return result.map((squad) => SquadModel.fromJson(squad)).toList();
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var body = jsonDecode(response.body);
      return body;
    case 201:
      var body = jsonDecode(response.body);
      return body;
    case 400:
      throw Exception(response.body.toString());
    case 401:
    case 403:
      throw Exception(response.body.toString());
    case 500:
    default:
      throw Exception(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
