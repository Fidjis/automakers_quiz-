import 'dart:async';
import 'dart:io';

import 'package:automakers_quiz/core/domain/models/ranking_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "AutomakersDBv04.db");
    return await openDatabase(path, version: 3, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Ranking ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "hit INT"
          ")");
    });
  }

  Future<int> newRanking(Ranking newRanking) async {
    final db = await database;
    var table = await db!.rawQuery("SELECT MAX(id)+1 as id FROM Ranking");
    final id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into Ranking (id,name,hit)"
        " VALUES (?,?,?)",
        [id, newRanking.name, newRanking.hit]);
    return raw;
  }

  Future<int> updateRanking(Ranking newRanking) async {
    final db = await database;
    var res = await db!.update("Ranking", newRanking.toMap(), where: "id = ?", whereArgs: [newRanking.id]);
    return res;
  }

  Future<Ranking?> getRanking(int id) async {
    final db = await database;
    var res = await db!.query("Ranking", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Ranking.fromMap(res.first) : null;
  }

  Future<List<Ranking>> getTopFiveRankings() async {
    final db = await database;
    var res = await db!.query("Ranking", orderBy: 'hit DESC', limit: 5);
    List<Ranking> list = res.isNotEmpty ? res.map((c) => Ranking.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<Ranking>> getAllRankings() async {
    final db = await database;
    var res = await db!.query("Ranking");
    List<Ranking> list = res.isNotEmpty ? res.map((c) => Ranking.fromMap(c)).toList() : [];
    return list;
  }

  deleteRanking(int id) async {
    final db = await database;
    return db!.delete("Ranking", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db!.rawDelete("Delete * from Ranking");
  }
}
