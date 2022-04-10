import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/controller/auth_controller.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _authController.logout();
              },
              child: const Text('ログアウト'),
            ),
          ),
        ],
      ),
    );
  }
}
