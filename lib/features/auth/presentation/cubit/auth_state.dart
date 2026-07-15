import 'package:equatable/equatable.dart';
import 'package:trendiva/features/auth/domain/entities/auth_token_entity.dart';

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
  final AuthTokenEntity auth;
  @override
  List<Object?> get props => [auth];
}

class AuthSignedUp extends AuthState {
  const AuthSignedUp();
}

class AuthEmailNotVerified extends AuthState {
  const AuthEmailNotVerified(this.email);
  final String email;
  @override
  List<Object?> get props => [email];
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
