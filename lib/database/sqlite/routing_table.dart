//
// import 'dart:io' as io;
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:sqflite/sqflite.dart';
//
// import '../../model/dto/database_record/locatioin_table_record.dart';
// import '../../model/dto/database_record/notification_messages_table_record.dart';
// import '../../model/dto/database_record/routing_table_record.dart';
//
// //Using for saving routing points
// class RoutingTable{
//
//   static Database database;
//   static String table = 'routing_points_table';
//   static String databaseName = 'routing_points_table.db';
//
//   static initDB() async {
//     io.Directory documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, databaseName);
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }
//
//
//   static _onCreate(Database db,int version) async{
//     db.execute(
//         "CREATE TABLE $table ("
//         "id TEXT,"
//         "lat TEXT,"
//         "lng TEXT"
//         ")");
//   }
//
//
//   static Future<Database> get db async {
//     if (database != null){
//       return database;
//     }
//     database = await initDB();
//     return database;
//   }
//
//
//   static Future<bool> isTableEmpty() async{
//     var dbClient = await db;
//     int count = 0;
//     count = (await dbClient.rawQuery("SELECT COUNT(*) FROM $table"))[0]['COUNT(*)'];
//     return count == 0 ? true : false;
//   }
//
//
//
//   static Future<void> insertRoutingPoints({required List<RoutingTableRecord> points}) async{
//     var dbClient = await db;
//     for(int i=0; i<points.length; i++){
//       await dbClient.insert(
//           table,
//           RoutingTableRecord.toMap(
//               points[i]
//           )
//       );
//     }
//   }
//
//
//   static Future<List<RoutingTableRecord>> getAllRoutingPoints() async{
//     var dbClient = await db;
// //    List<Map> maps = await dbClient.query(table,columns: ['','']);
//     List<Map> routingPoints = await dbClient.rawQuery("SELECT * FROM $table");
//     return List.generate(routingPoints.length, (index) => RoutingTableRecord.fromMap(routingPoints[index]));
//   }
//
//   static Future<void> deleteByRange(String start, String end)async{
//     var dbClient = await db;
//     await dbClient.rawQuery("delete from $table where id between $start and $end");
//     // return dbClient.delete(table,where: 'id = ?',whereArgs: [id]);
//   }
//
//   static Future<void> deleteAllRoutingPoints()async{
//     var dbClient = await db;
//     await dbClient.rawQuery("DELETE FROM $table");
//     // return dbClient.delete(table,where: 'id = ?',whereArgs: [id]);
//   }
//
//
//   static Future close() async{
//     var dbClient = await db;
//     dbClient.close();
//   }
//
// }
//
