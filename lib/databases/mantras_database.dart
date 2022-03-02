import 'package:railway_opt/databases/app_database.dart';
import 'package:railway_opt/model/mantra_model.dart';
import 'package:sqflite/sqflite.dart';

class MantraDatabase extends AppDatabase {
  final String _tableName = "mantras";

  Future<List<MantraModel>> getMantras() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: 'id DESC',
    );

    if (maps.isEmpty) return [];
    return maps.map((map) => MantraModel.fromJson(map)).toList();
  }

  Future<bool> find(String code) async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      columns: ['code'],
      where: 'code = ?',
      whereArgs: [code],
    );
    return maps.isNotEmpty;
  }

  Future<int> remove(String code) async {
    final db = await database;

    return db.delete(
      _tableName,
      where: 'code = ?',
      whereArgs: [code],
    );
  }

  Future<MantraModel> insert(MantraModel model) async {
    final db = await database;

    final id = await db.insert(
      _tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return model.copyWith(
      id: id,
    );
  }
}
