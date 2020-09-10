import 'package:dio/dio.dart';
import 'package:news_room/app/data/model/newsList.dart';
import 'package:news_room/app/data/provider/constants.dart';

class NewsApiProvider {
  Dio dio = Dio();
  final _apiKey = Constant.newsApiKey;

  Future<List<Article>> fetchNewsList({String category = ''}) async {
    try {
      var url =
          "${Constant.baseUrl}${Constant.topHeadLine}?country=in&apiKey=$_apiKey&category=$category";

      final response = await dio.get(url);
      // If the call to the server was successful, parse the JSON
      return NewsList.fromRawJson(response.data).articles;
    } on DioError {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
