part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String passward;

  LoginEvent({required this.email, required this.passward});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String passward;

  RegisterEvent({required this.email, required this.passward});
}
