import 'dart:convert';
import 'package:foodi_go/data/models/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  // POST Request
  static Future<NetworkResponse> postRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    Uri uri = Uri.parse(url);

    try {
      Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isDone: true,
          responseData: data,
          errorMessage: null,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isDone: false,
          responseData: data,
          errorMessage: "Error: ${response.statusCode}",
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isDone: false,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  // GET Request
  static Future<NetworkResponse> getRequest(String url) async {
    Uri uri = Uri.parse(url);

    try {
      Response response = await get(uri);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isDone: true,
          responseData: data,
          errorMessage: null,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isDone: false,
          responseData: data,
          errorMessage: "Error: ${response.statusCode}",
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isDone: false,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }
}
