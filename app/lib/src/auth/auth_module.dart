import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lockpass/src/auth/auth_state.dart';
import 'package:lockpass/src/auth/controllers/auth_controller.dart';
import 'package:lockpass/src/auth/pages/auth_page.dart';
import 'package:lockpass/src/auth/services/auth_services.dart';
import 'package:lockpass/src/shared/storage/i_token_storage.dart';
import 'package:lockpass/src/shared/storage/token_storage.dart';

class AuthModule extends Module {
// Esse módulo será usado por outros módulos, logo ele exporta
  @override
  void exportedBinds(Injector i) {
    i
      ..add<AuthState>(AuthController.new)
      ..addSingleton(AuthController.new)
      ..addSingleton<TokenStorageInterface>(TokenStorage.new)
      ..addSingleton(GoogleSignIn.new)
      ..addInstance(FirebaseAuth.instance)
      ..addSingleton(AuthServices.new);

    super.exportedBinds(i);
  }

  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(r) {
    // é / pq é a ora prinipal qndo entrar nesse Módulo
    r.child('/', child: (context) => AuthPage(controller: Modular.get()));
  }
}
