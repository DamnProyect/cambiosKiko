class ProductoModel {
  final int id;
  int cantidad;
  final String name;

  ProductoModel({
    this.id = -1,
    required this.name,
    this.cantidad = 1,
  });

  // Método para crear una copia del modelo con nuevos valores
  ProductoModel copyWith({int? id, int? cantidad, String? name}) {
    return ProductoModel(
        id: id ?? this.id,
        cantidad: cantidad ?? this.cantidad,
        name: name ?? this.name);
  }

  // Método para crear una instancia del modelo a partir de un mapa
  factory ProductoModel.fromMap(Map<String, dynamic> map) {
    return ProductoModel(
        id: map['id'], name: map['name'], cantidad: map['cantidad']);
  }

  // Método para convertir la instancia del modelo a un mapa
  Map<String, dynamic> toMap() =>
      {'id': id, 'name': name, 'cantidad': cantidad};
}
