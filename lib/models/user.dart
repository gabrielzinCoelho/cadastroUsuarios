class User{

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.birthDate
  });

  int id;
  String name, email, phone, avatarUrl;
  DateTime birthDate;


}