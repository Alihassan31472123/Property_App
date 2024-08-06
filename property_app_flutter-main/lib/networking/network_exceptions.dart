// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apni_property_app/networking/exception_constant.dart';
part 'network_exceptions.freezed.dart';

@freezed
class NetworkException with _$NetworkException {
  const factory NetworkException.FormatException({
    required String name,
    required String uriPath,
    required String message,
  }) = _FormatException;

  const factory NetworkException.FetchDataException({
    required String name,
    required String uriPath,
    required String message,
  }) = _FetchDataException;

  const factory NetworkException.ApiException({
    required String name,
    required String uriPath,
    required String message,
  }) = _ApiException;

  const factory NetworkException.TokenExpiredException({
    required String name,
    required String uriPath,
    required String message,
  }) = _TokenExpiredException;

  const factory NetworkException.UnrecognizedException({
    required String name,
    required String uriPath,
    required String message,
  }) = _UnrecognizedException;

  const factory NetworkException.CancelException({
    required String name,
    required String uriPath,
    required String message,
  }) = _CancelException;

  const factory NetworkException.ConnectTimeoutException({
    required String name,
    required String uriPath,
    required String message,
  }) = _ConnectTimeoutException;

  const factory NetworkException.ReceiveTimeoutException({
    required String name,
    required String uriPath,
    required String message,
  }) = _ReceiveTimeoutException;

  const factory NetworkException.SendTimeoutException({
    required String name,
    required String uriPath,
    required String message,
  }) = _SendTimeoutException;

  const factory NetworkException.badCertificateException({
    required String name,
    required String uriPath,
    required String message,
  }) = _BadCertificateException;

  const factory NetworkException.unAuthorized({
    required String name,
    required String uriPath,
    required String message,
  }) = _UnAuthorized;

  const factory NetworkException.notFoundRouteException({
    required String name,
    required String uriPath,
    required String message,
  }) = _NotFoundRouteException;

  static NetworkException getDioException(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return NetworkException.CancelException(
            name: ExceptionConstants.CancelException,
            uriPath: error.requestOptions.path,
            message: error.message??'Request cancelled prematurely',
          );
        case DioExceptionType.connectionTimeout:
          return NetworkException.ConnectTimeoutException(
            name: ExceptionConstants.ConnectTimeoutException,
            uriPath: error.requestOptions.path,
            message: error.message??'Connection not established',
          );
        case DioExceptionType.sendTimeout:
          return NetworkException.SendTimeoutException(
            name: ExceptionConstants.SendTimeoutException,
            uriPath: error.requestOptions.path,
            message: error.message??'Failed to send',
          );
        case DioExceptionType.receiveTimeout:
          return NetworkException.ReceiveTimeoutException(
            name: ExceptionConstants.ReceiveTimeoutException,
            uriPath: error.requestOptions.path,
            message: error.message??'Failed to receive',
          );
        case DioExceptionType.badResponse:
          return NetworkException.ApiException(
            name: ExceptionConstants.ApiException,
            uriPath: error.requestOptions.path,
            message: error.message??'404 Not Found',
          );
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return NetworkException.FetchDataException(
              name: ExceptionConstants.FetchDataException,
              uriPath: error.requestOptions.path,
              message: error.message??'No Internet connection',
            );
          } else if (error.response?.statusCode == 401) {
            return NetworkException.unAuthorized(
              name: ExceptionConstants.UnAuthorizedException,
              uriPath: error.requestOptions.path,
              message: error.message??'Unauthorized',
            );
          } else if (error.response?.statusCode == 404) {
            return NetworkException.notFoundRouteException(
              name: ExceptionConstants.notFoundRouteException,
              uriPath: error.requestOptions.path,
              message: error.response?.statusMessage ?? 'Not found',
            );
          } else if (error.response?.statusCode == 422) {
            return NetworkException.unAuthorized(
              name: ExceptionConstants.UnAuthorizedException,
              uriPath: error.requestOptions.path,
              message: error.message??'UnProcessable Entity',
            );
          } else {
            return NetworkException.UnrecognizedException(
              name: ExceptionConstants.UnrecognizedException,
              uriPath: error.requestOptions.path,
              message: error.message??'Unrecognized error',
            );
          }
        default:
          return NetworkException.UnrecognizedException(
            name: ExceptionConstants.UnrecognizedException,
            uriPath: error.requestOptions.path,
            message: error.message??'Unrecognized error',
          );
      }
    }
    return const NetworkException.UnrecognizedException(
      name: ExceptionConstants.UnrecognizedException,
      uriPath: '',
      message: 'Unrecognized error',
    );
  }
}
