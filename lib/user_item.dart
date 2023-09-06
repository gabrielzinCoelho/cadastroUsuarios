import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/user_avatar.dart';
import 'package:cadastro_usuarios/user_data.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget{
  const UserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context){
    return Container(
      // height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.purple, width: 1)
        )
      ),
      child: Row(
        children: [
          UserAvatar(avatarUrl: user.avatarUrl),
          UserData(name: user.name, email: user.email),
          const Center(
            child: Icon(Icons.mode_edit_outline_outlined),
          )
        ],
      ),
    );
  }
}