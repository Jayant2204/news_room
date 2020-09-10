import 'package:get/get.dart';
import 'package:news_room/app/data/model/newsList.dart';

import 'service/newsServiceCaller.dart';

class NewsController extends GetxController {
  final NewsApiProvider serviceCaller = NewsApiProvider();

  List<Article> obj = [Article()].obs;
  set setobj(value) => this.obj.addAll(value);
  get getobj => this.obj;

  @override
  void onInit() {
    fetchArticleFromAPI();
    super.onInit();
  }

  fetchArticleFromAPI() async {
    List<Article> articles = await serviceCaller.fetchNewsList();
    if (articles.isNotEmpty) {
      obj = articles;
      update();
    } else {
      //TODO no article from API show from Local DB.
    }
  }

  fetchArticleFromAPIforCategory(String category) async {
    List<Article> articles =
        await serviceCaller.fetchNewsList(category: category);
    if (articles.isNotEmpty) {
      obj = articles;
      update();
    }
  }
}
