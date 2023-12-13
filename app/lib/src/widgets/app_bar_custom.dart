import 'package:flutter/material.dart';
import 'package:lockpass/src/widgets/user_image_button.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{
  const AppBarCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: Text(title),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: UserImageButton('ff'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
