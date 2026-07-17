import 'package:trendiva/core/network/api_error.dart';
import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/core/utils/pref_helper.dart';
import 'package:trendiva/features/auth/data/models/auth_response_model.dart';
import 'package:trendiva/features/auth/domain/entities/auth_token_entity.dart';
import 'package:trendiva/features/auth/domain/repos/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<AuthTokenEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(EndPoints.login, {
        'email': email,
        'password': password,
      });
      final auth = AuthResponseModel.fromJson(response as Map<String, dynamic>);
      await PrefHelper.saveToken(auth.accessToken);
      await PrefHelper.saveRefreshToken(auth.refreshToken);
      return auth;
    } on ApiError catch (e) {
      if (e.message.toLowerCase().contains('not verified')) {
        throw EmailNotVerifiedError(email: email);
      }

      if (e.statusCode == 401 || e.statusCode == 400) {
        throw ApiError(
          message: 'Incorrect email or password.',
          statusCode: 401,
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await _apiService.post(EndPoints.register, {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  @override
  Future<String?> forgotPassword({required String email}) async {
    final response = await _apiService.post(EndPoints.forgotPassword, {
      'email': email,
    });
    return _extractMessage(response);
  }

  @override
  Future<String?> validateOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _apiService.post(EndPoints.validateOtp, {
      'email': email,
      'otp': otp,
    });
    return _extractMessage(response);
  }

  @override
  Future<String?> verifyEmail({
    required String email,
    required String otp,
  }) async {
    final response = await _apiService.post(EndPoints.verifyEmail, {
      'email': email,
      'otp': otp,
    });
    return _extractMessage(response);
  }

  @override
  Future<String?> resendOtp({required String email}) async {
    final response = await _apiService.post(EndPoints.resendOtp, {
      'email': email,
    });
    return _extractMessage(response);
  }

  @override
  Future<String?> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    final response = await _apiService.post(EndPoints.resetPassword, {
      'email': email,
      'otp': otp,
      'newPassword': newPassword,
    });
    return _extractMessage(response);
  }

  String? _extractMessage(dynamic response) {
    if (response is Map<String, dynamic>) {
      final message = response['message'] ?? response['Message'];
      if (message is String && message.trim().isNotEmpty) return message;
    }
    return null;
  }
}
