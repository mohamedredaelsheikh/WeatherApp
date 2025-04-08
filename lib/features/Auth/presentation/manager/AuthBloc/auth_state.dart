part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccesState extends AuthState {}

class LoginFailureState extends AuthState {
  final String error;

  LoginFailureState({required this.error});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccesState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String error;

  RegisterFailureState({required this.error});
}
