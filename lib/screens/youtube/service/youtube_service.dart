import '../../../services/base_service.dart';
import '../model/youtube_video.dart';

class YoutubeService extends BaseService {
  Future<dynamic> getAllVideos(Map<String, dynamic> data) async {
    try {
      final response = await request(
          url: "/adm/getallvideo/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return youtubeVideoFromJson(response.body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
