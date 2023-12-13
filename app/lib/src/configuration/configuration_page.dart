import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/shared/store/app_store.dart';
import 'package:lockpass/src/widgets/app_bar_custom.dart';



class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
     late final appStore = Modular.get<AppStore>();

  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode = mode;
    }
  }
      final textTheme = Theme.of(context).textTheme;
    
    return Scaffold(      
      appBar: const AppBarCustom(title: 'Configurações'),
      body: Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Configurações',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Tema',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          RadioListTile<ThemeMode>(
            value: ThemeMode.system,
            groupValue: appStore.themeMode,
            title: const Text('Sistema'),
            onChanged: _changeThemeMode,
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: appStore.themeMode,
            title: const Text('Claro'),
            onChanged: _changeThemeMode,
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: appStore.themeMode,
            title: const Text('Escuro'),
            onChanged: _changeThemeMode,
          ),
          const SizedBox(height: 20),
          Text(
            'Controle de dados',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Apagar cache e reiniciar o app'),
          )
        ],
      ),
    ),
    );
  }
}
