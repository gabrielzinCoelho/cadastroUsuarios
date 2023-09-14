import 'package:cadastro_usuarios/widgets/inputs/defaultFormatter.dart';
import 'package:cadastro_usuarios/widgets/inputs/numberFormatter.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum validsInputTypes { text, email, number, phone}

final numberFormatter = MaskTextInputFormatter(
  mask: "(xx) 9xxxx-xxxx",
  filter: { "x": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy
);
// final numberFormatter = NumberFormatter(mask: "(xx) 9xxxx-xxxx", replaceable: "x");
const defaultFormatter = DefaultFormatter();

const keyboardTypes = {
  validsInputTypes.text: TextInputType.text,
  validsInputTypes.email: TextInputType.emailAddress,
  validsInputTypes.number: TextInputType.number,
  validsInputTypes.phone: TextInputType.phone,
};

final inputFormatters = {
  validsInputTypes.text: defaultFormatter,
  validsInputTypes.email: defaultFormatter,
  validsInputTypes.number: defaultFormatter,
  validsInputTypes.phone: numberFormatter,
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
  late final inputFormatter;

  @override
  void dispose(){
    _inputController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    inputFormatter = inputFormatters[widget.inputType];
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextField(
        inputFormatters: [
          inputFormatter
        ],
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