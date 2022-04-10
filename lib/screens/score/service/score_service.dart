import 'package:japan_project/services/base_service.dart';

import '../model/matches.dart';

class ScoreService extends BaseService {
  Future<dynamic> getAllMatches(Map<String, dynamic> data) async {
    try {
      final response = await request(
          url: "/adm/getallmatch/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return matchesFromJson(response.body);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
