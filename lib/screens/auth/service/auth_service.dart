import 'package:japan_project/services/base_service.dart';

class AuthService extends BaseService {
  Future<dynamic> login({required Map<String, dynamic> data}) async {
    try {
      final response =
          await request(url: '/auth/login/', method: Requests.post, data: data);
      if (response.statusCode == 200) {
        return getResponse(response);
      }
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> logout({required Map<String, dynamic> data}) async {
    try {
      final response = await request(
          url: '/auth/logout/', method: Requests.post, data: data);
      if (response.statusCode == 200) {
        return getResponse(response);
      }
    } catch (e) {
      return null;
    }
  }
}
