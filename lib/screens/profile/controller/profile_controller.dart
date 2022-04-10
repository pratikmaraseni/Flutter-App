import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:japan_project/screens/home/home_screen.dart';

import '../../../utils/auth.dart';
import '../../../utils/service_locator.dart';
import '../service/profile_service.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString description = ''.obs;
  final _profileService = serviceLocator<ProfileService>();

  getProfileLocally() {
    name.value = Auth.fullName;
    description.value = Auth.userId.toString() + ', ' + Auth.position;
  }

  Future<bool> getProfile() async => await _profileService
          .getProfile(data: {'sessionId': Auth.sessionId}).then(
        (value) {
          if (value != null) {
            if (value['error'] != null) {
              Get.snackbar(
                'Get profile',
                value['error'],
                colorText: Colors.black,
                backgroundColor: Colors.white,
              );
            } else {
              Auth.setUserId(value['id']);
              Auth.setPosition(value['pos']);
              Auth.setFullName(value['name']);
              Auth.setGroupName(value['group_name']);
              Auth.setGroupId(value['group_id']);
              return true;
            }
          } else {
            Get.snackbar(
              'Get profile',
              'Failed to get user profile',
              colorText: Colors.black,
              backgroundColor: Colors.white,
            );
          }
          return false;
        },
      );

  editProfile({required Map<String, dynamic> data, bool? captain}) async {
    await _profileService
        .editProfile(data: data, captain: captain)
        .then((value) {
      if (value != null) {
        if (value['status']) {
          if (value['data']['error'] != null) {
            Get.snackbar(
              'Edit profile failed',
              value['data']['error'],
              colorText: Colors.black,
              backgroundColor: Colors.white,
            );
            return;
          }
          Auth.setFullName(data['name']);
          name.value = Auth.fullName;
          Get.back();
        }
      } else {
        Get.snackbar(
          'Edit profile failed',
          'Failed to edit profile',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
      }
    });
  }
}
