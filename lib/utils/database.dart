/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:path/path.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUtil {
  static var databasesPath;
  String path;
  final String dbname = 'user.db';
  Database database;
  String userTable='User';




  init() async {
    databasesPath = await getDatabasesPath();
    path = join(databasesPath, dbname);
    _createDatabase();

  }

  Future<bool> databaseExists(String path) =>
      databaseFactory.databaseExists(path);

  _createDatabase() async {
// Get a location using getDatabasesPath

 /*   bool db_flag = await databaseExists(path);
    if (db_flag == true) {
      return;
    }*/

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE '+userTable+' (userId VARCHAR(20) PRIMARY KEY, userdata TEXT,usertype int)');
    });

  }

  _openDb() async {
   await init();
     database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(databasesPath, dbname),
    );
  }

  closeDb(){
    if(database!=null){
      database.close();
    }
  }
  /*Insert Data */

insertStudentData(StudentDataModel userData)async{
  await _openDb();
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        "INSERT INTO "+userTable+"(userId,userdata,usertype) VALUES('"+userData.activeUserCode+"','"+userData.toRawJson()+"','"+userType.parent.toString()+"');");
    print('inserted1: $id1');

    //    print('inserted2: $id2');
  });

}

getLoggedUser()async{
  await _openDb();
  List<dynamic> d= await database.rawQuery('SELECT * FROM "'+userTable+'"');
return d;

}



}
