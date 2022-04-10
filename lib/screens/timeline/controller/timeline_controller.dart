import 'package:get/get.dart';

import '../../../utils/auth.dart';
import '../../../utils/service_locator.dart';
import '../model/timeline.dart';
import '../service/timeline_service.dart';

class TimelineController extends GetxController {
  final TimelineService _timelineService = serviceLocator<TimelineService>();
  final RxList<Timeline> timelines = <Timeline>[].obs;

  getAllTimelines({required Map<String, dynamic> data}) async {
    final _timelines = await _timelineService.getTimelines(data);
    if (_timelines != null) {
      timelines.value = _timelines.timelines;
    }
  }

  likeTimeline({required Map<String, dynamic> data}) async {
    await _timelineService
        .likeTimeline({'sessionId': Auth.sessionId, '': ''}).then((value) {});
  }

  createTimeLine({required Map<String, dynamic> data}) async {
    await _timelineService.createTimeline(data).then((value) {
      if (value != null) {
        Get.back();
      }
    });
  }
}
