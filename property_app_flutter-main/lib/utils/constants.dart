import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/models/currency_model.dart';

class AppConstants {
  static List<UserDataModel> currencies = [];
  static List<UserDataModel> states = [];
  static List<UserDataModel> cities = [];
  static List<UserDataModel> countries = [];
  static List<ProductData> getMyPurchaseData = [];
  static List getMySaleData = [];
  static List getMyWalletData = [];
  static List getNoficationByClientID = [];
  static List getCountryCodeValue = [];
  static int getCountUnread = 0;
  static List getStateValue = [];
  static List getCountryValue = [];
  static List getCityValue = [];
  static List getAccountNoList = [];
  static dynamic getPrivacyPolicyAgree;
  static ProductData getPurchaseDetailsData = ProductData();
}

  bool isLoadingData = false;
  bool isLoadingDataNotifcation = false;
