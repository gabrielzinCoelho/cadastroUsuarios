import 'package:cadastro_usuarios/add_user.dart';
import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/users_list.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget{

  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();

}

class _UsersState extends State<Users>{

  final List<User> registeredUsers = List.filled(
    20,
    User(id: 1, name: "Gabriel Coelho", email: "coelhocostag@gmail.com", phone: "99978-3421", avatarUrl: "assets/user.png", birthDate: DateTime.now()),
    growable: true
  );

  void _openAddUserModal(){

    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => const AddUser()
    );

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "USUÁRIOS",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold
          )
        ),
        actions: [
          IconButton(
            onPressed: _openAddUserModal,
            icon: const Icon(
              Icons.person_add_alt_1,
              color: Colors.purple,
              size: 30,
            ),
          )
        ],
      ),
      body: UsersList(users: registeredUsers),
    );
  }

}