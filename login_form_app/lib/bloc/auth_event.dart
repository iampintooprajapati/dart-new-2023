part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginButtonPress extends AuthEvent {
  final String email;
  final String password;

  AuthLoginButtonPress({
    required this.email,
    required this.password,
  });
}

final class AuthLogoutRequested extends AuthEvent {}
