import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/features/core/providers/providers.dart';
import 'package:apni_property_app/features/core/providers/repostery_providers.dart';
import 'package:apni_property_app/features/core/repositery/getCountryCode_repository.dart';
import 'package:apni_property_app/features/core/repositery/mySaleList_repo.dart';
import 'package:apni_property_app/features/core/repositery/myWallet_repo.dart';
import 'package:apni_property_app/features/core/repositery/my_purchase_details.dart';
import 'package:apni_property_app/features/core/states/auth_state/auth_state.dart';
import 'package:apni_property_app/features/core/states/detail_state/product_detail_state.dart';
import 'package:apni_property_app/features/core/states/home_state/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../configs/shared_prefrence_keys.dart';
import '../repositery/myPurchase_repo.dart';
import '../repositery/notification_by_client_id_repository.dart';
import '../states/home_state/sale_state.dart';
import '../states/profile_state.dart';

///State NOTIFICATION PROVIDER

final myPurchaseFutureProvider = FutureProvider.autoDispose<void>((ref) async {
  final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  await MyPurchaseClass().myPurchaseService(token!, userID!);
});



final myWalletFutureProvider = FutureProvider.autoDispose<void>((ref) async {
  final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  await MyWalletClass().getWalletApiService(token, userID);
});

final mySaleFutureProvider = FutureProvider.autoDispose<void>((ref) async {
  final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  await MySaleClass().mySaleListService(token, userID);
});

final myPurchaseDetailsProvider = FutureProvider.autoDispose.family<void, num>((ref, porderID) async {
  final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);

  // Now you can use userID which is passed as a parameter
  await MyPurchaseDetailClass().myPurchaseDetailService(token, porderID);
});

final myNoficationByCClientID = FutureProvider.autoDispose<void>((ref) async {
  final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  await NotificationClientID().notificationByClientID(token, userID);
});

final myCountryCode = FutureProvider.autoDispose<void>((ref) async {
  // final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  // final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  await GetCountryCode().GetCountryCodeList();
});

final myGetPrivacy = FutureProvider.autoDispose<void>((ref) async {
  // final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  // final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  await GetCountryCode().GetPrivacyPolicy();
});

final myStateCode = FutureProvider.autoDispose.family<void, num>((ref, countryID) async {
  // final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);

  // Now you can use userID which is passed as a parameter
  await GetCountryCode().GetStateList(countryID);
});

final myCountryList = FutureProvider.autoDispose<void>((ref) async {
  // final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  // final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  await GetCountryCode().GetCountryList();
});

final myCityList = FutureProvider.autoDispose.family<void, num>((ref, StateID) async {
  // final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);

  // Now you can use userID which is passed as a parameter
  await GetCountryCode().GetCityList(StateID);
});


final myNoficationByNotID = FutureProvider.autoDispose.family<void, num>((ref, NID) async {
  final token = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.token);
  final userID = ref.read(sharedUtilityProvider).getString(SharedPreferenceKeys.userId);

  // Now you can use userID which is passed as a parameter
  await NotificationClientID().GetyNotificationByNID(token, NID, userID);
});



final authStateProvider =
StateNotifierProvider.autoDispose<AuthStateNotifier, AuthState>((ref) {
  final authRepo = ref.read(authRepository);
  return AuthStateNotifier(authRepository: authRepo);
});

final homeStateProvider =
StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>((ref) {
  final homeRepo = ref.read(homeRepository);
  return HomeStateNotifier(homeRepository: homeRepo);
});

final detailStateProvider =
StateNotifierProvider.autoDispose.family<ProductDetailStateProvider,ProductDetailState,ProductData>((ref,data) {
  final productRepo = ref.read(productDetailsRepository);
  return ProductDetailStateProvider(productDetailsRepository: productRepo,data: data);
});

final profileStateProvider =
StateNotifierProvider.autoDispose<ProfileStateNotifier, ProfileState>((ref) {
  final profileRepo = ref.read(profileRepository);
  return ProfileStateNotifier(profileRepository: profileRepo);
});

final saleStateProvider =
StateNotifierProvider.autoDispose<SaleStateNotifier, SaleState>((ref) {
  final saleRepo = ref.read(saleRepository);
  return SaleStateNotifier(saleRepository: saleRepo);
});
