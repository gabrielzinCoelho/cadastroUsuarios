import 'package:flutter/services.dart';

class DefaultFormatter extends TextInputFormatter{

  const DefaultFormatter();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue){
    return newValue;
  }

}