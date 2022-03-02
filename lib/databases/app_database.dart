import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  late Database _database;

  Future<Database> get database async {
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'mantra.db');

    return await openDatabase(
      path,
      version: 3,
      onCreate: _createTable,
    );
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute("CREATE TABLE mantras(id INTEGER PRIMARY KEY AUTOINCREMENT, code TEXT, interval TEXT,qrCode TEXT)");
  }
}