import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_room/app/data/provider/constants.dart';
import 'package:news_room/app/modules/Drawer/DrawerController.dart';
import 'package:news_room/app/modules/Drawer/drawerItems.dart';
import 'package:news_room/app/theme/color.dart';

class HomeDrawer extends StatefulWidget {
  HomeDrawer({Key key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final HamController hamController = Get.find();

  onDrawerTileTap(int index) async {
    //Updates the value of index
    hamController.setIndex(index);

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Top header of Drawer
            InkWell(
              onTap: () => Get.back(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.apps,
                        color: Colors.white,
                      ),
                    ),
                    Text("Discover"),
                  ],
                ),
              ),
            ),

            // My feed button (Navigation to my Feed)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.subTitleTextColor),
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.phone_android,
                      color: Colors.cyan,
                    ),
                    SizedBox(height: 4),
                    Text("My Feed"),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Text(
                  "Topics",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 3,
                width: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(colors: [
                      AppColor.titleTextColor,
                      AppColor.subTitleTextColor,
                      Colors.transparent
                    ])),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DrawerItemsWidget(
              isSelected: hamController.obj == 0,
              icon: Icons.book,
              lable: Constant.allNews,
              onTap: () => onDrawerTileTap(0),
            ),
            DrawerItemsWidget(
              isSelected: hamController.obj == 1,
              icon: Icons.group_work,
              lable: Constant.worldNews,
              onTap: () => onDrawerTileTap(1),
            ),
            DrawerItemsWidget(
              isSelected: hamController.obj == 2,
              icon: Icons.flag,
              lable: Constant.indiaNews,
              onTap: () => onDrawerTileTap(2),
            ),
            DrawerItemsWidget(
              isSelected: hamController.obj == 3,
              icon: Icons.vpn_lock,
              lable: Constant.sportsNews,
              onTap: () => onDrawerTileTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
