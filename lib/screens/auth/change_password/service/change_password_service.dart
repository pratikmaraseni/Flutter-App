import 'package:japan_project/services/base_service.dart';

class ChangePasswordService extends BaseService {
  Future<dynamic> requestOtp({required Map<String, dynamic> data}) async {
    bool status = false;
    try {
      final response = await request(
          url: "/auth/sendotp/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        status = true;
      }
      return {"status": status, "data": getResponse(response)};
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> changePassword({required Map<String, dynamic> data}) async {
    bool status = false;
    try {
      final response = await request(
          url: "/auth/changepass/", method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        status = true;
      }
      return {"status": status, "data": getResponse(response)};
    } catch (e) {
      return null;
    }
  }
}
