import 'package:apni_property_app/features/core/models/request/auth/login_request.dart';
import 'package:apni_property_app/features/core/models/request/auth/sign_up_request.dart';
import 'package:apni_property_app/features/core/models/response/auth/forget_password_response.dart';
import 'package:apni_property_app/features/core/models/response/auth/login_response.dart';
import 'package:apni_property_app/features/core/models/response/auth/register_response.dart';
import 'package:apni_property_app/features/core/repositery/auth_repository.dart';
import 'package:apni_property_app/helper/logging.dart';
import 'package:apni_property_app/helper/typedefs.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/networking/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@Freezed()
class AuthState with _$AuthState {
  factory AuthState(
      {ApiResponse<LoginResponse>? response,
      ApiResponse<RegisterResponse>? registerResponse,
      ApiResponse<ForgetPasswordResponse>? forgetPasswordResponse,
      LoginRequest? loginRequest,
      SignUpRequest? signUpRequest,
      @Default(true) bool obscureText,
      @Default(true) bool confirmPasswordObscureTex}) = _AuthState;
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthStateNotifier({required this.authRepository})
      : super(AuthState(
            obscureText: true,
            response: ApiResponse.idle(),
            loginRequest: LoginRequest(),
            signUpRequest: SignUpRequest()));

  Future<void> login(context, JSON loginRequest) async {
    try {
      state = state.copyWith(response: ApiResponse.loading());
      final apiResponse = await authRepository.loginUser(loginRequest);
      state = state.copyWith(
        response: ApiResponse.completed(apiResponse),
      );
      print("value of response after login: ${state}");
    } on NetworkException catch (e) {
      state = state.copyWith(
        response: ApiResponse.error("Your email and password is wrong"),
      );
    } on Exception catch (e) {
      {
        Log.severe(e.toString());
        state = state.copyWith(
          response: ApiResponse.error("Something went wrong"),
        );
      }
    }
  }

  Future<void> register(JSON signUpRequest) async {
    try {
      state = state.copyWith(registerResponse: ApiResponse.loading());
      final apiResponse = await authRepository.registerUser(signUpRequest);
      state = state.copyWith(
        registerResponse: ApiResponse.completed(apiResponse),
      );
    } on NetworkException catch (e) {
      state = state.copyWith(
        registerResponse: ApiResponse.error("Something went wrong"),
      );
    } on Exception catch (e) {
      {
        Log.severe(e.toString());
        state = state.copyWith(
          registerResponse: ApiResponse.error("Something went wrong"),
        );
      }
    }
  }

  Future<void> forgetPassword(JSON json) async {
    try {
      state = state.copyWith(forgetPasswordResponse: ApiResponse.loading());
      final apiResponse = await authRepository.forgetPassword(json);
      state = state.copyWith(
        forgetPasswordResponse: ApiResponse.completed(apiResponse),
      );
    } on NetworkException catch (e) {
      state = state.copyWith(
        forgetPasswordResponse: ApiResponse.error("Something went wrong"),
      );
    } on Exception catch (e) {
      {
        Log.severe(e.toString());
        state = state.copyWith(
          forgetPasswordResponse: ApiResponse.error("Something went wrong"),
        );
      }
    }
  }

  void togglePasswordText() {
    state = state.copyWith(obscureText: !state.obscureText);
  }

  void toggleConfirmPasswordText() {
    state = state.copyWith(confirmPasswordObscureTex: !state.confirmPasswordObscureTex);
  }

  void setLoginRequest(LoginRequest loginRequest) {
    state = state.copyWith(loginRequest: loginRequest);
  }
}
