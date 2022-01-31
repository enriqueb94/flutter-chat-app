import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_inputs.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Logo(titulo: 'Messenger'),
              _Form(),
              Labels(
                ruta: 'register',
                titulo: 'No tienes una cuenta?',
                subTitulo: 'Crear Cuenta',
              ),
              Text(
                'Terminos y condiciones de uso',
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: ctrlEmail,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: ctrlPass,
            isPassword: true,
          ),
          BotonAzul(
            onPressed: () {
              debugPrint(ctrlEmail.text);
              debugPrint(ctrlPass.text);
            },
            text: 'Ingrese',
          )
        ],
      ),
    );
  }
}
