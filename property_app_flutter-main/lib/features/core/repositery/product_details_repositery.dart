import 'package:apni_property_app/features/core/models/response/product/product_details.dart';
import 'package:apni_property_app/features/core/models/response/product/product_images_response.dart';
import 'package:apni_property_app/features/core/models/response/product/wallet_details_response.dart';
import 'package:apni_property_app/helper/typedefs.dart';
import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:apni_property_app/networking/api_service.dart';

class ProductDetailsRepository {
  final ApiService _apiService;
  final String? token;
  final String? userId;

  ProductDetailsRepository(
      {required ApiService apiService,
      required this.token,
      required this.userId})
      : _apiService = apiService;

  Future<dynamic> productDetails(JSON dataQuery) async {
    return _apiService.getSingleData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.PRODUCT_DETAILS),
        requiresAuthToken: token,
        queryParams: dataQuery,
        converter: (response) => ProductDetails.fromJson(response));
  }

  Future<dynamic> getProductImages(JSON dataQuery) async {
    return _apiService.getSingleData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.PRODUCTS_IMAGES),
        requiresAuthToken: token,
        queryParams: dataQuery,
        converter: (response) => ProductImagesResponse.fromJson(response));
  }

  Future<dynamic> getWalletDetails(String currencyId) async {
    var dataQuery = {"ClientId": userId.toString(), "CurrencyId": currencyId};
    return _apiService.getSingleData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.GET_WALLET_DETAILS),
        requiresAuthToken: token,
        queryParams: dataQuery,
        converter: (response) => WalletDetailsResponse.fromJson(response));
  }
}
