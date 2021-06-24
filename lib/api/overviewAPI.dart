import 'package:http/http.dart' as http;
import 'dart:convert';

class OverviewApi {
  final String baseUrl;
  OverviewApi(this.baseUrl);
  Future<Map<String, dynamic>> getOverview() async{
    Map<String, dynamic> result;
    try{
      final response = await http.get('$baseUrl/overview');
      result = _returnResponse(response);
    }catch(e){
      throw Exception('No Internet connection');
    }
    return result;
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
