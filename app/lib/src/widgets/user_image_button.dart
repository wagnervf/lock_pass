import 'package:flutter/material.dart';

class UserImageButton extends StatelessWidget {
  final String image;
  const UserImageButton(
     this.image,
{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        backgroundImage: NetworkImage(image),
        //child: Text(nome.substring(0,1)),
      ),
    );
  }
}
