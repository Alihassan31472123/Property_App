import 'dart:convert';

import 'package:apni_property_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../configs/routes/routes_name.dart';
import '../../presentation/screens/detail/my_purchase_detail_screen.dart';
import '../../presentation/screens/detail/product_detail_screen.dart';
import '../models/response/product/products_list_response.dart';

class MyPurchaseDetailClass{

  // myPurchaseDetailService(context, token, producrID) async{
  //   var headers = {
  //     'Authorization': 'Bearer $token'
  //   };
  //   var dio = Dio();
  //   var response = await dio.request(
  //     'http://110.39.4.69:50051/api/Product/MyPurchaseViewDetail?VID=$producrID',
  //     options: Options(
  //       method: 'GET',
  //       headers: headers,
  //     ),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print("my details: ${json.encode(response.data)}");
  //     // AppConstants.getPurchaseDetailsData = response.data['data'];
  //     AppConstants.getPurchaseDetailsData = ProductData.fromJson(response.data['data']);
  //     print("ffffffffggggggg: ${AppConstants.getPurchaseDetailsData}");
  //
  //     Navigator.of(context).pushNamed(
  //       RouteNames.myPurchaseDetail,
  //       arguments: MyPurchaseDetailScreenArguments(data: AppConstants.getPurchaseDetailsData),
  //     );
  //   }
  //   else {
  //     print(response.statusMessage);
  //   }
  // }

  myPurchaseDetailService(token, producrID) async{
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Product/MyPurchaseViewDetail?VID=$producrID',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print("my details: ${json.encode(response.data)}");
      // AppConstants.getPurchaseDetailsData = response.data['data'];
      AppConstants.getPurchaseDetailsData = ProductData.fromJson(response.data['data']);
      print("ffffffffggggggg: ${AppConstants.getPurchaseDetailsData}");

    }
    else {
      print(response.statusMessage);
    }
  }
}