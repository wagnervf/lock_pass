
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/auth/controllers/auth_controller.dart';
import 'package:lockpass/src/auth/auth_state.dart';
class AuthGuard extends RouteGuard {
final AuthController cubit;

AuthGuard(this.cubit);

  @override
  Future<bool> canActivate(String url, ModularRoute route) async {
     // final GoogleAuthCubit loginCubit = GoogleAuthCubit();
    final state =  cubit.state;
    print('Route: ${state}');

    if (state is AuthenticatedState) {
      print('Usuário autenticado, permitir acesso à rota');
      return true;
    } else {
      print('Usuário não autenticado, redirecionar para a tela de login');
     // await Modular.to.pushReplacementNamed('/auth');
     Modular.to.pushNamed('/auth');
      return false;
    }
  }

  @override
  FutureOr<ParallelRoute?> pos(ModularRoute route, ModularArguments data) {
    // TODO: implement pos
    throw UnimplementedError();
  }

  @override
  FutureOr<ModularRoute?> pre(ModularRoute route) {
    // TODO: implement pre
    throw UnimplementedError();
  }

  @override
  // TODO: implement redirectTo
  String? get redirectTo => throw UnimplementedError();
}

/*
class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth');

  @override
  bool canActivate(String path, ModularRoute router) {
   final state = Modular.get<Google>();
    print('Route: ${state}');


        if (state is GoogleAuthenticatedState) {
      print('Usuário autenticado, permitir acesso à rota');
      return true;
    } else {
      print('Usuário não autenticado, redirecionar para a tela de login');
       //Modular.to.pushReplacementNamed('/auth');
      return false;
    }
  }
}*/