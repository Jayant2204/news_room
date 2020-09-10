import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_room/app/routes/router.dart';

// import 'app/modules/SplashScreen/splashScreen.dart';
import 'app/modules/news/newsPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: NewsShowCaseScreen(),
      getPages: Router.routes,
    );
  }
}
