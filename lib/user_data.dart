import 'package:flutter/material.dart';

class UserData extends StatelessWidget{

  const UserData({super.key, required this.name, required this.email});

  final String name, email;

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            Text(
              email,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.purple
              )
            ),
          ],
        ),
      ),
    );
  }

}