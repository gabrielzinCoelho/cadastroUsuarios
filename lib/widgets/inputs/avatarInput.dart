import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AvatarInput extends StatefulWidget{

  AvatarInput(this.onUpdateImage, this.selectedImage, {super.key});

  File? selectedImage;
  void Function(File updatedFile) onUpdateImage;

  @override
  State<AvatarInput> createState() => _AvatarInputState();

}

class _AvatarInputState extends State<AvatarInput>{

  final imagePicker = ImagePicker();

  void handleInputImage() async {

    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 150);

    if(pickedImage == null){
      return;
    }

    widget.onUpdateImage(File(pickedImage.path));
  }

  @override
  Widget build(BuildContext context){

    Widget inputImageWidget = widget.selectedImage == null ?
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 248, 206, 255)
        ),
        child: TextButton.icon(
          onPressed: handleInputImage, 
          icon: const Icon(Icons.camera),
          label: const Text(
            "Tire uma foto"
          )
        ),
      )
      :
      GestureDetector(
        onTap: handleInputImage,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.circle
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.file(
            widget.selectedImage!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      );

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: Colors.purple[900]!
        ),
      ),
      width: 150,
      height: 150,
      clipBehavior: Clip.hardEdge,
      child: inputImageWidget,
    );
  }

}