import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance => _databaseHelper ??= DatabaseHelper._internal();

  Database? _db;
  Database get db => _db!;

  // Función de inicialización
  Future<void> init() async {
    if (_db != null) return; // Previene la reinicialización si la DB ya está inicializada

    _db = await openDatabase(
      join(await getDatabasesPath(), 'database.db'), // Asegura el uso de la ruta correcta
      version: 1,
      onCreate: (db, version) async {
        print("Creating database..."); // Log de creación de base de datos

        // Tabla productos
        await db.execute(
          'CREATE TABLE productos (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price INTEGER DEFAULT 1, image TEXT, desc TEXT)',
        );
        print("Table 'productos' created."); // Log de creación de tabla

        // Tabla de carrito
        await db.execute(
          'CREATE TABLE carrito (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, cantidad INTEGER DEFAULT 1)',
        );
        print("Table 'carrito' created."); // Log de creación de tabla

        // Tabla de usuarios
        await db.execute(
          'CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT, email TEXT, phoneNumber TEXT)',
        );
        print("Table 'usuarios' created."); // Log de creación de tabla

        // Tabla de favoritos
        await db.execute(
          'CREATE TABLE favoritos (id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT, name TEXT, price INTEGER DEFAULT 1)',
        );
        print("Table 'favoritos' created."); // Log de creación de tabla
      },
      onOpen: (db) async {
        print("Database opened"); // Log de apertura de base de datos
      },
    );
  }

  // Función de eliminar la base de datos
  /*
  Future<void> deleteDatabase() async {
    final dbPath = join(await getDatabasesPath(), 'database.db');
    await databaseFactory.deleteDatabase(dbPath);
    print("Database deleted");
  }
  */
}
