import 'package:get/get.dart';
import 'package:japan_project/screens/score/controller/score_controller.dart';

import '../../../utils/auth.dart';
import '../../auth/controller/auth_controller.dart';
import '../../event/controller/event_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/edit_profile/controller/edit_profile_controller.dart';
import '../../timeline/controller/timeline_controller.dart';
import '../../youtube/controller/youtube_controller.dart';

class HomeController extends GetxController {
  RxInt selectedWidget = 0.obs;

  final _youtubeController = Get.put(YoutubeController());
  final _profileController = Get.put(ProfileController());
  final _eventController = Get.put(EventController());
  final _authController = Get.put(AuthController());
  final _timelineController = Get.put(TimelineController());
  final _scoreController = Get.put(ScoreController());
  final _editProfileController = Get.put(EditProfileController());

  initControllers() {
    _youtubeController.getVideos(data: {'sessionId': Auth.sessionId});
    _profileController.getProfileLocally();
    _eventController.getEvents(data: {'sessionId': Auth.sessionId});
    _timelineController.getAllTimelines(data: {'sessionId': Auth.sessionId});
  }
}
