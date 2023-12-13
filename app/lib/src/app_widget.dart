import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/configuration/services/configration_service.dart';
import 'shared/store/app_store.dart';
import 'shared/themes/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final config = Modular.get<ConfigurationService>();
  final appStore = Modular.get<AppStore>();

  @override
  void initState() {
    super.initState();
    //config.init();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: appStore.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
