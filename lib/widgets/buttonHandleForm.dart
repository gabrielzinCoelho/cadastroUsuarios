import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonHandleForm extends StatelessWidget{

  const ButtonHandleForm({super.key, required this.label, required this.callbackButtonPressed});

  final String label;
  final void Function() callbackButtonPressed;

  @override
  Widget build(BuildContext context){

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(5), right: Radius.circular(5)),
          ),
          
          backgroundColor: Colors.orange 
        ),
        onPressed: callbackButtonPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14
          )
        ),
      ),
    );

  }

}