import 'dart:io' as io;
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqflite.dart';

import '../../model/dto/database_record/locatioin_table_record.dart';



//Using for saving location points
class LocationTable{

  static Database? database;
  static String table = 'location_table';
  static String databaseName = 'location_table.db';

  static initDB() async {
    io.Directory documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }


  static _onCreate(Database db,int version) async{
    db.execute(
        "CREATE TABLE $table ("
        "lat TEXT,"
        "lng TEXT,"
        "date TEXT"
        ")");
  }


  static Future<Database> get db async {
    if (database != null){
      return database!;
    }
    database = await initDB();
    return database!;
  }


  Future<void> insertLocation({required String lat, required String lng, required String date, required String speed}) async{
    var dbClient = await db;

    //using for our update on older dbs in user devices
    if(await isColumnExist('speed') == false) {
      await addColumn('speed');
    }

    await dbClient.insert(
        table,
        LocationTableRecord.toMap(LocationTableRecord(lat:lat, lng:lng, date:date, speed:speed))
    );
  }

  Future<bool> isColumnExist(String columnName) async{
    var dbClient = await db;
    dynamic isColumnExist;
    try{
    isColumnExist = await dbClient.rawQuery("Select $columnName From $table");
    }catch(err){}
    if(isColumnExist == null){
      return false;
    }
    return true;
  }

  Future<bool> addColumn(String columnName) async{
    var dbClient = await db;
    dynamic addColumnResult;
    try{
      addColumnResult = await dbClient.rawQuery("ALTER TABLE $table ADD COLUMN $columnName TEXT;");
    }catch(err){}
    if(addColumnResult == null){
      return false;
    }
    return true;
  }

  static Future<List<LocationTableRecord>> getAllLocations() async{
    var dbClient = await db;
//    List<Map> maps = await dbClient.query(table,columns: ['','']);
    List<Map> locations = await dbClient.rawQuery("SELECT * FROM $table");
    return List.generate(locations.length, (index) => LocationTableRecord.fromMap(locations[index]));
  }


  static Future<void> deleteAllLocations()async{
    var dbClient = await db;
    await dbClient.rawQuery("DELETE FROM $table");
    // return dbClient.delete(table,where: 'id = ?',whereArgs: [id]);
  }


  static Future close() async{
    var dbClient = await db;
    dbClient.close();
  }

}

