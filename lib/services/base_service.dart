import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum Requests {
  get,
  post,
  put,
  delete,
}

class BaseService {
  static const int _timeout = 15;
  static final client = http.Client();

  dynamic getResponse(http.Response response) {
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<http.Response> request(
      {required String url,
      required Requests method,
      required Map<String, dynamic> data}) async {
    Uri _url = Uri.parse('http://kichu-test1-backend1.herokuapp.com' + url);
    http.Response response;
    print('Request: $data');
    switch (method) {
      case Requests.get:
        response = await client
            .get(
          _url,
        )
            .timeout(const Duration(seconds: _timeout), onTimeout: () {
          throw TimeoutException('Connection timeout');
        });
        break;
      case Requests.post:
        response = await client
            .post(
          _url,
          body: data,
        )
            .timeout(const Duration(seconds: _timeout), onTimeout: () {
          throw TimeoutException('Connection timeout');
        });
        break;
      case Requests.put:
        response = await client
            .put(
          _url,
          body: json.encode(data),
        )
            .timeout(const Duration(seconds: _timeout), onTimeout: () {
          throw TimeoutException('Connection timeout');
        });
        break;
      case Requests.delete:
        response = await client
            .delete(
          _url,
        )
            .timeout(const Duration(seconds: _timeout), onTimeout: () {
          throw TimeoutException('Connection timeout');
        });
        break;
    }
    print('Response: ' + response.statusCode.toString() + ' ' + response.body);
    return response;
  }
}
