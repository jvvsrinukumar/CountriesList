import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class HttpUtil {
  getWithHeaders(String url) async {
    return await get(Uri.parse(url), headers: getHeaders());
  }

  getWithoutHeaders(String url) async {
    return await get(Uri.parse(url));
  }

  postWithoutHeaders(String url) async {
    return await post(Uri.parse(url));
  }

  postWithHeaders(String url, String params) async {
    return await post(Uri.parse(url), headers: getHeaders(), body: params);
  }

  putWithHeaders(String url, String params) async {
    return await put(Uri.parse(url), headers: getHeaders(), body: params);
  }

  putWithOutHeaders(String url) async {
    return await put(Uri.parse(url), headers: getHeaders());
  }

  deleteWithHeaders(String url) async {
    return await delete(Uri.parse(url), headers: getHeaders());
  }

  patchWithHeaders(String url, String params) async {
    return await patch(Uri.parse(url), headers: getHeaders(), body: params);
  }

  String processError(Response result) {
    String message = "Somthing went wrong";
    var json = jsonDecode(result.body);
    log("error:$json");
    if (json['error'] != null) {
      var errorJson = json['error'];
      if (errorJson is! String && errorJson['message'] != null) {
        message = errorJson['message'];
      } else if (errorJson is String) {
        message = json['error'];
      } else if (json['error_description'] != null) {
        message = json["error_description"];
      }
    }
    return message;
  }
}

getHeaders() {
  var headers = {};
  return headers;
}
