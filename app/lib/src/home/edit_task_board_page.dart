import 'package:flutter/material.dart';
import 'package:lockpass/src/widgets/app_bar_custom.dart';

class EditTaskBoardPage extends StatelessWidget {
  const EditTaskBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      appBar: AppBarCustom(title: 'Nova Lista'),
    );
  }
}