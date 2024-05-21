class Favorito {
  final int id;
  final String imagen;
  final String nombre;
  final int precio;

  Favorito({
    required this.id,
    required this.imagen,
    required this.nombre,
    required this.precio,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'image': imagen,
      'name': nombre,
      'price': precio,
    };
  }
}
