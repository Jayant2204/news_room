import 'package:get/get.dart';
import 'package:news_room/app/modules/news/newsPage.dart';

class Router {
  Router._(param);

  static final routes = [
    GetPage(name: "/news", page: () => NewsShowCaseScreen()),
  ];
}
