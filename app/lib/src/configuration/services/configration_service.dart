import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: unused_import
import 'package:lockpass/src/shared/services/realm/models/configuration_model.dart';
import 'package:lockpass/src/shared/store/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';


abstract class ConfigurationService {
  void init();
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService, Disposable {
  //final  realm;
  final AppStore appStore;
  late final RxDisposer disposer;

  ConfigurationServiceImpl(this.appStore);

  @override
  void init() {
  //  final model = _getConfiguration();
    final model = {
     'themeModeNome' : 'themeModeName',
     'syncDate' : 'syncDate'};

    appStore.themeMode = _getThemeModeByName(model['themeModeNome']!);
    appStore.syncDate = DateTime.now();

    disposer = rxObserver(() {
      final themeMode = appStore.themeMode;
      final syncDate = appStore.syncDate;

    //  _saveConfiguration(themeMode.name, syncDate);
    });
  }

  @override
  void deleteAll() {
    //realm.deleteAll();
  }

  @override
  void dispose() {
    disposer();
  }

 /* _getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }*/

/*
  void _saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = _getConfiguration();
    //realm.write(() {
      model.themeModeNome = themeModeName;
      model.syncDate = syncDate;
   // });
  }*/

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.light; //values.firstWhere((mode) => mode.name == name);
  }
}