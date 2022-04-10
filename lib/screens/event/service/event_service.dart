import '../../../services/base_service.dart';
import '../model/event.dart';

class EventService extends BaseService {
  Future<dynamic> getAllEvents(Map<String, dynamic> data) async {
    try {
      final response = await request(
          url: "/adm/getallevent/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return eventsFromJson(response.body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
