import 'package:apni_property_app/features/core/models/response/product/product_details.dart';
import 'package:apni_property_app/features/core/models/response/product/product_images_response.dart';
import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:apni_property_app/features/core/models/response/product/wallet_details_response.dart';
import 'package:apni_property_app/features/core/repositery/product_details_repositery.dart';
import 'package:apni_property_app/helper/logging.dart';
import 'package:apni_property_app/helper/typedefs.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/networking/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  factory ProductDetailState({
    ApiResponse<ProductDetails>? productDetailsResponse,
    ApiResponse<ProductImagesResponse>? productImagesResponse,
    ApiResponse<WalletDetailsResponse>? walletDetailResponse,
    @Default('0') String calculateCommission,
    @Default('0') String totalPrice,
    @Default('0') String remainingBalance,
  }) = _ProductDetailState;
}

class ProductDetailStateProvider extends StateNotifier<ProductDetailState> {
  final ProductDetailsRepository _productDetailsRepository;
  final ProductData? data;

  ProductDetailStateProvider(
      {required ProductDetailsRepository productDetailsRepository,
      required this.data})
      : _productDetailsRepository = productDetailsRepository,
        super(ProductDetailState(
          productDetailsResponse: ApiResponse.idle(),
          productImagesResponse: ApiResponse.idle(),
          walletDetailResponse: ApiResponse.idle(),
        )) {
    if (data != null) {
      getProductDetails(
          {"PrimaryID": data!.primaryID, "Producttype": data!.productType},
          (String id) {
        getWalletDetails(id);
      });
      getProductImages({"PrimaryID": data!.primaryID,  "Producttype": data!.productType});
    }
  }

  Future<void> getProductDetails(
      JSON productQuery, Function(String id) callback) async {
    try {
      state = state.copyWith(productDetailsResponse: ApiResponse.loading());
      final response =
          await _productDetailsRepository.productDetails(productQuery);
      state = state.copyWith(
        productDetailsResponse: ApiResponse.completed(response),
      );
      callback((response as ProductDetails).data!.currencyID.toString());
    } on NetworkException catch (e) {
      state = state.copyWith(
        productDetailsResponse: ApiResponse.error(e.toString()),
      );
    } on Exception catch (e) {
      {
        Log.fine(e.toString());
        state = state.copyWith(
          productDetailsResponse: ApiResponse.error(e.toString()),
        );
      }
    }
  }

  Future<void> getProductImages(JSON productQuery) async {
    try {
      state = state.copyWith(productImagesResponse: ApiResponse.loading());
      final response =
          await _productDetailsRepository.getProductImages(productQuery);
      state = state.copyWith(
        productImagesResponse: ApiResponse.completed(response),
      );
    } on NetworkException catch (e) {
      state = state.copyWith(
        productImagesResponse: ApiResponse.error(e.toString()),
      );
    } on Exception catch (e) {
      {
        Log.fine(e.toString());
        state = state.copyWith(
          productImagesResponse: ApiResponse.error(e.toString()),
        );
      }
    }
  }

  Future<void> getWalletDetails(String currencyId) async {
    try {
      state = state.copyWith(walletDetailResponse: ApiResponse.loading());
      final response =
          await _productDetailsRepository.getWalletDetails(currencyId);
      state = state.copyWith(
        walletDetailResponse: ApiResponse.completed(response),
      );
    } on NetworkException catch (e) {
      state = state.copyWith(
        walletDetailResponse: ApiResponse.error(e.toString()),
      );
    } on Exception catch (e) {
      {
        Log.fine(e.toString());
        state = state.copyWith(
          walletDetailResponse: ApiResponse.error(e.toString()),
        );
      }
    }
  }

 calculateValues(ProductDetails productDetails, double sqFtEntered) {
  double unitPrice = double.tryParse(productDetails.data!.unitPrice.toString()) ?? 0.0;
  double commissionRate = double.tryParse(productDetails.data!.commissionRate.toString()) ?? 0.0;

  // Calculate remaining balance
  double calculateBalance = (productDetails.data!.price ?? 0.0) - (unitPrice * sqFtEntered);
  state = state.copyWith(remainingBalance: calculateBalance.toStringAsFixed(2));

  // Calculate commission
  double calculateCommission = (unitPrice * sqFtEntered) * (commissionRate / 100);
  state = state.copyWith(calculateCommission: calculateCommission.toStringAsFixed(2));

  // Calculate total price including commission
  double totalPrice = (unitPrice * sqFtEntered) + calculateCommission;
  state = state.copyWith(totalPrice: totalPrice.toStringAsFixed(2));

  
}
}
