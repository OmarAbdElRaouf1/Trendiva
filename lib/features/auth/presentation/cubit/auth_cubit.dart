import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/core/network/api_error.dart';
import 'package:trendiva/features/auth/domain/repos/auth_repository.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_state.dart';

enum OtpPurpose { resetPassword, verifyEmail }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository) : super(const AuthInitial());

  final AuthRepository _repository;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    try {
      final auth = await _repository.login(email: email, password: password);
      emit(AuthLoggedIn(auth));
    } on EmailNotVerifiedError catch (e) {
      emit(AuthEmailNotVerified(e.email));
    } catch (e) {
      emit(AuthError(_message(e)));
    }
  }

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    try {
      await _repository.signup(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      emit(const AuthSignedUp());
    } catch (e) {
      emit(AuthError(_message(e)));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    emit(const AuthLoading());
    try {
      final message = await _repository.forgotPassword(email: email);
      emit(AuthCodeSent(message));
    } catch (e) {
      emit(AuthError(_message(e)));
    }
  }

  Future<void> resendOtp({required String email}) async {
    emit(const AuthLoading());
    try {
      final message = await _repository.resendOtp(email: email);
      emit(AuthCodeSent(message));
    } catch (e) {
      emit(AuthError(_message(e)));
    }
  }

  Future<void> verifyOtp({
    required String email,
    required String otp,
    required OtpPurpose purpose,
  }) async {
    emit(const AuthLoading());
    try {
      final message = purpose == OtpPurpose.resetPassword
          ? await _repository.validateOtp(email: email, otp: otp)
          : await _repository.verifyEmail(email: email, otp: otp);
      emit(AuthOtpVerified(message));
    } catch (e) {
      emit(AuthError(_message(e)));
    }
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(const AuthLoading());
    try {
      final message = await _repository.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );
      emit(AuthPasswordReset(message));
    } catch (e) {
      emit(AuthError(_message(e)));
    }
  }

  String _message(Object error) {
    if (error is ApiError) return error.message;
    return 'Something went wrong. Please try again.';
  }
}
