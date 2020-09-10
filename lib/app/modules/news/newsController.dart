import 'package:get/get.dart';
import 'package:news_room/app/data/model/newsList.dart';

import 'service/newsServiceCaller.dart';

class NewsController extends GetxController {
  final NewsApiProvider serviceCaller = NewsApiProvider();

  List<Article> _obj = [Article()].obs;
  set obj(value) => this._obj.addAll(value);
  get obj => this._obj;

  @override
  void onInit() {
    fetchArticleFromAPI();
    super.onInit();
  }

  fetchArticleFromAPI() async {
    List<Article> articles = await serviceCaller.fetchNewsList();
    if (articles.isNotEmpty) {
      _obj = articles;
      update();
    } else {
      //TODO no article from API show from Local DB.
    }
  }

  fetchArticleFromAPIforCategory(String category) async {
    List<Article> articles =
        await serviceCaller.fetchNewsList(category: category);
    if (articles.isNotEmpty) {
      _obj = articles;
      update();
    }
  }
}
