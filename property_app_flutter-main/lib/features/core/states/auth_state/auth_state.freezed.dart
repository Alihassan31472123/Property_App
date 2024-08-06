// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  ApiResponse<LoginResponse>? get response =>
      throw _privateConstructorUsedError;
  ApiResponse<RegisterResponse>? get registerResponse =>
      throw _privateConstructorUsedError;
  ApiResponse<ForgetPasswordResponse>? get forgetPasswordResponse =>
      throw _privateConstructorUsedError;
  LoginRequest? get loginRequest => throw _privateConstructorUsedError;
  SignUpRequest? get signUpRequest => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  bool get confirmPasswordObscureTex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {ApiResponse<LoginResponse>? response,
      ApiResponse<RegisterResponse>? registerResponse,
      ApiResponse<ForgetPasswordResponse>? forgetPasswordResponse,
      LoginRequest? loginRequest,
      SignUpRequest? signUpRequest,
      bool obscureText,
      bool confirmPasswordObscureTex});

  $LoginRequestCopyWith<$Res>? get loginRequest;
  $SignUpRequestCopyWith<$Res>? get signUpRequest;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? registerResponse = freezed,
    Object? forgetPasswordResponse = freezed,
    Object? loginRequest = freezed,
    Object? signUpRequest = freezed,
    Object? obscureText = null,
    Object? confirmPasswordObscureTex = null,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ApiResponse<LoginResponse>?,
      registerResponse: freezed == registerResponse
          ? _value.registerResponse
          : registerResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<RegisterResponse>?,
      forgetPasswordResponse: freezed == forgetPasswordResponse
          ? _value.forgetPasswordResponse
          : forgetPasswordResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<ForgetPasswordResponse>?,
      loginRequest: freezed == loginRequest
          ? _value.loginRequest
          : loginRequest // ignore: cast_nullable_to_non_nullable
              as LoginRequest?,
      signUpRequest: freezed == signUpRequest
          ? _value.signUpRequest
          : signUpRequest // ignore: cast_nullable_to_non_nullable
              as SignUpRequest?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmPasswordObscureTex: null == confirmPasswordObscureTex
          ? _value.confirmPasswordObscureTex
          : confirmPasswordObscureTex // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginRequestCopyWith<$Res>? get loginRequest {
    if (_value.loginRequest == null) {
      return null;
    }

    return $LoginRequestCopyWith<$Res>(_value.loginRequest!, (value) {
      return _then(_value.copyWith(loginRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpRequestCopyWith<$Res>? get signUpRequest {
    if (_value.signUpRequest == null) {
      return null;
    }

    return $SignUpRequestCopyWith<$Res>(_value.signUpRequest!, (value) {
      return _then(_value.copyWith(signUpRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiResponse<LoginResponse>? response,
      ApiResponse<RegisterResponse>? registerResponse,
      ApiResponse<ForgetPasswordResponse>? forgetPasswordResponse,
      LoginRequest? loginRequest,
      SignUpRequest? signUpRequest,
      bool obscureText,
      bool confirmPasswordObscureTex});

  @override
  $LoginRequestCopyWith<$Res>? get loginRequest;
  @override
  $SignUpRequestCopyWith<$Res>? get signUpRequest;
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? registerResponse = freezed,
    Object? forgetPasswordResponse = freezed,
    Object? loginRequest = freezed,
    Object? signUpRequest = freezed,
    Object? obscureText = null,
    Object? confirmPasswordObscureTex = null,
  }) {
    return _then(_$_AuthState(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as ApiResponse<LoginResponse>?,
      registerResponse: freezed == registerResponse
          ? _value.registerResponse
          : registerResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<RegisterResponse>?,
      forgetPasswordResponse: freezed == forgetPasswordResponse
          ? _value.forgetPasswordResponse
          : forgetPasswordResponse // ignore: cast_nullable_to_non_nullable
              as ApiResponse<ForgetPasswordResponse>?,
      loginRequest: freezed == loginRequest
          ? _value.loginRequest
          : loginRequest // ignore: cast_nullable_to_non_nullable
              as LoginRequest?,
      signUpRequest: freezed == signUpRequest
          ? _value.signUpRequest
          : signUpRequest // ignore: cast_nullable_to_non_nullable
              as SignUpRequest?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmPasswordObscureTex: null == confirmPasswordObscureTex
          ? _value.confirmPasswordObscureTex
          : confirmPasswordObscureTex // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  _$_AuthState(
      {this.response,
      this.registerResponse,
      this.forgetPasswordResponse,
      this.loginRequest,
      this.signUpRequest,
      this.obscureText = true,
      this.confirmPasswordObscureTex = true});

  @override
  final ApiResponse<LoginResponse>? response;
  @override
  final ApiResponse<RegisterResponse>? registerResponse;
  @override
  final ApiResponse<ForgetPasswordResponse>? forgetPasswordResponse;
  @override
  final LoginRequest? loginRequest;
  @override
  final SignUpRequest? signUpRequest;
  @override
  @JsonKey()
  final bool obscureText;
  @override
  @JsonKey()
  final bool confirmPasswordObscureTex;

  @override
  String toString() {
    return 'AuthState(response: $response, registerResponse: $registerResponse, forgetPasswordResponse: $forgetPasswordResponse, loginRequest: $loginRequest, signUpRequest: $signUpRequest, obscureText: $obscureText, confirmPasswordObscureTex: $confirmPasswordObscureTex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.registerResponse, registerResponse) ||
                other.registerResponse == registerResponse) &&
            (identical(other.forgetPasswordResponse, forgetPasswordResponse) ||
                other.forgetPasswordResponse == forgetPasswordResponse) &&
            (identical(other.loginRequest, loginRequest) ||
                other.loginRequest == loginRequest) &&
            (identical(other.signUpRequest, signUpRequest) ||
                other.signUpRequest == signUpRequest) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.confirmPasswordObscureTex,
                    confirmPasswordObscureTex) ||
                other.confirmPasswordObscureTex == confirmPasswordObscureTex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      response,
      registerResponse,
      forgetPasswordResponse,
      loginRequest,
      signUpRequest,
      obscureText,
      confirmPasswordObscureTex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  factory _AuthState(
      {final ApiResponse<LoginResponse>? response,
      final ApiResponse<RegisterResponse>? registerResponse,
      final ApiResponse<ForgetPasswordResponse>? forgetPasswordResponse,
      final LoginRequest? loginRequest,
      final SignUpRequest? signUpRequest,
      final bool obscureText,
      final bool confirmPasswordObscureTex}) = _$_AuthState;

  @override
  ApiResponse<LoginResponse>? get response;
  @override
  ApiResponse<RegisterResponse>? get registerResponse;
  @override
  ApiResponse<ForgetPasswordResponse>? get forgetPasswordResponse;
  @override
  LoginRequest? get loginRequest;
  @override
  SignUpRequest? get signUpRequest;
  @override
  bool get obscureText;
  @override
  bool get confirmPasswordObscureTex;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
