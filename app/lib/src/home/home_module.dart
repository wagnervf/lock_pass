import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/auth/auth_module.dart';
import 'package:lockpass/src/home/edit_task_board_page.dart';
import 'package:lockpass/src/home/home_page.dart';

class HomeModule extends Module {
  //Importanto o Modulo de autenticação
  List<Module> get imports => [AuthModule(), ];

  @override
  void binds(Injector i) {
    // Caso eu usasse o Dio, por exemplo

    // i.add(Dio.new)
    // clienteServices
    super.binds(i);
  }

  @override
  void routes(r) {
    r
      ..child('/', child: (context) => const HomePage())
      ..child('/edit', child: (context) => const EditTaskBoardPage());
  }
}
