import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class BookDataBase{

  static const  _DatabaseName = "bookDatabase.db" ;
  static const _Databseversion = '1.0';
  static const _TableName = "Books";


  // It's main purpose is to ensure that only one instance of that class ever exists in the application.
  BookDataBase._privateConstructor();


  static final BookDataBase instance = BookDataBase._privateConstructor();



  static Database? _database;

  Future<Database> get = database  async {
  _database?? = await initDatabase();
  return _database!
}


initDatabase() async {
    String path = join(getDatabasesPath(),  _DatabaseName){
      return  await  openDatabase( path , version:  _Databseversion , onCreate: oncreate) ;
    }
}

Future oncreate(Database db , int  version) async {


}



}
