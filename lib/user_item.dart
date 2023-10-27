import 'dart:convert';

import 'package:cadastro_usuarios/add_user.dart';
import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/user_avatar.dart';
import 'package:cadastro_usuarios/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cadastro_usuarios/widgets/inputs/dateTimeInput.dart';

class UserItem extends StatefulWidget{
  const UserItem({super.key, required this.user});

  final User user;

  @override
  State<UserItem> createState() => _UserItemState(user);
}

class _UserItemState extends State<UserItem>{

  _UserItemState(this.user);

  final User user;

  void _openEditUserModal(BuildContext context){

    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => AddUser(user: user, onSubmitUser: _editUser)
    );

  }

  void _editUser(User user) async {
    
    try{

      final response = await http.put(
        Uri.parse("http://10.0.2.2:8080/atualiza"),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(<String, dynamic>{
          "id": user.id,
          "nome": user.name,
          "email": user.email,
          "dataNasc": dateFormatter.format(user.birthDate),
          "telefone": user.phone,
          "senha": user.password
        })
      );

      if(response.statusCode != 200){
        throw Exception();
      }

      final userResponse = User.fromJson(jsonDecode(response.body));

      setState(() {
        this.user.name = userResponse.name;
        this.user.email = userResponse.email;
        this.user.phone = userResponse.phone;
        this.user.birthDate = userResponse.birthDate;
        this.user.password = userResponse.password;
        // this.user.avatar = userResponse.avatar;
      });

    }catch(e){}

  }

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
          UserAvatar(avatarFile: user.avatar),
          UserData(name: user.name, email: user.email),
          GestureDetector(
            onTap: (){
              _openEditUserModal(context);
            },
            child: const Center(
              child: Icon(Icons.mode_edit_outline_outlined),
            ),
          )
        ],
      ),
    );
  }

}