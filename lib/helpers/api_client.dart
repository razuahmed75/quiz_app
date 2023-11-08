import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiClient{
    static Future<http.Response> get({required String ENDPOINT_URL}) async {
    var headers = {
      'Accept': 'application/json'
    };
    var request = http.Request('GET', Uri.parse(AppConstants.BASE_URL + ENDPOINT_URL));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    return responsedata;
  }
}