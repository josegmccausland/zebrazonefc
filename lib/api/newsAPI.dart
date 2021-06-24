import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zebrazone/models/models.dart';

class News {
  Future<List<NewsModel>> fetchZZposts() async {
    List<NewsModel> result;
    var url = 'https://zebrazonefc.com/wp-json/wp/v2/posts';
    try {
      final response = await http.get(url);
      result = _returnResponse(response);
    } catch (e) {
      print(e);
      throw Exception('No Internet connection');
    }
    return result;
  }
}

_returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      List<NewsModel> body = jsonDecode(response.body).map((news) => NewsModel.fromJson(news)).toList();
      return body;
    case 201:
            List<NewsModel> body = jsonDecode(response.body).map((news) => NewsModel.fromJson(news)).toList();

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
