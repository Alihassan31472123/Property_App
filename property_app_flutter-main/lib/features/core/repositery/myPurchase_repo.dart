import 'dart:convert';

import 'package:apni_property_app/utils/constants.dart';
import 'package:dio/dio.dart';

import '../models/response/product/products_list_response.dart';

class MyPurchaseClass{

  myPurchaseService(token, clientID) async{
    isLoadingData = true;
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Product/GetPurchases?clientId=$clientID',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print('my purchase: ${json.encode(response.data['data'])}');
      List<ProductData> myPurchaseDataList = (response.data['data'] as List)
          .map((item) => ProductData.fromJson(item))
          .toList();
      AppConstants.getMyPurchaseData = myPurchaseDataList;
      // print("ddddddddddd: ${AppConstants.getMyPurchaseData.data![0].location}");
      isLoadingData = false;
    }
    else {
      print(response.statusMessage);
      isLoadingData = false;
    }
  }
}