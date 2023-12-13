import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/auth/auth_module.dart';
import 'package:lockpass/src/configuration/configuration_page.dart';
import 'package:lockpass/src/configuration/services/configration_service.dart';
import 'package:lockpass/src/home/home_module.dart';
import 'package:lockpass/src/profile/google_user_profile_page.dart';
import 'package:lockpass/src/shared/store/app_store.dart';
import 'package:lockpass/src/splash/splash_page.dart';

class AppModule extends Module {

  //Importanto o Modulo de autenticação
List<Module> get imports =>[ AuthModule()];


 @override
  void binds(i) {
   //i..addInstance(Realm(config))
    i..addSingleton<ConfigurationService>(ConfigurationServiceImpl.new)
    //..addSingleton(GoogleAuthCubit.new)
    ..addSingleton(AppStore.new);
   // ..addSingleton(GoogleAuthCubit.new)
    //..addInstance(TokenStorageInterface);
    //..addSingleton<GoogleAuthCubit>(i.get<TokenStorageInterface>)
   
    


  }



  @override
  void routes(r) {

    r..child('/', child: (context) => const SplashPage())
    ..module('/auth', module: AuthModule())
    ..module('/home', module: HomeModule())
    ..child('/config', child: (context) => const ConfigurationPage())
    ..child('/profile', child: (context) => GoogleUserProfilePage());
  }

}

//https://www.youtube.com/watch?v=qn6pLYkOayk
//https://modular.flutterando.com.br/docs/flutter_modular/navegation/
//https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/