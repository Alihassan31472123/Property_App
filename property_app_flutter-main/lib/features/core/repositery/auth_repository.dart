import 'package:apni_property_app/features/core/models/response/auth/forget_password_response.dart';
import 'package:apni_property_app/features/core/models/response/auth/login_response.dart';
import 'package:apni_property_app/features/core/models/response/auth/register_response.dart';
import 'package:apni_property_app/helper/typedefs.dart';
import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:apni_property_app/networking/api_service.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository({required ApiService apiService}) : _apiService = apiService;

  Future<dynamic> loginUser(JSON json) async {
    return _apiService.setData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.LOGIN),
        data: json,
        converter: (response) => LoginResponse.fromJson(response));
  }

  Future<dynamic> registerUser(JSON json) async {
    return _apiService.setData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.REGISTER),
        data: json,
        converter: (response) => RegisterResponse.fromJson(response));
  }

  Future<dynamic> forgetPassword(JSON json) async {
    return _apiService.setData(
        endpoint: ApiEndpoint.basic(ENDPOINTS.FORGET_PASSWORD),
        data: {},
        queryParams: json,
        converter: (response) => ForgetPasswordResponse.fromJson(response));
  }
}
