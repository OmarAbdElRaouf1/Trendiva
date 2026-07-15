import 'package:trendiva/features/auth/domain/entities/auth_token_entity.dart';

class AuthResponseModel extends AuthTokenEntity {
  const AuthResponseModel({
    required super.accessToken,
    required super.refreshToken,
    super.expiresAtUtc,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresAtUtc: DateTime.tryParse(json['expiresAtUtc']?.toString() ?? ''),
    );
  }
}
