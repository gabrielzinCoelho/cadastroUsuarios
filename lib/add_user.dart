import 'package:cadastro_usuarios/models/user.dart';
import 'package:cadastro_usuarios/widgets/buttonHandleForm.dart';
import 'package:cadastro_usuarios/widgets/inputs/avatarInput.dart';
import 'package:cadastro_usuarios/widgets/inputs/dateTimeInput.dart';
import 'package:cadastro_usuarios/widgets/inputs/defaultInput.dart';
import 'package:cadastro_usuarios/widgets/inputs/passwordInput.dart';
import 'package:flutter/widgets.dart';
import "dart:io";

class AddUser extends StatefulWidget{

  AddUser({super.key, this.user, required this.onSubmitUser});
  final void Function(User user) onSubmitUser;

  @override
  State<AddUser> createState() => _AddUserState();
  User? user;

}

class _AddUserState extends State<AddUser>{

  @override
  void dispose(){
    _inputNameController.dispose();
    super.dispose();
  }

  void handleFormSubmit(){
    //validar inputs
    widget.onSubmitUser(
      User(
        id: widget.user?.id,
        name: _inputNameController.text,
        phone: _inputPhoneController.text,
        email: _inputEmailController.text,
        password: _inputPasswordController.text,
        birthDate: selectedDate!,
        // avatar: avatarFile
      )
    );
    
  }

  final _inputNameController = TextEditingController();
  final _inputEmailController = TextEditingController();
  final _inputPhoneController = TextEditingController();
  final _inputPasswordController = TextEditingController();
  final _inputConfirmPasswordController = TextEditingController();

  DateTime? selectedDate;
  File? avatarFile;

  void handleInputDate(DateTime updatedDate){
    setState(() {
      selectedDate = updatedDate;
    });
  }
  void handleInputFile(File updatedFile){
    setState(() {
      avatarFile = updatedFile;
    });
  }

  @override
  void initState(){
    super.initState();
    if(widget.user == null){
      return;
    }

    _inputNameController.text = widget.user!.name;
    _inputEmailController.text = widget.user!.email;
    _inputPhoneController.text = widget.user!.phone;
    _inputPasswordController.text = widget.user!.password;
    
    selectedDate = widget.user!.birthDate;
    avatarFile = widget.user!.avatar;
    
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(
        30, 50, 30, (MediaQuery.of(context).viewInsets.bottom + 30)
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarInput(handleInputFile, avatarFile),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "CADASTRO",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold              
                ),
              ),
              DefaultInput(_inputNameController, label: "Nome"),
              DefaultInput(_inputEmailController, label: "Email", inputType: validsInputTypes.email),
              DefaultInput(_inputPhoneController, label: "Celular", inputType: validsInputTypes.phone),
              DateTimeInput(handleInputDate, selectedDate, label: "Data de Nascimento"),
              PasswordInput(_inputPasswordController, label: "Senha", maxLength: 20),
              PasswordInput(_inputConfirmPasswordController, label: "Confirmar senha", maxLength: 20),
              const SizedBox( height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonHandleForm(label: "Cancelar", callbackButtonPressed: ()=>Navigator.pop(context)),
                  const SizedBox(width: 10),
                  ButtonHandleForm(label: "Salvar", callbackButtonPressed: (){
                    handleFormSubmit();
                    Navigator.pop(context);
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}