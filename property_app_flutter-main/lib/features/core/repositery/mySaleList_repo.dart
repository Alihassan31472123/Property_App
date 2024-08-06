import 'dart:convert';

import 'package:apni_property_app/utils/constants.dart';
import 'package:dio/dio.dart';

class MySaleClass{

  mySaleListService(token, clientID) async{
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Product/MySales?ClientId=$clientID',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      AppConstants.getMySaleData = response.data['data'];
    }
    else {
      print(response.statusMessage);
    }
  }
}