import 'dart:convert';
import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_dialogs.dart';
import '../../bottomNavigation.dart';

class MakeOrderRepository {

  makeOrder(context, String code, purchaseArea, token, userId, order_no, quantity_sqft, sale_tex, commission, price, currencyID, countryID, stateID, cityID, primaryID) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = json.encode({
      "code": code,
      "clientID": userId,
      "currencyID": currencyID,
      "walletID": 0,
      "purchasedArea": purchaseArea,
      "perUnitPrice": 0,
      "totalPrice": price,
      "primaryID": primaryID,
      "typeID": order_no,
      "profit": 0,
      "saleTax": sale_tex,
      "purchaseTax": 0,
      "commissionRate": commission,
      "countryId": countryID,
      "stateId": stateID,
      "cityId": cityID,
      "location": "string",
      "myMonthly_Rent": 0,
      "saleTaxPrice": 0,
      "commissionPrice": 0
    });
    var dio = Dio();
    var response = await dio.request(
      ApiEndpoint.basic(ENDPOINTS.ADD_PURCHASE_ORDER),
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      Navigator.of(context).pop();
      AppDialogs().showResponseDialog(
        context,
        "Success",
        "${response.data['message']}",
      );
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(
      //   content: Text(
      //     "Congratulations!Purchased Order Recived Successfully!",
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   behavior: SnackBarBehavior.floating,
      //   elevation: 0,
      //   duration: Duration(milliseconds: 1000),
      // ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyNavigationBarSection()),
      );
    }
    else {
      print(response.statusMessage);
    }
  }

  makeOrderSale(context, String code, purchaseArea, token, userId, order_no, quantity_sqft, sale_tex, commission, price, currencyID, countryID, stateID, cityID, primaryID) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var data = json.encode({
      "code": code,
      "clientID": userId,
      "currencyID": currencyID,
      "walletID": 0,
      "purchasedArea": purchaseArea,
      "perUnitPrice": 0,
      "totalPrice": price,
      "primaryID": primaryID,
      "typeID": order_no,
      "profit": 0,
      "saleTax": sale_tex,
      "purchaseTax": 0,
      "commissionRate": commission,
      "countryId": countryID,
      "stateId": stateID,
      "cityId": cityID,
      "location": "string",
      "myMonthly_Rent": 0,
      "saleTaxPrice": 0,
      "commissionPrice": 0
    });
    var dio = Dio();
    var response = await dio.request('http://110.39.4.69:50051/api/Product/MySaleAdd',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      Navigator.of(context).pop();
      AppDialogs().showResponseDialog(
        context,
        "Success",
        "${response.data['message']}",
      );
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(
      //   content: Text(
      //     "Congratulations!Purchased Order Recived Successfully!",
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   behavior: SnackBarBehavior.floating,
      //   elevation: 0,
      //   duration: Duration(milliseconds: 1000),
      // ));
    }
    else {
      print(response.statusMessage);
    }
  }

}