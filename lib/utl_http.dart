import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpUtil {
  static String _token;

  JsonEncoder _encoder = JsonEncoder();
  JsonDecoder _decoder = JsonDecoder();

//  void checkToken() {
//    if (_token != null && _token.isNotEmpty) {
//    return;
//    }
//
//
//  }

  Future<Map> listSth() async {
    //var url = "https://gorest.co.in/public-api/users?_format=json&access-token=XZeM96ajScukUDtGlpVbvXtLWSVDQVBnS0BP";
    var url = "https://gorest.co.in/public-api/users?_format=json&access-token=yUIJtmmQTckRRos6GQpmc7MOOLEaPZA81z6i";
    print('call $url');
    var response = await http.get(url, headers: {"myHeader": "header"}).timeout(Duration(seconds: 10));

    print('status: ${response.statusCode}');
    print('response ${response.body}');

    return _decoder.convert(response.body);
  }
}
