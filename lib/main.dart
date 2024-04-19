import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_basicos/screens/Home_page.dart';
import 'package:widgets_basicos/models/variables.dart';

void main() {
  runApp(
    //Implemento el notificador de estado
    ChangeNotifierProvider(
      create: (context) => ModeloUsuario(),
      child: const MyApp(),
    ),
  );
  CargarDatos();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Temas de la aplicacion, texto, colores etc
      theme: ThemeData(
        //Texto de la app
        fontFamily: 'Georgia',
      ),
      //La propiedad home es el inicio de la app, desde alli ya se manejan los demas widget que la componen
      home: HomePage(),
    );
  }
}

//Creo el modelo donde se guardan los metodos y las variables que pueden cambiar
class ModeloUsuario extends ChangeNotifier {
  String _nombre = "";

  String get nombre => _nombre;

  void cambiarNombre(String nombreNuevo) {
    _nombre = nombreNuevo;
    notifyListeners();
  }
}
