import 'package:trendiva/core/network/api_service.dart';
import 'package:trendiva/core/network/end_points.dart';
import 'package:trendiva/core/utils/pref_helper.dart';
import 'package:trendiva/features/auth/data/models/auth_response_model.dart';

class AuthRepository {
  AuthRepository(this._apiService);

  final ApiService _apiService;

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post(EndPoints.login, {
      'email': email,
      'password': password,
    });
    final auth = AuthResponseModel.fromJson(response as Map<String, dynamic>);
    await PrefHelper.saveToken(auth.accessToken);
    await PrefHelper.saveRefreshToken(auth.refreshToken);
    return auth;
  }

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

  Future<String?> forgotPassword({required String email}) async {
    final response = await _apiService.post(EndPoints.forgotPassword, {
      'email': email,
    });
    return _extractMessage(response);
  }

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

  Future<String?> resendOtp({required String email}) async {
    final response = await _apiService.post(EndPoints.resendOtp, {
      'email': email,
    });
    return _extractMessage(response);
  }

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
