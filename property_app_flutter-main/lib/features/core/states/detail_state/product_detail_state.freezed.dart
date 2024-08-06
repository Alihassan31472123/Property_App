// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDetailState {
  ApiResponse<ProductDetails>? get productDetailsResponse =>
      throw _privateConstructorUsedError;
  ApiResponse<ProductImagesResponse>? get productImagesResponse =>
      throw _privateConstructorUsedError;
  ApiResponse<WalletDetailsResponse>? get walletDetailResponse =>
      throw _privateConstructorUsedError;
  String get calculateCommission => throw _privateConstructorUsedError;
  String get totalPrice => throw _privateConstructorUsedError;
  String get remainingBalance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailStateCopyWith<ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
  @useResult
  $Res call(
      {ApiResponse<ProductDetails>? productDetailsResponse,
      ApiResponse<ProductImagesResponse>? productImagesResponse,
      ApiResponse<WalletDetailsResponse>? walletDetailResponse,
      String calculateCommission,
      String totalPrice,
      String remainingBalance});
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productDetailsResponse = freezed,
    Object? productImagesResponse = freezed,
    Object? walletDetailResponse = freezed,
    Object? calculateCommission = null,
    Object? totalPrice = null,
    Object? remainingBalance = null,
  }) {
    return _then(_value.copyWith(
      productDetailsResponse: freezed == productDetailsResponse
          ? _value.productDetailsResponse
          : productDetailsResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<ProductDetails>?,
      productImagesResponse: freezed == productImagesResponse
          ? _value.productImagesResponse
          : productImagesResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<ProductImagesResponse>?,
      walletDetailResponse: freezed == walletDetailResponse
          ? _value.walletDetailResponse
          : walletDetailResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<WalletDetailsResponse>?,
      calculateCommission: null == calculateCommission
          ? _value.calculateCommission
          : calculateCommission // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      remainingBalance: null == remainingBalance
          ? _value.remainingBalance
          : remainingBalance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDetailStateCopyWith<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  factory _$$_ProductDetailStateCopyWith(_$_ProductDetailState value,
          $Res Function(_$_ProductDetailState) then) =
      __$$_ProductDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiResponse<ProductDetails>? productDetailsResponse,
      ApiResponse<ProductImagesResponse>? productImagesResponse,
      ApiResponse<WalletDetailsResponse>? walletDetailResponse,
      String calculateCommission,
      String totalPrice,
      String remainingBalance});
}

/// @nodoc
class __$$_ProductDetailStateCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$_ProductDetailState>
    implements _$$_ProductDetailStateCopyWith<$Res> {
  __$$_ProductDetailStateCopyWithImpl(
      _$_ProductDetailState _value, $Res Function(_$_ProductDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productDetailsResponse = freezed,
    Object? productImagesResponse = freezed,
    Object? walletDetailResponse = freezed,
    Object? calculateCommission = null,
    Object? totalPrice = null,
    Object? remainingBalance = null,
  }) {
    return _then(_$_ProductDetailState(
      productDetailsResponse: freezed == productDetailsResponse
          ? _value.productDetailsResponse
          : productDetailsResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<ProductDetails>?,
      productImagesResponse: freezed == productImagesResponse
          ? _value.productImagesResponse
          : productImagesResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<ProductImagesResponse>?,
      walletDetailResponse: freezed == walletDetailResponse
          ? _value.walletDetailResponse
          : walletDetailResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<WalletDetailsResponse>?,
      calculateCommission: null == calculateCommission
          ? _value.calculateCommission
          : calculateCommission // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      remainingBalance: null == remainingBalance
          ? _value.remainingBalance
          : remainingBalance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductDetailState implements _ProductDetailState {
  _$_ProductDetailState(
      {this.productDetailsResponse,
      this.productImagesResponse,
      this.walletDetailResponse,
      this.calculateCommission = '0',
      this.totalPrice = '0',
      this.remainingBalance = '0'});

  @override
  final ApiResponse<ProductDetails>? productDetailsResponse;
  @override
  final ApiResponse<ProductImagesResponse>? productImagesResponse;
  @override
  final ApiResponse<WalletDetailsResponse>? walletDetailResponse;
  @override
  @JsonKey()
  final String calculateCommission;
  @override
  @JsonKey()
  final String totalPrice;
  @override
  @JsonKey()
  final String remainingBalance;

  @override
  String toString() {
    return 'ProductDetailState(productDetailsResponse: $productDetailsResponse, productImagesResponse: $productImagesResponse, walletDetailResponse: $walletDetailResponse, calculateCommission: $calculateCommission, totalPrice: $totalPrice, remainingBalance: $remainingBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailState &&
            (identical(other.productDetailsResponse, productDetailsResponse) ||
                other.productDetailsResponse == productDetailsResponse) &&
            (identical(other.productImagesResponse, productImagesResponse) ||
                other.productImagesResponse == productImagesResponse) &&
            (identical(other.walletDetailResponse, walletDetailResponse) ||
                other.walletDetailResponse == walletDetailResponse) &&
            (identical(other.calculateCommission, calculateCommission) ||
                other.calculateCommission == calculateCommission) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.remainingBalance, remainingBalance) ||
                other.remainingBalance == remainingBalance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productDetailsResponse,
      productImagesResponse,
      walletDetailResponse,
      calculateCommission,
      totalPrice,
      remainingBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDetailStateCopyWith<_$_ProductDetailState> get copyWith =>
      __$$_ProductDetailStateCopyWithImpl<_$_ProductDetailState>(
          this, _$identity);
}

abstract class _ProductDetailState implements ProductDetailState {
  factory _ProductDetailState(
      {final ApiResponse<ProductDetails>? productDetailsResponse,
      final ApiResponse<ProductImagesResponse>? productImagesResponse,
      final ApiResponse<WalletDetailsResponse>? walletDetailResponse,
      final String calculateCommission,
      final String totalPrice,
      final String remainingBalance}) = _$_ProductDetailState;

  @override
  ApiResponse<ProductDetails>? get productDetailsResponse;
  @override
  ApiResponse<ProductImagesResponse>? get productImagesResponse;
  @override
  ApiResponse<WalletDetailsResponse>? get walletDetailResponse;
  @override
  String get calculateCommission;
  @override
  String get totalPrice;
  @override
  String get remainingBalance;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDetailStateCopyWith<_$_ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
