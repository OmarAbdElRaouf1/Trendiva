import 'package:equatable/equatable.dart';
import 'package:trendiva/features/auth/data/models/auth_response_model.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthLoggedIn extends AuthState {
  const AuthLoggedIn(this.auth);
  final AuthResponseModel auth;
  @override
  List<Object?> get props => [auth];
}

class AuthSignedUp extends AuthState {
  const AuthSignedUp();
}

class AuthCodeSent extends AuthState {
  const AuthCodeSent(this.message);
  final String? message;
  @override
  List<Object?> get props => [message];
}

class AuthOtpVerified extends AuthState {
  const AuthOtpVerified(this.message);
  final String? message;
  @override
  List<Object?> get props => [message];
}

class AuthPasswordReset extends AuthState {
  const AuthPasswordReset(this.message);
  final String? message;
  @override
  List<Object?> get props => [message];
}

class AuthError extends AuthState {
  const AuthError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
