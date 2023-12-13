import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockpass/src/auth/auth_state.dart';
import 'package:lockpass/src/auth/controllers/auth_controller.dart';

class AuthPage extends StatefulWidget {
  AuthPage({super.key, required this.controller});

  final AuthController controller;

  @override
  State<AuthPage> createState() => _AuthPageState();
}



class _AuthPageState extends State<AuthPage> {
AuthController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<AuthController, AuthState>(
            bloc: controller,
            builder: (contx, state) {
              print('AuthPage: ${state}');
              if (state is AuthLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is AuthInitialState) {
                return buttonLoginGoogle();
              } else if (state is AuthUnauthenticatedState) {
                return buttonLoginGoogle();
              } else if (state is AuthenticatedState) {
                Navigator.of(context).pushNamed('/home/');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Column buttonLoginGoogle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          'assets/images/logo.png',
          height: 200,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 90),
              OutlinedButton(
                style: styleButton(),
                onPressed: () async {
                  await controller.login();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/google_logo.png'),
                          height: 35,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Acessar',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  ButtonStyle styleButton() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }

  // @override
  // List<Object?> get props => [loginCubit];
}
