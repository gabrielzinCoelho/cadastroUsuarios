import "dart:io";

import "package:cadastro_usuarios/widgets/inputs/dateTimeInput.dart";

class User{

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.password,
    this.avatar,
  });

  int? id;
  String name, email, phone, password;
  File? avatar;
  DateTime birthDate;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['nome'],
      email: json['email'],
      birthDate: dateFormatter.parse(json["dataNasc"]),
      phone: json['telefone'],
      password: json["senha"]
    );
  }

}