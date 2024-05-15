import 'package:widgets_basicos/baseDeDatos/database_helper.dart';
import 'package:widgets_basicos/models/Favoritos.dart';

class FavoritoDao {
  final database = DatabaseHelper.instance.db;

  Future<List<Favorito>> readAll2() async {
    final data = await database.query('favoritos');
    return data.map((e) => Favorito.fromMap(e)).toList();
  }

  Future<int> insertFav(Favorito favorito) async {
    return await database.insert('favoritos', {
      'id': favorito.id,
      'name': favorito.nombre,
      'precio': favorito.precio
    });
  }

  Future<void> updatePrecio(int id, int nuevoPrecio) async {
    Map<String, dynamic> row = {
      'precio': nuevoPrecio,
    };
    await database.update(
      'favoritos',
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> update(Favorito favorito) async {
    await database.update('favoritos', favorito.toMap(),
        where: 'id = ?', whereArgs: [favorito.id]);
  }

  Future<void> delete(Favorito favorito) async {
    await database.delete('favoritos', where: 'id = ?', whereArgs: [favorito.id]);
  }
}
