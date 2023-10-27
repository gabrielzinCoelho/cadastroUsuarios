import 'dart:convert';
import 'package:cadastro_usuarios/add_user.dart';
import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/users_list.dart';
import 'package:cadastro_usuarios/widgets/inputs/dateTimeInput.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget{

  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();

}

class _UsersState extends State<Users>{

  // final List<User> registeredUsers = [
  //   User(id: 1, name: "Gabriel Coelho", email: "coelhocostag@gmail.com", phone: "99978-3421", birthDate: DateTime.now(), avatar: null),
  // ];

  late final List<User> registeredUsers;
  Future<void>? _future;

  Future<void> _fetchUsers() async {
    
    try{

      // await Future.delayed(const Duration(seconds: 10));

      final response = await http.get(
        Uri.parse("http://10.0.2.2:8080/exibirtodos")
      );

      if(response.statusCode != 200){
        throw Exception();
      }

      registeredUsers = jsonDecode(response.body).map(
        (responseItem) => User.fromJson(responseItem)
      ).toList().cast<User>();

    }catch(e){
      registeredUsers = [];
    }
    
  }

  @override
  void initState(){
    _future = _fetchUsers();
    super.initState();
  }

  void _openAddUserModal(){

    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => AddUser(onSubmitUser: _addUser)
    );

  }

  void _addUser(User user) async {
    
    try{
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8080/cadastro"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, dynamic>{
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
      
      setState(() {
        registeredUsers.add(
          User.fromJson(
            jsonDecode(response.body)
          )
        );
      });

    }catch(e){
    }
    
  }

 void _removeUser(User user) async {

  try{

    final response  = await http.delete(
      Uri.parse("http://10.0.2.2:8080/deleta/${user.id}")
    );

    if(response.statusCode != 200)
      throw Exception();

    setState(() {
      registeredUsers.remove(user);
    });

  }catch(e){}

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
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot){
          return snapshot.connectionState == ConnectionState.done ? UsersList(users: registeredUsers, onUserDeleted: _removeUser) : const SizedBox.shrink();
        },
      ),
    );
  }

}