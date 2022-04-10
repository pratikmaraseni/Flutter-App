import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:japan_project/screens/auth/change_password/service/change_password_service.dart';

import '../../../../utils/service_locator.dart';
import '../change_password_screen.dart';

class ChangePasswordController extends GetxController {
  final _changePasswordService = serviceLocator<ChangePasswordService>();
  final fieldKey = GlobalKey<FormFieldState>();
  String mail = '';

  requestOtp() async {
    FormFieldState? fieldState = fieldKey.currentState;
    if (fieldState != null) {
      fieldState.save();
      if (fieldState.validate()) {
        await _changePasswordService
            .requestOtp(data: {'mail': mail}).then((value) {
          if (value != null) {
            if (value['status']) {
              if (value['data']['error'] != null) {
                Get.snackbar(
                  'Request otp failed',
                  value['data']['error'],
                  colorText: Colors.black,
                  backgroundColor: Colors.white,
                );
                return;
              }
              Get.to(() => ChangePasswordScreen(mail: mail));
            } else {
              Get.snackbar(
                'Request otp failed',
                value['data']['error'],
                colorText: Colors.black,
                backgroundColor: Colors.white,
              );
            }
          } else {
            Get.snackbar(
              'Request otp failed',
              'Please, try again',
              colorText: Colors.black,
              backgroundColor: Colors.white,
            );
          }
        });
      }
    }
  }

  changePassword({required Map<String, dynamic> data}) async {
    await _changePasswordService.changePassword(data: data).then((value) {
      if (value != null) {
        if (value['status']) {
          if (value['data']['error'] != null) {
            Get.snackbar(
              'Change password failed',
              value['data']['error'],
              colorText: Colors.black,
              backgroundColor: Colors.white,
            );
            return;
          }
          Get.back();
        } else {
          Get.snackbar(
            'Change password failed',
            value['data']['error'],
            colorText: Colors.black,
            backgroundColor: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Change password failed',
          'Please, try again',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
      }
    });
  }
}
