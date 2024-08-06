import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:apni_property_app/networking/api_service.dart';

import '../models/response/userprofile/Getsaleresponse.dart';


class SaleRepository {
  final ApiService _apiService;
  final String? token;
  final String? userId;

  SaleRepository(
      {required ApiService apiService,
      required this.token,
      required this.userId})
      : _apiService = apiService;

  Future<dynamic> getsale() async {
    var dataQuery = {"ClientId": userId.toString(), };
    return _apiService.getSingleData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.GET_SALES_LIST),
        requiresAuthToken: token,
        queryParams: dataQuery,
        converter: (response) => GetSaleResponse.fromJson(response));
  }
}
