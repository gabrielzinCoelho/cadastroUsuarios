import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateTimeInput extends StatefulWidget{

  const DateTimeInput({super.key, this.maxLength = 30, required this.label});

  final int maxLength;
  final String label;

  @override
  State<DateTimeInput> createState() => _DateTimeInputState();   

}

class _DateTimeInputState extends State<DateTimeInput>{

  _DateTimeInputState(){
    now = DateTime.now();
    firstDate = DateTime(now.year - 100, now.month, now.day);
  }

  final _inputController = TextEditingController();

  late final DateTime now;
  late final DateTime firstDate;

  @override
  void dispose(){
    _inputController.dispose();
    super.dispose();
  }

  void handleDatePicker() async{


    final pickedData = await showDatePicker(
      context: context, 
      initialDate: now, 
      firstDate: firstDate, 
      lastDate: now
    );

    _inputController.text = pickedData.toString();

  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextField(
        controller: _inputController,
        onTap: handleDatePicker,
        readOnly: true,
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