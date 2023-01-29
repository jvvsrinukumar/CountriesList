

import 'package:dio/dio.dart';

class DioUtil {
  getWithOutHeaders(String url) async {
    return await Dio().get(url);
  }

  getWithHeaders(String url) async {
    return await Dio().get(url,queryParameters: getHeaders());
  }
}

getHeaders() {
  var headers = {};
  return headers;
}