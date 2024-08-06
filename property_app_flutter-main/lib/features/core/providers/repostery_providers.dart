import 'package:apni_property_app/configs/shared_prefrence_keys.dart';
import 'package:apni_property_app/features/core/providers/providers.dart';
import 'package:apni_property_app/features/core/repositery/auth_repository.dart';
import 'package:apni_property_app/features/core/repositery/product_details_repositery.dart';
import 'package:apni_property_app/features/core/repositery/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositery/profile_repositry.dart';
import '../repositery/sale_repo.dart';

///REPOSITORY PROVIDER

final authRepository = Provider<AuthRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return AuthRepository(apiService: apiService);
});

final homeRepository = Provider<HomeRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  String? token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  return HomeRepository(apiService: apiService,token: token);
});

final productDetailsRepository = Provider<ProductDetailsRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  String? token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  String? userId = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);
  return ProductDetailsRepository(apiService: apiService,token: token,userId:userId);
});

final profileRepository = Provider<ProfileRepository>((ref) {
  
  final apiService = ref.read(apiServiceProvider);
  String? token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  String? userId = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);
  return ProfileRepository(apiService: apiService,token: token,userId:userId);
});

final withdrawRepository = Provider<ProductDetailsRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  String? token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  String? userId = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);
  return ProductDetailsRepository(apiService: apiService,token: token,userId:userId);
});

final saleRepository = Provider<SaleRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  String? token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  String? userId = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);
  return SaleRepository(apiService: apiService,token: token,userId:userId);
});

