import 'dart:io';
import 'package:hello_world/student.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const DATABASE_NAME = "college.db";
  static const TABLE_NAME = "student";
  static const ROLL = "roll";
  static const EMAIL = "email";
  static const PASS = "pass";
  static const DATABASE_VERSION = 1;

  DatabaseHelper._();

  static final DatabaseHelper databaseHelper = DatabaseHelper._();
  static Database _database;

  //get database object here
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  //initialize db here
  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);
    return await openDatabase(path,
        version: 1, onOpen: (db) {}, onCreate: _onCreate);
  }

   //create table here
  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE_NAME ("
        "$ROLL INTEGER PRIMARY KEY,"
        "$EMAIL TEXT,"
        "$PASS TEXT)");
  }

  //insert student here
  Future<int> insertStudent(Student student) async {
    // Get a reference to the database.
    final Database db = await database;
    return await db.insert(
      '$TABLE_NAME',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Fetch all student from table
  Future<List<Student>> allStudents() async {
    // Get a reference to the database.
    final Database db = await database;
    // Query the table for all The Students.
    final List<Map<String, dynamic>> maps = await db.query('$TABLE_NAME');
    // Convert the List<Map<String, dynamic> into a List<Student>.
    return List.generate(maps.length, (i) {
      return Student(
        roll: maps[i]['$ROLL'],
        email: maps[i]['$EMAIL'],
        pass: maps[i]['$PASS'],
      );
    });
  }

  //update student base on roll number
  Future<void> updateStudent(Student student) async {
    // Get a reference to the database.
    final db = await database;
    await db.update(
      '$TABLE_NAME',
      student.toMap(),
      where: "$ROLL = ?",
      whereArgs: [student.roll],
    );
  }

  //delete student here
  Future<void> deleteStudent(int roll) async {
    // Get a reference to the database.
    final db = await database;
    await db.delete(
      '$TABLE_NAME',
      where: "$ROLL = ?",
      whereArgs: [roll],
    );
  }

  //login here
  Future<Student> login(String email, String pass) async {
    final db = await database;
    var res=await db.query('$TABLE_NAME',where:'$EMAIL=? and $PASS=?',whereArgs:[email,pass]);
    if (res.length > 0) {
      return Student.fromMap(res.first);
    }
    return null;
  }
}
