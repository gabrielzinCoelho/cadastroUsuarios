import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget{
  const UserAvatar({super.key, required this.avatarUrl});

  final String avatarUrl;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Image.asset(
        avatarUrl,
        height: 40,
        width: 40,
      ),
    );
  }

}