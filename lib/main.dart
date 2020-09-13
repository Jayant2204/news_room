import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_room/app/routes/router.dart';
import 'package:news_room/app/theme/theme.dart';
import 'app/modules/news/newsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: NewsShowCaseScreen(),
      getPages: Router.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
