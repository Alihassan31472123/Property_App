import 'package:apni_property_app/features/core/models/response/userprofile/user_profile_response.dart';
import 'package:apni_property_app/networking/api_endpoint.dart';
import 'package:apni_property_app/networking/api_service.dart';

class ProfileRepository {
  final ApiService _apiService;
  final String? token;
  final String? userId;

  ProfileRepository({required ApiService apiService, required this.token, required this.userId})
      : _apiService = apiService;

  Future<UserprofileResponse> getUserProfile() async {
    final Map<String, String> dataQuery = {
      'VID': userId.toString(),
    };

    return _apiService.getSingleData<UserprofileResponse>(
      endpoint: ApiEndpoint.basic(ENDPOINTS.GET_PROFILE),
      requiresAuthToken: token,
      queryParams: dataQuery,
      converter: (response) => UserprofileResponse.fromJson(response),
    );
  }

  Future<UserprofileResponse> updateUserProfile(Map<String, dynamic> data) async {
    return _apiService.setData<UserprofileResponse>(
      endpoint: ApiEndpoint.basic(ENDPOINTS.EDIT_PROFILE),
      requiresAuthToken: token,
      data: data,
      converter: (response) => UserprofileResponse.fromJson(response),
    );
  }
}
