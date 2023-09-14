import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter{

  // (xx) 9xxxx-xxxx

  NumberFormatter({required this.mask, required this.replaceable}){

    int count = 0;

    for(int i = 0; i<mask.length; i++){
      if(mask[i] == replaceable){
        count++;
      }
    }
    maskValidCharsLength = count;

  }
  
  final String mask, replaceable;
  late final int maskValidCharsLength;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue){

    if(oldValue.text.length > newValue.text.length){
      return newValue;
    }
    
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]+'), '');

    if(newText.length > maskValidCharsLength){
      newText = newText.substring(0, maskValidCharsLength);
    }

    int i = 0;
    int j;

    while(i < newText.length){

      if(mask[i] != replaceable){

        j = i + 1;
        while(j < mask.length && mask[j] != replaceable){
          j++;
        }
        //(37) 91096605
        //(xx) 9xxxx-xxxx
        // print(newText);
        // print(newText.substring(0, i));
        // print(mask.substring(i, j));
        // print(newText.substring(i, newText.length));
        if(newText.length < j){
          newText = newText.substring(0, i) + mask.substring(i, j) + newText.substring(i, newText.length);
           i = j;
        }else{

          while(i < j){
            if(mask[i] != newText[i]){
              newText = newText.substring(0, i) + mask[i] + newText.substring(i, newText.length);
            }
            i++;
          }

        }
        
       
      }

      i++;
    }
    
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length)
    );

  }

}