class Validators {
  static final _emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,}$');

  static String? name(String value) {
    if (value.trim().isEmpty) return 'Please enter your full name.';
    return null;
  }

  static String? email(String value) {
    if (value.trim().isEmpty) return 'Please enter your email address.';
    if (!_emailRegex.hasMatch(value.trim())) return 'Please enter a valid email address.';
    return null;
  }

  static String? password(String value) {
    if (value.isEmpty) return 'Please enter your password.';
    if (value.length < 8) return 'Password must be at least 8 characters.';
    return null;
  }

  
  static String? loginPassword(String value) {
    if (value.isEmpty) return 'Please enter your password.';
    return null;
  }

  static String? confirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return 'Please confirm your password.';
    if (password != confirmPassword) return 'Passwords do not match.';
    return null;
  }

  static String? otp(String value, {int length = 6}) {
    if (value.trim().length != length) return 'Please enter the $length-digit code.';
    return null;
  }
}
