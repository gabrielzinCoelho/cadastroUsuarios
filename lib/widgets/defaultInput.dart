import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum validsInputTypes { text, email, number, phone}

const keyboardTypes = {
  validsInputTypes.text: TextInputType.text,
  validsInputTypes.email: TextInputType.emailAddress,
  validsInputTypes.number: TextInputType.number,
  validsInputTypes.phone: TextInputType.phone,
};

class DefaultInput extends StatefulWidget{

  const DefaultInput({super.key, this.maxLength = 30, required this.label, this.inputType = validsInputTypes.text});

  final int maxLength;
  final String label;
  final validsInputTypes inputType;

  @override
  State<DefaultInput> createState() => _DefaultInputState();   

}

class _DefaultInputState extends State<DefaultInput>{

  final _inputController = TextEditingController();
  
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
        keyboardType: keyboardTypes[widget.inputType],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          label: Text(widget.label),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 2
            )
          )
        ),
      ),
    );
  }

}