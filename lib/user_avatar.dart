import 'package:flutter/material.dart';
import "dart:io";

class UserAvatar extends StatelessWidget{
  const UserAvatar({super.key, required this.avatarFile});

  final File? avatarFile;

  @override
  Widget build(BuildContext context){

    Widget userAvatar = avatarFile == null ?
      Image.asset(
        "assets/user.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      )
      :
      Image.file(
        avatarFile!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );

    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: Colors.purple[900]!
          ),
        ),
        width: 40,
        height: 40,
        child: ClipOval(
          child: userAvatar,
        ),
      )
    );
  }

}