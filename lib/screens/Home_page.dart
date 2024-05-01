import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:widgets_basicos/main.dart';
import 'package:widgets_basicos/screens/carrito.dart';
import 'package:widgets_basicos/screens/homeScreenGrid.dart';
import 'package:widgets_basicos/screens/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String saludo = "Bienvenido ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () => _showLoginForm(context),
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          saludo + context.watch<ModeloUsuario>().nombre,
          style: GoogleFonts.playfairDisplay(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
      ),
      body: [
        HomeScreenGrid(),
        CarritoPage(),
      ][currentIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Carrito"),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }

  void _showLoginForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return LoginPage();
      },
      isScrollControlled: true,
    );
  }
}
