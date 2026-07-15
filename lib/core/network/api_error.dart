class ApiError {
  final String message;
  final int? statusCode;

  ApiError({required this.message, this.statusCode});
  @override
  String toString() {
    return 'Error is $message(Status code is $statusCode)';
  }
}

class EmailNotVerifiedError extends ApiError {
  EmailNotVerifiedError({required this.email})
    : super(
        message: 'Please verify your email before logging in.',
        statusCode: 400,
      );

  final String email;
}
