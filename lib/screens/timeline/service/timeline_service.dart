import '../../../services/base_service.dart';
import '../model/timeline.dart';

class TimelineService extends BaseService {
  Future<dynamic> getTimelines(Map<String, dynamic> data) async {
    try {
      final response = await request(
          url: "/adm/getalltimeline/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return timelinesFromJson(response.body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<dynamic> likeTimeline(Map<String, dynamic> data) async {
    try {
      final response = await request(
          url: "/adm/timelinelike/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // return likesFromJson(response.body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<dynamic> createTimeline(Map<String, dynamic> data) async {
    try {
      final response = await request(
          url: "/adm/createtimeline/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
