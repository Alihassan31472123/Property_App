import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:apni_property_app/networking/api_service.dart';

import '../models/response/auth/withdraw/withdraw_response.dart';

class OrderRepository {
  final ApiService _apiService;
  final String? token;
  final String? userId;

  OrderRepository(
      {required ApiService apiService,
      required this.token,
      required this.userId})
      : _apiService = apiService;

  Future<dynamic> getWithdrawtDetails(String currencyId) async {
    var dataQuery = {"ClientId": userId.toString(), "CurrencyId": currencyId};
    return _apiService.getSingleData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.GET_WALLET_DETAILS),
        requiresAuthToken: token,
        queryParams: dataQuery,
        converter: (response) => WithDrawResponse.fromJson(response));
  }
}
