import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apni_property_app/helper/shared_preference_service.dart';
import 'package:apni_property_app/networking/api_service.dart';
import 'package:apni_property_app/networking/dio_service.dart';
import 'package:apni_property_app/networking/interceptors/api_interceptor.dart';
import 'package:apni_property_app/networking/interceptors/logging_interceptor.dart';

import '../../../configs/shared_prefrence_keys.dart';

//dio providers
final _dioProvider = Provider<Dio>((ref) {
  final baseOptions = BaseOptions(
    baseUrl: '',
  );
  return Dio(baseOptions);
});

final _dioServiceProvider = Provider<DioService>((ref) {
  final dio = ref.watch(_dioProvider);
  return DioService(
    dioClient: dio,
    interceptors: [
      ApiInterceptor(),
      LoggingInterceptor(),
    ],
  );
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dioService = ref.watch(_dioServiceProvider);
  return ApiService(dioService);
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedPreferencesService>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(sharedPrefs);
});

final yourProvider = Provider((ref) => ProductDetailScreenArguments(ref));

class ProductDetailScreenArguments {
  ProductDetailScreenArguments(this.ref);
  final Ref ref;

  Future<void> addPurchaseOrder() async {
    final state = ref.read(sharedUtilityProvider);
    final apiToken = state.getString(SharedPreferenceKeys.token) ?? "";

    // Rest of your code
  }
}
