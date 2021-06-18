import 'package:http/http.dart' as http;

class DataServices {
  static const end_point_auto_quiz_v1 = 'https://mocki.io/v1/270fdeff-e6c8-4fcc-ba8f-375cc932dcb9';

  static Future<http.Response> makeGetRequest({required url}) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }
}
