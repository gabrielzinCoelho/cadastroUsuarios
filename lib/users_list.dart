import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/user_item.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget{
  const UsersList({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => UserItem(user: users[index]),
    );
  }

}