import 'package:gest/db/component.dart';
import 'package:gest/db/family.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';
import 'dart:async';
import 'package:gest/db/user.dart';
import 'package:sqflite/sqflite.dart' show ConflictAlgorithm, Database, getDatabasesPath, openDatabase;

class userDatabase {

  static final familyName ='familyName';
  static final id='id';
  static final quantity='quantity';
  static final date='date';
  static final username='username';


  static final instance = userDatabase._init();

  static Database? _database;

  userDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('user5.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);
    return (openDatabase(path, version: 1, onCreate: _createDB));
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableUsers ( 
        ${Userfiled.id} $idType,
        ${Userfiled.username} $textType,
        ${Userfiled.password} $textType,
        ${Userfiled.phone} $textType,
        ${Userfiled.firstName} $textType,
        ${Userfiled.lastName} $textType
      )''');
    await db.execute('''
         create table $familytable (
          ${FamilyField.id} $idType,
          ${FamilyField.familyName} $textType
         )''');

    await db.execute('''CREATE TABLE $componenttable (
                ${ComponentField.id} $idType ,
                ${ComponentField.componentName}, $textType,
                ${ComponentField.quantity} $textType,
                ${ComponentField.date} $textType,
                FOREIGN KEY (cat) REFERENCES FamilyField (id)
                  ON DELETE NO ACTION ON UPDATE NO ACTION)''');



  }



  Future<User> getbyUsername(String Username, String pass) async {
    final db = await instance.database;
    final maps = await db.query(tableUsers,
        columns: Userfiled.values,
        where: '  ${Userfiled.username} = ? and ${Userfiled.password} = ?',
        whereArgs: [Username, pass]);
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('user : $Username not found');
    }
  }

  Future Close() async {
    final db = await instance.database;
    db.close();
  }

  Future<User> create(User User) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, User.toJson());
    return User.copy(id: id);
  }

  Future<Family> createFamily(Family family) async {
    final db = await instance.database;

    final id = await db.insert(familytable, family.toJson());
    return family.copy(id: id);
  }

  Future<Component> createComponent(Component component) async {
    final db = await instance.database;

    final id = await db.insert(componenttable, component.toJson());
    return component.copycomponent(id: id);
  }





  Future<List<Map<String, dynamic>>> getAllCat() async {
    Database db = await instance.database;
    var res= await db.rawQuery("SELECT $familyName FROM $familytable");

    return res;
  }



}





