import 'package:flutter/material.dart';
import 'package:lockpass/src/configuration/services/configration_service.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppStore {
  final themeMode = RxNotifier(ThemeMode.system);
  final syncDate = RxNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    init();
  }

  //Iniciando a Base de dados e recuperando os dados da base
  void init() {
    final model = _configurationService.getConfiguration();
    syncDate.value = model.syncDate;
    themeMode.value = getThemeModeByName(model.themeModeNome);
  }

  // Será salvo sempre que o tema ou a data for alterada
  void save() {
    _configurationService.saveConfiguration(themeMode.value.name, syncDate.value);
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  void deleteApp(){
    _configurationService.deleteAll();
  }

  ThemeMode getThemeModeByName(String name){
    return ThemeMode.values.firstWhere((element) => element.name == name);
  }
}
