import 'package:get/get.dart';

import '../../../utils/service_locator.dart';
import '../model/youtube_video.dart';
import '../service/youtube_service.dart';

class YoutubeController extends GetxController {
  final YoutubeService _youtubeService = serviceLocator<YoutubeService>();
  RxList<YoutubeVideo> youtubeVideos = <YoutubeVideo>[].obs;

  getVideos({required Map<String, dynamic> data}) async {
    final videos = await _youtubeService.getAllVideos(data);
    if (videos != null) {
      youtubeVideos.value = videos.videos;
    }
  }
}
