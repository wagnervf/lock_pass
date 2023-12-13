import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/auth/controllers/auth_controller.dart';

class GoogleUserProfilePage extends StatefulWidget {
  GoogleUserProfilePage({super.key});

  @override
  State<GoogleUserProfilePage> createState() => _GoogleUserProfilePageState();
}

class _GoogleUserProfilePageState extends State<GoogleUserProfilePage> {
 // final AuthController loginCubit = AuthController();
 final AuthController loginCubit = Modular.get<AuthController>();

//final user = ModalRoute.of(context).settings.arguments as User;
  @override
  Widget build(BuildContext context) {
    final userLoged = ModalRoute.of(context)?.settings.arguments as User?;

    return Scaffold(
      appBar: AppBar(elevation: 3, title: const Text('Perfil')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(),
              if (userLoged?.photoURL != null)
                ClipOval(
                  child: Material(
                    child: Image.network(
                      userLoged?.photoURL ?? '',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              else
                const ClipOval(
                  child: Material(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16.0),
              Text(
                userLoged?.displayName ?? '',
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '( ${userLoged?.email!} )',
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'LockPass seu gerenciador de senhas particular e privativo',
                style: TextStyle(fontSize: 14, letterSpacing: 0.2),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                   await loginCubit.logout();
                  await Navigator.pushNamed(
                    context,
                    '/auth',
                  );
                

                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    'Sair',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
