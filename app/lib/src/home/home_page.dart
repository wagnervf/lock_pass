import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lockpass/src/auth/auth_state.dart';
import 'package:lockpass/src/auth/services/auth_services.dart';
import 'package:lockpass/src/home/widget/cutom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final AuthController loginCubit = AuthController();

  @override
  void initState() {
    super.initState();
    Modular.get<AuthServices>().userStream().listen((user) {
      if (user != null) {
        setState(() {
          _user = user;
        });
      }
    });
  }

  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Lock Pass'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () =>
              Navigator.pushNamed(
              context,
              '/profile',
              arguments: _user,
            ),
              //Navigator.of(context).pushNamed('/profile'),
              icon: const Icon(Icons.person),
            ),
            /* child: _user != null
             ? UserImageButton(_user?.photoURL ?? '')
            : Text('Null')*/
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                  top: 50, left: 30, right: 30, bottom: 200),
              itemCount: 4,
              itemBuilder: (_, index) {
                /* final board = TaskBoard(
                  Uuid.v4(),
                  'Nova lista de tarefas 1',
                  tasks: [
                    Task(Uuid.v4(), '', complete: true),
                    Task(Uuid.v4(), '', complete: false),
                    Task(Uuid.v4(), '', complete: true),
                    Task(Uuid.v4(), '', complete: false),
                  ],
                );*/
                return Container();
                /* TaskCard(
                  board: board,
                  height: 140,
                );*/
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: Text('Todos'),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: Text('Desativadas'),
                    ),
                  ],
                  selected: const {1},
                  onSelectionChanged: (values) {},
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
    );
  }

  Center userDetails(AuthSuccessState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(state.user!.photoURL ?? ''),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(state.user!.displayName ?? ''),
          const SizedBox(
            height: 10,
          ),
          Text(state.user!.email ?? ''),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
