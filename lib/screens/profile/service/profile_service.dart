import '../../../services/base_service.dart';

class ProfileService extends BaseService {
  Future<dynamic> getProfile({required Map<String, String> data}) async {
    try {
      final response = await request(
          url: "/adm/getuser/", method: Requests.post, data: data);

      return getResponse(response);
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<dynamic> editProfile(
      {required Map<String, dynamic> data, bool? captain}) async {
    bool status = false;
    String _url = '/adm/editplayer/';
    if (captain != null) {
      if (captain) {
        _url = '/adm/editcaptain/';
      }
    }
    try {
      final response =
          await request(url: _url, method: Requests.post, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        status = true;
      }
      return {"status": status, "data": getResponse(response)};
    } catch (e) {
      return null;
    }
  }
}
