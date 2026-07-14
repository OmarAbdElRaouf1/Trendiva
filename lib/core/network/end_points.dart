class EndPoints {
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String validateOtp = '/api/auth/validate-otp';
  static const String verifyEmail = '/api/auth/verify-email';
  static const String resendOtp = '/api/auth/resend-otp';
  static const String resetPassword = '/api/auth/reset-password';
  static const String refreshToken = '/api/auth/refresh-token';
  static const String me = '/api/auth/me';

  static const String products = '/api/products';
  static const String categories = '/api/categories';
  static const String offers = '/api/offers';

  static const String cart = '/api/cart';
  static const String cartItems = '/api/cart/items';
  static const String decrementCartItem = '/api/cart/items/decrement';
  static String cartItemById(String id) => '/api/cart/items/$id';
}
