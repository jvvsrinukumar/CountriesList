import 'package:countrylist/utlis/constants.dart';
import 'package:countrylist/utlis/http_utlis.dart';
import 'package:http/http.dart';

class ListRepository {
  static HttpUtil httpUtil = HttpUtil();
  static String baseUrl = Constants.baseUrl;

  Future<dynamic>? getList() async {
    try {
      var url = "$baseUrl${Constants.countriesList}";
      //print(url);
      Response result = await httpUtil.getWithoutHeaders(url);
      if (result.statusCode == 200 || result.statusCode == 201) {
        return result.body;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
