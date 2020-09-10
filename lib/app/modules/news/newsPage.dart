import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:news_room/app/modules/news/newsController.dart';
import 'package:news_room/app/modules/news/widget/newsCard.dart';
import 'package:news_room/app/utils/shareFunction.dart';
import 'package:screenshot/screenshot.dart';

class NewsShowCaseScreen extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());
  final ScreenshotController controller = ScreenshotController();

  onShareNews(String message) async {
    File file = await controller.capture();
    shareFiles(
      filePath: file.path,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      // AppBar for Title and drawer Navigation.
      appBar: AppBar(
        title: Text("My Feed"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async =>
                  await _newsController.fetchArticleFromAPI())
        ],
      ),
      //Share Button using FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await onShareNews(_newsController.obj[index].title);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        label: Text("Share"),
        icon: Icon(CupertinoIcons.share),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),

          //For showing Card swipe View using Swiper widget with custom swiper
          //and multiple customization to match the design as close as possible.

          child: Swiper(
            itemCount: _newsController.obj.length,
            containerHeight: Get.context.height * 0.7,
            itemHeight: Get.context.height * 0.65,
            itemWidth: Get.context.width,
            scrollDirection: Axis.vertical,
            layout: SwiperLayout.CUSTOM,
            customLayoutOption: CustomLayoutOption(
              startIndex: 1,
              stateCount: 6,
            ).addScale([0.75, 0.8, 0.85, 0.9, 0.95, 1],
                Alignment.bottomCenter).addTranslate([
              new Offset(0, 0),
              new Offset(0, -20),
              new Offset(0, -40),
              new Offset(0, -60),
              new Offset(0, -80),
              new Offset(0, Get.context.height * 0.95),
            ]),
            onIndexChanged: (i) => index = i,
            itemBuilder: (context, index) {
              return NewsCardWidget(
                article: _newsController.obj[index],
                controller: controller,
              );
            },
          )),
    );
  }
}
