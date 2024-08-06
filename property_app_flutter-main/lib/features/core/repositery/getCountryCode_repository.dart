import 'dart:convert';

import 'package:apni_property_app/utils/constants.dart';
import 'package:dio/dio.dart';

class GetCountryCode{
  GetCountryCodeList() async{
    // var headers = {
    //   'Authorization': 'Bearer $token'
    // };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Setting/GetCountryCode',
      options: Options(
        method: 'GET',
        // headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print("acha bhai country code: ${json.encode(response.data)}");
      AppConstants.getCountryCodeValue = response.data['data'];
    }
    else {
      print(response.statusMessage);
    }
  }

  GetStateList(countryID) async{
    // var headers = {
    //   'Authorization': 'Bearer $token'
    // };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Setting/GetState?CountryId=$countryID',
      options: Options(
        method: 'GET',
        // headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print("acha bhai country codefsdfds: ${json.encode(response.data)}");
      AppConstants.getStateValue = response.data['data'];
    }
    else {
      print(response.statusMessage);
    }
  }

  GetCountryList() async{
    // var headers = {
    //   'Authorization': 'Bearer $token'
    // };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Setting/GetCountry',
      options: Options(
        method: 'GET',
        // headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print("acha bhai country code: ${json.encode(response.data)}");
      AppConstants.getCountryValue = response.data['data'];

    }
    else {
      print(response.statusMessage);
    }
  }

  GetCityList(stateID) async{
    // var headers = {
    //   'Authorization': 'Bearer $token'
    // };
    var dio = Dio();
    var response = await dio.request(
      'http://110.39.4.69:50051/api/Setting/GetCity?stateId=$stateID',
      options: Options(
        method: 'GET',
        // headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      print("acha bhai country code: ${json.encode(response.data)}");
      AppConstants.getCityValue = response.data['data'];
    }
    else {
      print(response.statusMessage);
    }
  }

  GetPrivacyPolicy() async{
    // var headers = {
    //   'Authorization': 'Bearer $token'
    // };
    try{
      var dio = Dio();
      var response = await dio.request(
        'http://110.39.4.69:50051/api/LoginApi/GetAgreeConditionRegister',
        options: Options(
          method: 'POST',
          // headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        AppConstants.getPrivacyPolicyAgree = response.data['data'];
      }
      else {
        print(response.statusMessage);
      }
    }catch(e){
      print("error: $e");
    }
  }
}