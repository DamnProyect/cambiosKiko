import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:widgets_basicos/models/variables.dart';
import 'package:widgets_basicos/widgets/carrouser.dart';

class HomeScreenGrid extends StatefulWidget {
  const HomeScreenGrid({
    super.key,
  });

  @override
  State<HomeScreenGrid> createState() => _HomeScreenGridState();
}

class _HomeScreenGridState extends State<HomeScreenGrid> {
  //Controlador para manejar los botones  del slider
  final controller = CarouselController();
  int activeIndex = 0;
  List<String> heroImages = [
    "assets/images/Carrusel1.jpg",
    "assets/images/Carrusel2.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MiCarrusel(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //Selecciona la cantidad de productos que mostrara el grid
              itemCount: listadoProductos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 13,
                crossAxisSpacing: 13,
                //Extiende el largo de los elementos del grid
                mainAxisExtent: 220,
              ),
              itemBuilder: (context, index) {
                print(listadoProductos.length);

                return listadoProductos[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
