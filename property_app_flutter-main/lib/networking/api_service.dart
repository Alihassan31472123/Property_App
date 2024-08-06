import 'package:apni_property_app/helper/typedefs.dart';
import 'package:apni_property_app/networking/api_interface.dart';
import 'package:dio/dio.dart';

import 'dio_service.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;

  ApiService(
    DioService dioService,
  ) : _dioService = dioService;

  @override
  Future<List<T>> getListData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON responseBody) converter,
  }) async {
    final data = await _dioService.get(
      endpoint: endpoint,
      options: Options(headers: <String, Object?>{
        'Authorization': 'Bearer $requiresAuthToken',
      }),
      queryParams: queryParams,
      cancelToken: cancelToken,
    );
    return (data['data'] as List<Object?>).map((dataMap) => converter(dataMap as JSON)).toList();
  }

  @override
  Future<T> getSingleData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON responseBody) converter,
  }) async {
    final data = await _dioService.get(
      endpoint: endpoint,
      queryParams: queryParams,
      options: Options(headers: <String, Object?>{
        'Authorization': 'Bearer $requiresAuthToken',
      }),
      cancelToken: cancelToken,
    );
    return converter(data);
  }

  @override
  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    JSON? queryParams,
    String? requiresAuthToken,
    required T Function(JSON response) converter,
  }) async {
    var options = requiresAuthToken != null
        ? Options(headers: <String, Object?>{
            'Authorization': 'Bearer $requiresAuthToken',
          })
        : null;
    final dataMap = await _dioService.post(
      endpoint: endpoint,
      data: data,
      queryParams: queryParams,
      options: options,
      cancelToken: cancelToken,
    );
    return converter(dataMap);
  }

  @override
  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON response) converter,
  }) async {
    final dataMap = await _dioService.patch(
      endpoint: endpoint,
      data: data,
      options: Options(headers: <String, Object?>{
        'Authorization': 'Bearer $requiresAuthToken',
      }),
      cancelToken: cancelToken,
    );

    return converter(dataMap);
  }

  @override
  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON response) converter,
  }) async {
    final dataMap = await _dioService.delete(
      endpoint: endpoint,
      data: data,
      options: Options(headers: <String, Object?>{
        'Authorization': 'Bearer $requiresAuthToken',
      }),
      cancelToken: cancelToken,
    );

    return converter(dataMap);
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }

  @override
  Future getCurrency({required String token}) async {
    try {
      final data = await _dioService.get(
          endpoint: "http://110.39.4.69:50051/api/Setting/GetCurrency",
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }));

      return data;
    } catch (e) {
      print("Currency Error: $e");
      return null;
    }
  }

  @override
  Future getStates({required String token}) async {
    try {
      final data = await _dioService.get(
          endpoint: "http://110.39.4.69:50051/api/Setting/GetState",
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }));

      return data;
    } catch (e) {
      print("State Error: $e");
      return null;
    }
  }

  @override
  Future getCities({required String token}) async {
    try {
      final data = await _dioService.get(
          endpoint: "http://110.39.4.69:50051/api/Setting/GetCity",
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }));

      return data;
    } catch (e) {
      print("City Error: $e");
      return null;
    }
  }

  @override
  Future getCountries({required String token}) async {
    try {
      final data = await _dioService.get(
          endpoint: "http://110.39.4.69:50051/api/Setting/GetCountry",
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          }));

      return data;
    } catch (e) {
      print("Country Error: $e");
      return null;
    }
  }
}
