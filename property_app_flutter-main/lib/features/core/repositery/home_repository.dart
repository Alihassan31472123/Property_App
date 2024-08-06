import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:apni_property_app/networking/api_service.dart';
import 'package:apni_property_app/utils/constants.dart';

import '../../../models/currency_model.dart';

class HomeRepository {
  final ApiService _apiService;
  final String? token;

  HomeRepository({required ApiService apiService, required this.token}) : _apiService = apiService;

  Future<dynamic> getProductList() {
    _apiService.getCurrency(token: token!).then((currency) {
      if (currency['data'] == null) return;
      AppConstants.currencies = (currency['data'] as List).map((e) => UserDataModel.fromJson(e)).toList();
    });
    _apiService.getStates(token: token!).then((states) {
      if (states['data'] == null) return;
      AppConstants.states = (states['data'] as List).map((e) => UserDataModel.fromJson(e)).toList();
    });
    _apiService.getCities(token: token!).then((cities) {
      if (cities['data'] == null) return;
      AppConstants.cities = (cities['data'] as List).map((e) => UserDataModel.fromJson(e)).toList();
    });
    _apiService.getCountries(token: token!).then((countries) {
      if (countries['data'] == null) return;
      AppConstants.countries = (countries['data'] as List).map((e) => UserDataModel.fromJson(e)).toList();
    });
    return _apiService.getSingleData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.DASHBOARD),
        requiresAuthToken: token,
        converter: (response) => ProductListResponse.fromJson(response));
  }
}
