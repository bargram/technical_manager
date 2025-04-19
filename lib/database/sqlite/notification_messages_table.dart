import 'dart:io' as io;
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqflite.dart';

import '../../model/dto/database_record/notification_messages_table_record.dart';




//Using for saving reserved loads
class NotificationMessagesTable{

  static Database? database;
  static String table = 'notification_messages_table';
  static String databaseName = 'notification_messages_table.db';

  static initDB() async {
    io.Directory documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static _onCreate(Database db,int version) async{
    db.execute(
        "CREATE TABLE $table ("
        "title TEXT,"
        "body TEXT,"
        "date TEXT"
        ")");
  }

  static Future<Database?> get db async {
    if (database != null){
      return database;
    }
    database = await initDB();
    return database;
  }

  static Future<void> insertMessage({required String? title, required String? body, required String? date}) async{
    // print('**********************************************');
    // print('inserting message');
    // print('**********************************************');
    var dbClient = await db;
    await dbClient!.insert(
        table,
        NotificationMessagesTableRecord.toMap(
            NotificationMessagesTableRecord(
              title: title.toString(),
              body: body.toString(),
              date: date.toString()
            )
        )
    );
  }


  static Future<List<NotificationMessagesTableRecord>> getAllMessages() async{
    var dbClient = await db;
//    List<Map> maps = await dbClient.query(table,columns: ['','']);
    List<Map> messages = await dbClient!.rawQuery("SELECT * FROM $table");
    return List.generate(messages.length, (index) => NotificationMessagesTableRecord.fromMap(messages[index]));
  }


  static Future<void> deleteAllMessages()async{
    var dbClient = await db;
    await dbClient!.rawQuery("DELETE FROM $table");
    // return dbClient.delete(table,where: 'id = ?',whereArgs: [id]);
  }


  static Future close() async{
    var dbClient = await db;
    dbClient!.close();
  }

}

