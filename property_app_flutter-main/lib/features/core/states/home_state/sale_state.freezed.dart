// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SaleState {
  ApiResponse<GetSaleResponse> get response =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaleStateCopyWith<SaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleStateCopyWith<$Res> {
  factory $SaleStateCopyWith(SaleState value, $Res Function(SaleState) then) =
      _$SaleStateCopyWithImpl<$Res, SaleState>;
  @useResult
  $Res call({ApiResponse<GetSaleResponse> response});
}

/// @nodoc
class _$SaleStateCopyWithImpl<$Res, $Val extends SaleState>
    implements $SaleStateCopyWith<$Res> {
  _$SaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ApiResponse<GetSaleResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaleStateCopyWith<$Res> implements $SaleStateCopyWith<$Res> {
  factory _$$_SaleStateCopyWith(
          _$_SaleState value, $Res Function(_$_SaleState) then) =
      __$$_SaleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiResponse<GetSaleResponse> response});
}

/// @nodoc
class __$$_SaleStateCopyWithImpl<$Res>
    extends _$SaleStateCopyWithImpl<$Res, _$_SaleState>
    implements _$$_SaleStateCopyWith<$Res> {
  __$$_SaleStateCopyWithImpl(
      _$_SaleState _value, $Res Function(_$_SaleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$_SaleState(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ApiResponse<GetSaleResponse>,
    ));
  }
}

/// @nodoc

class _$_SaleState implements _SaleState {
  const _$_SaleState({required this.response});

  @override
  final ApiResponse<GetSaleResponse> response;

  @override
  String toString() {
    return 'SaleState(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaleState &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaleStateCopyWith<_$_SaleState> get copyWith =>
      __$$_SaleStateCopyWithImpl<_$_SaleState>(this, _$identity);
}

abstract class _SaleState implements SaleState {
  const factory _SaleState(
      {required final ApiResponse<GetSaleResponse> response}) = _$_SaleState;

  @override
  ApiResponse<GetSaleResponse> get response;
  @override
  @JsonKey(ignore: true)
  _$$_SaleStateCopyWith<_$_SaleState> get copyWith =>
      throw _privateConstructorUsedError;
}
