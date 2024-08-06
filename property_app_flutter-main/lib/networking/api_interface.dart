import 'package:apni_property_app/helper/typedefs.dart';
import 'package:dio/dio.dart';

abstract class ApiInterface {
  const ApiInterface();

  Future<List<T>> getListData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON responseBody) converter,
  });

  Future<T> getSingleData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON responseBody) converter,
  });

  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON response) converter,
  });

  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON response) converter,
  });

  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    CancelToken? cancelToken,
    String? requiresAuthToken,
    required T Function(JSON response) converter,
  });

  void cancelRequests({CancelToken? cancelToken});

  Future getCurrency({required String token});
  Future getCities({required String token});
  Future getStates({required String token});
  Future getCountries({required String token});
}
