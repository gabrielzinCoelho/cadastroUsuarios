import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/user_item.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget{
  const UsersList({super.key, required this.users, required this.onUserDeleted});

  final List<User> users;
  final void Function(User user) onUserDeleted;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(users[index]),
        onDismissed: (direction){
          onUserDeleted(users[index]);
        },
        child: UserItem(user: users[index])
      ),
    );
  }

}