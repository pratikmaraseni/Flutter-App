import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../ecommerce/ecommerce.dart';
import '../event/events.dart';
import '../profile/profile.dart';
import '../score/score.dart';
import '../youtube/youtube.dart';
import 'controller/home_controller.dart';
import 'dashboard/dashboard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static final List<Widget> _widgets = [
    const Dashboard(),
    Events(),
    const Ecommerce(),
    Youtube(),
    Score(),
    Profile(),
  ];

  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    _homeController.initControllers();
    return WillPopScope(
      onWillPop: () async {
        switch (_homeController.selectedWidget.value) {
          case 0:
            return true;
        }
        _homeController.selectedWidget.value = 0;
        print('Back to home');
        return false;
      },
      child: Scaffold(
        body:
            Obx(() => _widgets.elementAt(_homeController.selectedWidget.value)),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/home_bw.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/calendar_bw.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/cart_bw.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/youtube_bw.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/match_bw.svg'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/user.svg'), label: ''),
          ],
          onTap: (index) {
            _homeController.selectedWidget.value = index;
          },
        ),
      ),
    );
  }
}
