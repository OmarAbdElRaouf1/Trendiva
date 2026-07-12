class AuthResponseModel {
  const AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAtUtc,
  });

  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAtUtc;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresAtUtc: DateTime.tryParse(json['expiresAtUtc']?.toString() ?? ''),
    );
  }
}
