import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Guardan el contenido del textField
  final textControlerUsuario = TextEditingController();
  final textControlerPass = TextEditingController();
  final textControlerBirthDate = TextEditingController();
  final textEmail = TextEditingController();
  final textMobile = TextEditingController();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Pantalla'),
      ),
      body: Center(
        child: Text('Contenido de la nueva pantalla'),
      ),
    );
  }
} 
