import 'package:cadastro_usuarios/widgets/buttonHandleForm.dart';
import 'package:cadastro_usuarios/widgets/inputs/dateTimeInput.dart';
import 'package:cadastro_usuarios/widgets/inputs/defaultInput.dart';
import 'package:cadastro_usuarios/widgets/inputs/passwordInput.dart';
import 'package:flutter/widgets.dart';

class AddUser extends StatefulWidget{

  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();

}

class _AddUserState extends State<AddUser>{


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
              Image.asset(
                "assets/logoEmakers.png",
                height: 120,
              ),
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
              const DefaultInput(label: "Nome"),
              const DefaultInput(label: "Email", inputType: validsInputTypes.email),
              const DefaultInput(label: "Celular", inputType: validsInputTypes.phone),
              const DateTimeInput(label: "Data de Nascimento"),
              const PasswordInput(label: "Senha", maxLength: 20),
              const PasswordInput(label: "Confirmar senha", maxLength: 20),
              const SizedBox( height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonHandleForm(label: "Cancelar", callbackButtonPressed: ()=>Navigator.pop(context)),
                  const SizedBox(width: 10),
                  ButtonHandleForm(label: "Salvar", callbackButtonPressed: ()=>null,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}