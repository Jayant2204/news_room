import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_room/app/data/model/newsList.dart';
import 'package:news_room/app/utils/isOfflineCheck.dart';

import 'service/newsServiceCaller.dart';

class NewsController extends GetxController {
  final NewsApiProvider serviceCaller = NewsApiProvider();
  final GetStorage box = GetStorage();

  List<Article> obj = List<Article>().obs;
  StreamSubscription<ConnectivityResult> subscription;

  set setobj(value) => this.obj.addAll(value);
  List<Article> get getobj => this.obj;

  resetAllArticles() {
    this.obj.clear();
    update();
  }

  @override
  void onInit() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        Get.snackbar("Connection Lost", "Oops! looks like you are offline",
            backgroundColor: Colors.red);
      } else {
        Get.snackbar(
            "Connection established", "Hoorey! you are back online now",
            backgroundColor: Colors.green);
      }
    });
    fetchAllEnglishNewsArticle("General");

    super.onInit();
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
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
