class AuthTokenEntity {
  const AuthTokenEntity({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAtUtc,
  });

  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAtUtc;
}
