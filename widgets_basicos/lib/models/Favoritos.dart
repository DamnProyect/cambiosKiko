class Favorito {
  final int id;
  final String nombre;
  final int precio;

  Favorito({
    this.id = -1,
    required this.nombre,
    this.precio = 1
  });

  Favorito copyWith({int? id, String? nombre, int? precio}) {
    return Favorito(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        precio: precio ?? this.precio);
  }

  factory Favorito.fromMap(Map<String, dynamic> map) {
    return Favorito(
        id: map['id'], nombre: map['name'], precio: map['precio']);
  }

  Map<String, dynamic> toMap() =>
      {'id': id, 'name': nombre, 'precio': precio};

}
