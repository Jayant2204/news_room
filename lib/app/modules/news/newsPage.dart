import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:news_room/app/modules/news/newsController.dart';
import 'package:news_room/app/modules/news/widget/newsCard.dart';

class NewsShowCaseScreen extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar for Title and drawer Navigation.
      appBar: AppBar(
        title: Text("My Feed"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _newsController.fetchArticleFromAPI())
        ],
      ),
      //Share Button using FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Text("Share"),
        icon: Icon(CupertinoIcons.share_up),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Container(
          child: Swiper(
        itemCount: _newsController.obj.length,
        itemBuilder: (context, index) {
          return NewsCardWidget(article: _newsController.obj[index]);
        },
      )),
    );
  }
}
