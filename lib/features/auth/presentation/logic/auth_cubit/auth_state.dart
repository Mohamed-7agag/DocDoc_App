part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//! Login States
final class AuthLoginSuccess extends AuthState {}

final class AuthLoginFailure extends AuthState {
  final String errMessage;

  const AuthLoginFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class AuthLoginLoading extends AuthState {}

//! Register States
final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFailure extends AuthState {
  final String errMessage;
  const AuthRegisterFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}

/// Represents a loading state during registration.
final class AuthRegisterLoading extends AuthState {}
