import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:common_app_required/ApiService/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:common_app_required/utils/utils.dart';
enum RequestMethod {
  get,
  post,
  put,
  delete,
}

class ApiClient {
  ApiClient._();
  static final instance = ApiClient._();

  validResponse(http.Response res) {
    return res.statusCode == 200;
  }

  apiRequest<T>(
    String endPoint,
    RequestMethod method,
    T Function(Object json) fromJson, {
    String body = "",
    String token = '',
  }) async {
    http.Response resp;
    final Uri url = Uri.parse(ApiKey.baseUrl + endPoint);
    final Map<String, String> headers = {};
    headers.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');
    headers.putIfAbsent(HttpHeaders.acceptHeader, () => 'application/json');
    CommonUtils.instance.debugLog("url", "$url");
    // CommonUtils.instance.debugLog("resquest", "$body");
    if (token.isNotEmpty) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer $token');
    }
    try {
      switch (method) {
        case RequestMethod.get:
          resp = await http.get(
            url,
            headers: headers,
          );
          break;
        case RequestMethod.put:
          resp = await http.put(
            url,
            headers: headers,
            body: body,
          );
          break;
        case RequestMethod.post:
          resp = await http.post(
            url,
            headers: headers,
            body: body,
          );
          break;
        default:
          resp = await http.delete(
            url,
            headers: headers,
          );
          break;
      }

      CommonUtils.instance.debugLog(
          "response", "${resp.statusCode} - ${json.decode(resp.body)}");
      if (validResponse(resp)) {
        return fromJson(json.decode(resp.body));
      }
    } on TimeoutException catch (e) {
      CommonUtils.instance.debugLog("TimeoutException", e.message);
    } on SocketException catch (e) {
      CommonUtils.instance.debugLog("SocketException", e.message);
    } on Error catch (e) {
      CommonUtils.instance.debugLog("Error", e.stackTrace);
    }
  }

  objectToJsonEncoded(str){
    return jsonEncode(str);
  }

}
