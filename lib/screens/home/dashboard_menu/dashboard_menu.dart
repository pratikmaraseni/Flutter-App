import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../timeline/timeline_screen.dart';
import '../controller/home_controller.dart';

class DashboardMenuItem {
  String name;
  String image;
  Function() callback;
  DashboardMenuItem(
      {required this.name, required this.image, required this.callback});
}

class DashboardMenu extends StatelessWidget {
  DashboardMenu({Key? key}) : super(key: key);
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    List<DashboardMenuItem> dashboardMenuItems = [
      DashboardMenuItem(
        name: "スケジュール",
        image: "assets/calender.svg",
        callback: () {
          _homeController.selectedWidget.value = 1;
        },
      ),
      DashboardMenuItem(
        name: "ショッピング",
        image: "assets/shopping.svg",
        callback: () {
          _homeController.selectedWidget.value = 2;
        },
      ),
      DashboardMenuItem(
        name: "LINE連携",
        image: "assets/line.svg",
        callback: () {},
      ),
      DashboardMenuItem(
        name: "動画ボックス",
        image: "assets/youtube.svg",
        callback: () {
          _homeController.selectedWidget.value = 3;
        },
      ),
      DashboardMenuItem(
        name: "掲示板",
        image: "assets/timeline.svg",
        callback: () {
          Get.to(() => TimelineScreen());
        },
      ),
      DashboardMenuItem(
        name: "試合結果",
        image: "assets/match.svg",
        callback: () {
          _homeController.selectedWidget.value = 4;
        },
      ),
    ];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
      itemCount: dashboardMenuItems.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Material(
            color: Colors.white,
            child: InkWell(
              highlightColor: Colors.grey.withOpacity(0.3),
              splashColor: Colors.blue.withOpacity(0.3),
              onTap: dashboardMenuItems.elementAt(index).callback,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    dashboardMenuItems.elementAt(index).image,
                  ),
                  Text(dashboardMenuItems.elementAt(index).name),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
