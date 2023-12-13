import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/app_module.dart';
import 'package:lockpass/src/app_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() {
  //runApp(const AppWidget());

  runApp(
    RxRoot(
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
