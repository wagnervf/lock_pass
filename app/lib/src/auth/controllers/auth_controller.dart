import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockpass/src/auth/auth_state.dart';
import 'package:lockpass/src/auth/services/auth_services.dart';
import 'package:lockpass/src/shared/storage/i_token_storage.dart';

class AuthController extends Cubit<AuthState> {
  AuthController(this.tokenStorage, this.services) : super(AuthInitialState()) {
    checkLoginStatus();
  }

  final AuthServices services;
  final TokenStorageInterface tokenStorage;

  Future<void> checkLoginStatus() async {
    emit(AuthLoadingState());
    print('checkLoginStatus');
    try {
      final token = await tokenStorage.getToken();

      if (token != null) {
        emit(AuthenticatedState());
      } else {
        emit(AuthUnauthenticatedState());
      }
    } catch (e) {
      print('Erro ao buscar o token');
      emit(AuthUnauthenticatedState());
    }
  }

  Future<void> login() async {
    emit(AuthLoadingState());
    try {
      final userCredential = await services.signInGoogle();

      if (userCredential == null) {
        await tokenStorage.deleteToken();
        emit(AuthErrorState('Erro ao realizar o login do '));
      }

      emit(AuthSuccessState(userCredential.user));
      emit(AuthenticatedState());
      await tokenStorage.saveToken(userCredential.user?.uid ?? '');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      emit(AuthErrorState(e.message.toString()));
    }
  }

  Future<void> logout() async {
    print('signOut');
    emit(AuthLoadingState());

    try {
      await services.signOutGoogle();
      await tokenStorage.deleteToken();
      emit(AuthUnauthenticatedState());
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message.toString()));
    }
  }
}
