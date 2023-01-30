import 'dart:convert';

import 'package:countrylist/entites/countries_list_entity.dart';

import 'package:countrylist/utlis/constants.dart';
import 'package:countrylist/utlis/dio_utils.dart';
import 'package:dio/dio.dart';

class ListRepository {
  static String baseUrl = Constants.baseUrl;
  static DioUtil dioUtil = DioUtil();

  Future<List<CountriesList>?> getList() async {
    try {
      Response response =
          await dioUtil.getWithOutHeaders("$baseUrl${Constants.countriesList}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<CountriesList>? data = List<CountriesList>.from(
            json.decode(response.data).map((x) => CountriesList.fromJson(x)));
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
