import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.passward);
          emit(LoginSuccesState());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailureState(error: 'No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailureState(
                error: 'Wrong password provided for that user.'));
          }
        } catch (e) {
          emit(LoginFailureState(error: "There is an error please try again"));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoadingState());
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.email, password: event.passward);
          emit(RegisterSuccesState());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailureState(
                error: 'The password provided is too weak.'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailureState(
                error: 'The account already exists for that email.'));
          }
        } catch (e) {
          emit(RegisterFailureState(
              error: "There is an error please try again"));
        }
      }
    });
  }
}
