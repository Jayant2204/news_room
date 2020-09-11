import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_room/app/data/model/newsList.dart';
import 'package:news_room/app/utils/isOfflineCheck.dart';

import 'service/newsServiceCaller.dart';

class NewsController extends GetxController {
  final NewsApiProvider serviceCaller = NewsApiProvider();
  GetStorage box = GetStorage();
  List<Article> obj = List<Article>().obs;
  set setobj(value) => this.obj.addAll(value);
  List<Article> get getobj => this.obj;

  resetAllArticles() {
    this.obj.clear();
    update();
  }

  @override
  void onInit() {
    fetchAllEnglishNewsArticle("General");
    super.onInit();
  }

  fetchArticleFromAPIforCategory(String lable,
      {String category, String country, String source}) async {
    if (await isOffline()) {
      var offlineData = box.read(lable);
      resetAllArticles();
      obj = List<Article>.from(
          offlineData.map((x) => Article.fromJson(x, lable)));
      update();
    } else {
      List<Article> articles = await serviceCaller.fetchNewsList(lable,
          category: category, country: country, source: source);
      if (articles.isNotEmpty) {
        resetAllArticles();
        obj = articles;
        box.write(lable, List<dynamic>.from(articles.map((x) => x.toJson())));
        update();
      }
    }
  }

  fetchAllEnglishNewsArticle([String lable]) async {
    if (await isOffline()) {
      var offlineData = box.read(lable);
      resetAllArticles();
      obj = List<Article>.from(
          offlineData.map((x) => Article.fromJson(x, lable)));
      update();
    } else {
      List<Article> articles =
          await serviceCaller.fetchEverythingNewsList(lable);
      if (articles.isNotEmpty) {
        resetAllArticles();
        obj = articles;
        box.write(lable, List<dynamic>.from(articles.map((x) => x.toJson())));
        update();
      }
    }
  }
}
