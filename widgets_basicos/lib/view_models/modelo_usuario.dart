import 'package:flutter/material.dart';
import 'package:widgets_basicos/models/Favoritos.dart';
import 'package:widgets_basicos/models/carga_Datos.dart';
import 'package:widgets_basicos/baseDeDatos/producto_dao.dart';

class ModeloUsuario extends ChangeNotifier {
  // Listado de favoritos
  List<Favorito> favorites = <Favorito>[];
  final ProductoDao _productoDao = ProductoDao();

  // Verifica si se ha iniciado sesión
  bool incioSesion = false;

  // Constructor
  ModeloUsuario() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    favorites = await _productoDao.readFav();
    notifyListeners();
  }

  void modificarBotonInicio(bool valor) {
    incioSesion = valor;
    notifyListeners();
  }

  Future<void> actualizarGrid() async {
    listadoProductos = [];
    await cargarDatos();
    notifyListeners();
  }

  // Cantidad de favoritos
  int get numFavorites => favorites.length;

  // Método para agregar el favorito
  void addFavorite(Favorito element) async {
    if (existFavorite(element.nombre) == -1) {
      await _productoDao.insertFav(element);
      favorites.add(element);
      notifyListeners();
    }
  }

  // Método para borrar el elemento
  void deleteFavorite(int favotiteIndex) async {
    final favorito = favorites[favotiteIndex];
    await _productoDao.deleteFav(favorito);
    favorites.removeAt(favotiteIndex);
    notifyListeners();
  }

  // Método para verificar si el favorito ya fue agregado
  int existFavorite(String nombreArticulo) {
    for (int i = 0; i < favorites.length; i++) {
      if (favorites[i].nombre == nombreArticulo) {
        // Devuelve la posición
        return i;
      }
    }

    // Si no encuentra el artículo devuelve -1
    return -1;
  }

  String _nombre = "";

  bool esAdmin = false;

  String get nombre => _nombre;

  void cambiarNombre(String nombreNuevo) {
    _nombre = nombreNuevo;
    notifyListeners();
  }

  void loginAdmin(bool esAdminis) {
    esAdmin = esAdminis;
    notifyListeners();
  }

  void upadteScreen() {
    notifyListeners();
  }
}
