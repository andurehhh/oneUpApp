import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  //Singleton Instance
  static final DatabaseHelper _instance = DatabaseHelper._init();

  static Database? _database;

  //private Constructor
  DatabaseHelper._init();

  //getter to get the database
Future<Database> get database async {
  if(_database != null){
    return _database!;
  }
  else{
    _database = await _initDB();
    return _database!;
  }
}

  Future<Database> _initDB() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'goals.db'),
        onCreate: (db,version){
          return db.execute(
            'CREATE TABLE IF NOT EXISTS goals_db('
                'goalId INTEGER PRIMARY KEY,'
                'goalName TEXT NOT NULL,'
                'goalDescription TEXT,'
                'daysToRemind TEXT,'
                'startDate TEXT NOT NULL,'
                'endDate TEXT,'
                'notifyTime TEXT,'
                'isRepeating INTEGER NOT NULL,'
                'isComplete INTEGER NOT NULL,'
                'orderIndex INTEGER NOT NULL'
                ');');
        },
      version: 1,
    );
  }
}
