import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_basicos/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Guardan el contenido del textField
  final textControlerUsuario = TextEditingController();
  final textControlerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Es importante que los demas widgets tengan el mismo consumer y contexto para poder
    //usar los datos del modelo.
    return Consumer<ModeloUsuario>(
      builder: (context, ModeloUsuario, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "Iniciar sesión",
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            body: Center(
              child: Container(
                margin: EdgeInsets.only(
                    bottom: 50.0), // Ajusta este valor según sea necesario
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nombre de usuario", // Texto para el campo de usuario
                      style: TextStyle(fontSize: 13), // Estilo del texto
                    ),
                    SizedBox(height: 10), // Espacio entre el texto y el campo de texto
                    SizedBox(
                      width: 350,
                      child: TextField(
                        //TextFiel usuario
                        controller: textControlerUsuario,
                        autofocus: false,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            fillColor: Colors.grey.shade300,
                            border: InputBorder.none,
                            focusColor: Colors.blue,
                            filled: true),
                        cursorColor: Colors.indigoAccent,
                      ),
                    ),
                    SizedBox(height: 20), // Espacio entre los campos de texto
                    Text(
                      "Contraseña", // Texto para el campo de contraseña
                      style: TextStyle(fontSize: 13), // Estilo del texto
                    ),
                    SizedBox(height: 10), // Espacio entre el texto y el campo de texto
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: textControlerPass,
                        autofocus: false,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.password),
                            fillColor: Colors.grey.shade300,
                            border: InputBorder.none,
                            focusColor: Colors.blue,
                            filled: true),
                        cursorColor: Colors.indigoAccent,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      child: Text('Iniciar sesión'),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
                //Modifico el nombre en el home
                ModeloUsuario.cambiarNombre(textControlerUsuario.text);
                //Limpia los campos
                textControlerUsuario.clear();
                textControlerPass.clear();
              },
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
