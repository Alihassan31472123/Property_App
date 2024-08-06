// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static final String baseUrl = dotenv.get('BASE_URL');

  static String basic(ENDPOINTS endpoint) {
    switch (endpoint) {
      case ENDPOINTS.LOGIN:
        return '$baseUrl/api/LoginApi/Login';
      case ENDPOINTS.REGISTER:
        return '$baseUrl/api/LoginApi/Register';
      case ENDPOINTS.FORGET_PASSWORD:
        return '$baseUrl/api/LoginApi/Forget';
      case ENDPOINTS.DASHBOARD:
        return '$baseUrl/api/Product/Dashboard';
      case ENDPOINTS.PRODUCT_DETAILS:
        return '$baseUrl/api/Product/ProductDetails';
      case ENDPOINTS.PRODUCTS_IMAGES:
        return '$baseUrl/api/Product/getImagesForProduct';
      case ENDPOINTS.GET_PROFILE:
        return '$baseUrl/api/ClientAPI/ViewClientProfile';
      case ENDPOINTS.EDIT_PROFILE:
        return '$baseUrl/api/ClientAPI/EditClientProfile';
      case ENDPOINTS.GET_CURRENCY:
        return '$baseUrl/api/Setting/GetCurrency';
        case ENDPOINTS.GET_SALES_LIST:
        return '$baseUrl/api/Product/MySales';
         case ENDPOINTS.GET_SALES_LIST:
        return '$baseUrl/api/Product/MySales';
      case ENDPOINTS.ADD_PURCHASE_ORDER:
        return '$baseUrl/api/Product/AddPurchaseOrder';
        
      case ENDPOINTS.GET_WALLET_DETAILS:
        return '$baseUrl/api/Product/getClientBalancebyCurrency';
      default:
        throw Exception('Invalid endpoint');
    }
  }
}

enum ENDPOINTS {
  LOGIN,
  REGISTER,
  FORGET_PASSWORD,
  DASHBOARD,
  PRODUCT_DETAILS,
  PRODUCTS_IMAGES,
  GET_WALLET_DETAILS,
  GET_PROFILE,
  EDIT_PROFILE,
  GET_CURRENCY,
  GET_SALES_LIST,
  ADD_PURCHASE_ORDER
  
}
