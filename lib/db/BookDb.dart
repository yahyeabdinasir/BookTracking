import 'package:flutter/material.dart';
import 'package:google_books_api/google_books_api.dart';
import 'package:read_tracking/models/books.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookDataBase {
  static const _DatabaseName = "bookDatabase.db";

  static const _Databseversion = 1;
  static const _TableName = "Books";

  // It's main purpose is to ensure that only one instance of that class ever exists in the application.
  BookDataBase._privateConstructor();

  static final BookDataBase instance = BookDataBase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //  this is used to create the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _DatabaseName);

    return await openDatabase(
      path,
      version: _Databseversion,
      onCreate: _oncreate,
    );
  }

  //  abuur table database that called table name
  Future _oncreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_TableName (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        authors TEXT NOT NULL,
        favorite INTEGER DEFAULT 0,
        publisher TEXT,
        publishedDate TEXT,
        description TEXT,
        industryIdentifiers TEXT,
        pageCount INTEGER,
        language TEXT,
        imageLinks TEXT,
        previewLink TEXT,
        infoLink TEXT
      )
    ''');
  }

  //  insert book into the database
  Future<int> Insert(Books book) async {
    Database db = await instance.database;
    return await db.insert(_TableName, book.toJson());
  }

  //  read books from the database
  Future<List<Books>> FetchBooks() async {
    Database db = await instance.database;
    var book = await db.query(_TableName);
    return book.isNotEmpty
        ? book.map((bookItem) => Books.fromJsonDatabase(bookItem)).toList()
        : [];
  }

  Future<int> ToggleFavorite(String id, bool Isfavorite) async {
    Database db = await BookDataBase.instance.database;
    return db.update(
      BookDataBase._TableName,
      {'favorite': Isfavorite ? 1 : 0},
      //  the ud will be dynamic doe the ?
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
