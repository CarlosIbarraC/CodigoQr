import 'dart:io';
import 'package:codigoqr/models/scan_models.dart';
export 'package:codigoqr/models/scan_models.dart';
import 'package:path/path.dart';
import 'package:codigoqr/pages/directions_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<dynamic> initDB() async {
    //path de donde almacenaremos la BD
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(''
          'CREATE TABLE Scans (id INTEGER PRIMARY KEY, tipo TEXT, valor TEXT)'
          '');
    });
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan, String s) async {
    final db = await database;
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    final res = await db.rawInsert('''
INSERT INTO Scans($id,'$tipo','$valor')
VALUES()
''');
    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
   
    return res;
    
  }

  Future<dynamic> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<dynamic> getAllScan() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromJson(e)).toList()
        : null;
  }

  Future<dynamic> getScanType(String tipo) async {
    final db = await database;
    final res =
        await db.rawQuery('''SELECT * FROM Scans WHERE tipo = '$tipo' ''');
    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromJson(e)).toList()
        : null;
  }

  // ignore: non_constant_identifier_names
  Future<int> UpdateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id=?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }

// metodo dos de borrado total.
  /* Future<int> deleteAllScanL(int id) async {
    final db = await database;
    final res = await db.rawDelete(''' DELETE FROM  Scans''');
    return res;
  } */
  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id=?', whereArgs: [nuevoScan.id]);
    return res;
  }
}
