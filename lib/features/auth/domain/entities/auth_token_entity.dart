class AuthTokenEntity {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAtUtc;
  
  const AuthTokenEntity({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAtUtc,
  });
}
