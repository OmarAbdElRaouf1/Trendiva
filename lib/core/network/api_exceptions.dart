import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trendiva/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    debugPrint('Status Code: ${error.response?.statusCode}');
    debugPrint('Response: ${error.response?.data}');
    switch (error.type) {
      case DioExceptionType.connectionError:
        return ApiError(
          message:
              'No internet connection. Please check your internet and try again.',
        );

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Connection timed out. Please try again.');

      case DioExceptionType.badCertificate:
        return ApiError(
          message: 'Secure connection failed. Please try again later.',
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return ApiError(message: 'Request was cancelled.');

      case DioExceptionType.unknown:
      default:
        return ApiError(message: 'Something went wrong. Please try again.');
    }
  }

  static ApiError _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final serverMessage = _extractServerMessage(error.response?.data);

    return ApiError(
      message: serverMessage ?? _defaultMessage(statusCode),
      statusCode: statusCode,
    );
  }

  static String _defaultMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request. Please check your input.';
      case 302:
        return 'This Email is already registered. Please try logging in.';
      case 401:
        return 'Incorrect email or password.';
      case 403:
        return 'You are not authorized to perform this action.';
      case 404:
        return 'The requested resource was not found.';
      case 409:
        return 'An account with this email already exists.';
      case 422:
        return 'Please enter valid information.';
      case 429:
        return 'Too many requests. Please try again later.';
      case 500:
        return 'Server error. Please try again later.';
      case 502:
      case 503:
      case 504:
        return 'Service is temporarily unavailable.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  static String? _extractServerMessage(dynamic data) {
    if (data is! Map) return null;

    final errors = data['errors'];

    if (errors is Map && errors.isNotEmpty) {
      final firstError = errors.values.first;

      if (firstError is List && firstError.isNotEmpty) {
        return firstError.first.toString();
      }

      if (firstError is String) {
        return firstError;
      }
    }

    final message = data['message'] ?? data['error'];

    if (message is String && message.trim().isNotEmpty) {
      return message;
    }

    return null;
  }
}
