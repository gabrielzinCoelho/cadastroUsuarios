import "dart:io";

class User{

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    this.avatar,
  });

  int id;
  String name, email, phone;
  File? avatar;
  DateTime birthDate;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['nome'],
      email: json['email'],
      birthDate: DateTime.now(),
      phone: (json['telefone']).toString(),
    );
  }

}