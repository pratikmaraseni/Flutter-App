import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';

class EditProfileController extends GetxController {
  final key = GlobalKey<FormBuilderState>();
  final ProfileController profileController = Get.find<ProfileController>();
}
