import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqflite.dart';
import '../../model/dto/database_record/car_types_table_record.dart';




//Using for saving car types
class CarTypesTable{

  static Database? database;
  static String table = 'car_type_table';
  static String databaseName = 'car_type_table.db';

  static initDB() async {
    io.Directory documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static _onCreate(Database db,int version) async{
    db.execute(
        "CREATE TABLE $table ("
        "id TEXT,"
        "title TEXT,"

        "max_weight TEXT,"
        "min_weight TEXT"
        ")");
  }

  static Future<Database> get db async {
    if (database != null){
      return database!;
    }
    database = await initDB();
    return database!;
  }

  static Future<void> insertCarTypes({required List<CarTypesTableRecord> carTypes}) async{
    var dbClient = await db;
    for(int i=0; i<carTypes.length; i++){
      await dbClient.insert(
          table,
          CarTypesTableRecord.toMap(
              carTypes[i]
          )
      );
    }
  }

  static Future<List<CarTypesTableRecord>> getAllCarTypes() async{
    var dbClient = await db;
//    List<Map> maps = await dbClient.query(table,columns: ['','']);
    List<Map> carTypes = await dbClient.rawQuery("SELECT * FROM $table");
    return List.generate(carTypes.length, (index) => CarTypesTableRecord.fromMap(carTypes[index]));
  }


  static Future<void> deleteAllCarTypes()async{
    var dbClient = await db;
    await dbClient.rawQuery("DELETE FROM $table");
    // return dbClient.delete(table,where: 'id = ?',whereArgs: [id]);
  }


  static Future close() async{
    var dbClient = await db;
    dbClient.close();
  }

}

