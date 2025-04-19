//
// import 'dart:io' as io;
// import 'package:bargram_technical_manager/view/widget/shared/alert.dart';
// import 'package:flutter/material.dart';
// import 'package:bargram_technical_manager/model/dto/database_record/reserved_loads_table_record.dart';
// import 'package:path/path.dart';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:sqflite/sqflite.dart';
//
// //Using for saving reserved loads
// class ReservedLoadsTable{
//
//   static Database database;
//   static String table = 'reserved_lo_table';
//   static String databaseName = 'reserved_lo_table.db';
//
//   static initDB() async {
//     io.Directory documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, databaseName);
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }
//
//   static _onCreate(Database db,int version) async{
//     db.execute(
//         "CREATE TABLE $table ("
//         "load_id TEXT,"
//         "reserve_id TEXT"
//         ")");
//   }
//
//   static Future<Database> get db async {
//     if (database != null){
//       return database;
//     }
//     database = await initDB();
//     return database;
//   }
//
//   static Future<void> insertLoad({required String loadId, required String reserveId}) async{
//     var dbClient = await db;
//     await dbClient.insert(
//         table,
//         ReservedLoadsTableRecord.toMap(
//             ReservedLoadsTableRecord(
//               loadId: loadId,
//               reserveId: reserveId
//             )
//         )
//     );
//   }
//
//   static Future<List<ReservedLoadsTableRecord>> getAllLoads() async{
//     var dbClient = await db;
// //    List<Map> maps = await dbClient.query(table,columns: ['','']);
//     List<Map> loads = await dbClient.rawQuery("SELECT * FROM $table");
//     return List.generate(loads.length, (index) => ReservedLoadsTableRecord.fromMap(loads[index]));
//   }
//
//   static Future<List<String>> getAllLoadsId() async{
//     var dbClient = await db;
// //    List<Map> maps = await dbClient.query(table,columns: ['','']);
//     List<Map> loads = await dbClient.rawQuery("SELECT * FROM $table");
//     return List.generate(loads.length, (index) => loads[index]['load_id']);
//   }
//
//   static Future<String> getReserveIdByLoadId(String loadId) async{
//     var dbClient = await db;
//     List<Map> loads = await dbClient.rawQuery("SELECT * FROM $table WHERE load_id = ?",[loadId]);
//     if(loads.isNotEmpty){
//       return ReservedLoadsTableRecord.fromMap(loads[0]).reserveId;
//     }
//     return null;
//   }
//
//   static Future<bool> loadIsExistByLoadId(String loadId) async{
//     var dbClient = await db;
//     List<Map> maps = await dbClient.rawQuery("SELECT * FROM $table WHERE load_id = ?",[loadId]);
//     if(maps.isEmpty){
//       return false;
//     }
//     return true;
//   }
//
//   static Future<void> deleteAllLoads(BuildContext context)async{
//     var dbClient = await db;
//     try{
//       await dbClient.rawQuery("DELETE FROM $table");
//     }
//     catch(err){
//       alert(context:context, title:'', message:'reserved loads db $err');
//     }
//     // return dbClient.delete(table,where: 'id = ?',whereArgs: [id]);
//   }
//
//   static Future<bool> deleteLoadById(String loadId)async{
//     var dbClient = await db;
//     // dbClient.delete(table,where: 'id = ?',whereArgs: [loadId]);
//     int changed = await dbClient.rawDelete("DELETE FROM $table WHERE load_id = ?",[loadId]);
//     if(changed > 0){
//       return true;
//     }
//     return false;
//   }
//
//   static Future close() async{
//     var dbClient = await db;
//     dbClient.close();
//   }
//
// }
//
