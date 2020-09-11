import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_room/app/data/model/newsList.dart';
import 'package:news_room/app/data/provider/constants.dart';

class NewsApiProvider {
  Dio dio = Dio();
  final _apiKey = Constant.newsApiKey;

  Future<List<Article>> fetchNewsList(String lable,
      {String category, String country, String source}) async {
    try {
      var url = "${Constant.baseUrl}${Constant.topHeadLine}";

      final response = await dio.get(url, queryParameters: {
        "country": country,
        "category": category,
        "sources": source,
        "pageSize": 50,
        "apiKey": _apiKey,
      });
      // If the call to the server was successful, parse the JSON
      return NewsList.fromJson(response.data, lable).articles;
    } on DioError {
      // If that call was not successful, throw an error.
      Get.snackbar("Failed to load Articles",
          "There seem to be an issue while loading articles");
      throw Exception('Failed to load post');
    } catch (e) {
      throw e;
    }
  }

  Future<List<Article>> fetchEverythingNewsList([String lable]) async {
    try {
      var url = "${Constant.baseUrl}${Constant.topHeadLine}";

      final response = await dio.get(url, queryParameters: {
        "language": "en",
        "pageSize": 50,
        "apiKey": _apiKey,
      });
      // If the call to the server was successful, parse the JSON
      return NewsList.fromJson(response.data, lable).articles;
    } on DioError {
      // If that call was not successful, throw an error.
      Get.snackbar("Failed to load Articles",
          "There seem to be an issue while loading articles");
      throw Exception('Failed to load post');
    } catch (e) {
      throw e;
    }
  }
}
