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


}