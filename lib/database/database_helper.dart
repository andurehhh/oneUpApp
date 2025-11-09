import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/goal.dart';

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
            'CREATE TABLE IF NOT EXISTS goals_tbl('
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

  Future<List<Goal>> getAllGoals() async{
    List<Goal> goals = [];
    final db = await database;
    final List<Map<String,Object?>> goalMaps = await db.query('goals_tbl',orderBy: 'orderIndex');

    for(var rawGoal in goalMaps){
      Goal goal = Goal.fromMap(rawGoal);
      goals.add(goal);
    }
    return goals;
  }

  Future<void> insertGoal(Goal goal) async{
    final db = await database;
    await db.insert('goals_tbl',goal.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateGoal(Goal goal) async{
    final db = await database;
    await db.update('goals_tbl', goal.toMap(), where: 'goalId = ?',whereArgs: [goal.goalId]);
  }

  Future<void> deleteGoal (Goal goal) async{
    final db = await database;
    await db.delete('goals_tbl',where: 'goalId = ?', whereArgs: [goal.goalId]);
  }

}
