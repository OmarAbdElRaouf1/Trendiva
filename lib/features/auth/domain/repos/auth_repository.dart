import 'package:trendiva/features/auth/domain/entities/auth_token_entity.dart';

abstract class AuthRepository {
  Future<AuthTokenEntity> login({
    required String email,
    required String password,
  });

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<String?> forgotPassword({required String email});

  Future<String?> validateOtp({required String email, required String otp});

  Future<String?> verifyEmail({required String email, required String otp});

  Future<String?> resendOtp({required String email});

  Future<String?> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
}
