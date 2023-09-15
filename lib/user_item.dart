import 'package:cadastro_usuarios/add_user.dart';
import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/user_avatar.dart';
import 'package:cadastro_usuarios/user_data.dart';
import 'package:flutter/material.dart';

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

  void _editUser(User user){
    setState(() {
      this.user.name = user.name;
      this.user.email = user.email;
      this.user.phone = user.email;
      this.user.birthDate = user.birthDate;
      this.user.avatar = user.avatar;
    });
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