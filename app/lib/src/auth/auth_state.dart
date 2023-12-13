import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState{}

class AuthInitialState extends AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {
  final User? user;

  AuthSuccessState(this.user);
}

class AuthenticatedState extends AuthState {
  /*final String isLogged;

  GoogleAuthenticatedState(this.isLogged);*/
}

class AuthUnauthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);
}
//https://www.youtube.com/watch?v=qn6pLYkOayk
//https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/