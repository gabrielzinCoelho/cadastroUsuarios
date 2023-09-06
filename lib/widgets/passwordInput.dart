import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordInput extends StatefulWidget{

  const PasswordInput({super.key, this.maxLength = 30, required this.label});

  final int maxLength;
  final String label;

  @override
  State<PasswordInput> createState() => _PasswordInputState();   

}

class _PasswordInputState extends State<PasswordInput>{

  final _inputController = TextEditingController();

  bool showPassword = false;
  
  @override
  void dispose(){
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextField(
        controller: _inputController,
        maxLength: widget.maxLength,
        obscureText: !showPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          label: Text(widget.label),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 2
            )
          ),
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off
            ),
            onPressed: () => setState(() {
              showPassword = !showPassword;
            }),
          )
        ),
      ),
    );
  }

}