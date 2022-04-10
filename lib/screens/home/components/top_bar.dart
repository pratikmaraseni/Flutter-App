import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class TopBar extends StatelessWidget {
  TopBar({Key? key, required this.title}) : super(key: key);
  final String title;
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: TextButton.icon(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
        onPressed: () {
          _homeController.selectedWidget.value = 0;
        },
        icon: const Icon(Icons.arrow_back),
        label: Text(title),
      ),
    );
  }
}
