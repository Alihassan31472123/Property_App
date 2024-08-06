// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WithdrawState {
  ApiResponse<WithDrawResponse> get response =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WithdrawStateCopyWith<WithdrawState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawStateCopyWith<$Res> {
  factory $WithdrawStateCopyWith(
          WithdrawState value, $Res Function(WithdrawState) then) =
      _$WithdrawStateCopyWithImpl<$Res, WithdrawState>;
  @useResult
  $Res call({ApiResponse<WithDrawResponse> response});
}

/// @nodoc
class _$WithdrawStateCopyWithImpl<$Res, $Val extends WithdrawState>
    implements $WithdrawStateCopyWith<$Res> {
  _$WithdrawStateCopyWithImpl(this._value, this._then);

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
              as ApiResponse<WithDrawResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WithdrawStateCopyWith<$Res>
    implements $WithdrawStateCopyWith<$Res> {
  factory _$$_WithdrawStateCopyWith(
          _$_WithdrawState value, $Res Function(_$_WithdrawState) then) =
      __$$_WithdrawStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiResponse<WithDrawResponse> response});
}

/// @nodoc
class __$$_WithdrawStateCopyWithImpl<$Res>
    extends _$WithdrawStateCopyWithImpl<$Res, _$_WithdrawState>
    implements _$$_WithdrawStateCopyWith<$Res> {
  __$$_WithdrawStateCopyWithImpl(
      _$_WithdrawState _value, $Res Function(_$_WithdrawState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$_WithdrawState(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ApiResponse<WithDrawResponse>,
    ));
  }
}

/// @nodoc

class _$_WithdrawState implements _WithdrawState {
  const _$_WithdrawState({required this.response});

  @override
  final ApiResponse<WithDrawResponse> response;

  @override
  String toString() {
    return 'WithdrawState(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WithdrawState &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WithdrawStateCopyWith<_$_WithdrawState> get copyWith =>
      __$$_WithdrawStateCopyWithImpl<_$_WithdrawState>(this, _$identity);
}

abstract class _WithdrawState implements WithdrawState {
  const factory _WithdrawState(
          {required final ApiResponse<WithDrawResponse> response}) =
      _$_WithdrawState;

  @override
  ApiResponse<WithDrawResponse> get response;
  @override
  @JsonKey(ignore: true)
  _$$_WithdrawStateCopyWith<_$_WithdrawState> get copyWith =>
      throw _privateConstructorUsedError;
}
