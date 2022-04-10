import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/auth.dart';
import '../../../../utils/service_locator.dart';
import '../../../auth/service/auth_service.dart';
import '../../../home/home_screen.dart';
import '../../../profile/controller/profile_controller.dart';

class LoginController extends GetxController {
  final _authService = serviceLocator<AuthService>();
  final _profileController = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();
  String mail = '';
  String password = '';

  login() {
    FormState? state = formKey.currentState;
    if (state != null) {
      if (state.validate()) {
        state.save();
        print('Validated');
        _authService
            .login(data: {'mail': mail, 'password': password}).then((value) {
          if (value != null) {
            if (value['error'] != null) {
              if (value['error'] == 'password_error') {
                Get.snackbar(
                  'Incorrect password',
                  'Login failed',
                  colorText: Colors.black,
                  backgroundColor: Colors.white,
                );
              } else if (value['error'] == 'user_doesnot_exists') {
                Get.snackbar(
                  'No user found with this email',
                  'Login failed',
                  colorText: Colors.black,
                  backgroundColor: Colors.white,
                );
              } else {
                Get.snackbar(
                  'Login failed',
                  value['error'],
                  colorText: Colors.black,
                  backgroundColor: Colors.white,
                );
              }
            }
            if (value['response'] != null) {
              print('Login successful');
              Auth.setSessionId(value['response']['sessionId']);
              Auth.setUserId(value['response']['user_id']);
              _profileController.getProfile().then(
                (value) {
                  if (value) {
                    Get.offAll(() => HomeScreen());
                  }
                },
              );
            }
          } else {
            Get.snackbar(
              'Login failed',
              'No response from Nice Server',
              colorText: Colors.black,
              backgroundColor: Colors.white,
            );
          }
        });
      } else {
        print('Not validated');
      }
    } else {
      print('Form key is null');
    }
  }
}
