import 'package:get/get.dart';
import 'package:news_room/app/data/provider/constants.dart';
import 'package:news_room/app/modules/news/newsController.dart';

class HamController extends GetxController {
  var index = 0.obs;

  final NewsController controller = Get.find<NewsController>();

  setIndex(value) {
    this.index.value = value;
    fetchAPIForIndex(value);
    update();
  }

  int get obj => this.index.value;

  fetchAPIForIndex([int value]) async {
    switch (value ?? this.index.value) {
      //All News --> headlines from Google News
      case 0:
        await controller.fetchAllEnglishNewsArticle("General");
        break;
      // World News -> category General
      case 1:
        await controller.fetchArticleFromAPIforCategory(Constant.worldNews,
            category: "general");
        break;
      // India News - > Set the country to  India
      case 2:
        await controller.fetchArticleFromAPIforCategory(Constant.indiaNews,
            country: "in");
        break;
      // Sports News -> Set the category to sports
      case 3:
        await controller.fetchArticleFromAPIforCategory(Constant.sportsNews,
            category: "sports");
        break;
      case 4:
        await controller.fetchArticleFromAPIforCategory(Constant.sportsNews,
            category: "technology");
        break;
      default:
        await controller.fetchArticleFromAPIforCategory("General");
    }
  }

  String getNewsLable() {
    switch (this.index.value) {
      case 0:
        return "General";
      case 1:
        return Constant.worldNews;
      case 2:
        return Constant.indiaNews;
      case 3:
        return Constant.sportsNews;
      default:
        return "General";
    }
  }
}
