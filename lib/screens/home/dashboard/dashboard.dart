import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/background.dart';
import '../../profile/edit_profile/edit_profile_screen.dart';
import '../../profile/profile_card/profile_card.dart';
import '../dashboard_menu/dashboard_menu.dart';
import '../inapp_notification/inapp_notification.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundScreen(
              rainbow: true,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => EditProfileScreen());
                      },
                      child: ProfileCard(),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    DashboardMenu(),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const InappNotification(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
