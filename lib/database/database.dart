import 'dart:async';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../models/quote_model.dart';

class QuoteTable {
  static const tableName = "quote_table";
  static const id = "_id";
  static const quote = "quote";
  static const author = "author";
  static const isFavorite = "isFavorite";
}

class DataBase {
  static final DataBase _DataBase = DataBase._();

  factory DataBase() {
    return _DataBase;
  }

  DataBase._();

  Future<sql.Database> openDB() async {
    var appPath = await getApplicationDocumentsDirectory();
    var dbPath = join(appPath.path, 'quoteDB.db');
    return await sql.openDatabase(dbPath, onCreate: (db, version) {
      db.execute(""" CREATE TABLE ${QuoteTable.tableName} (
      ${QuoteTable.id} INTEGER PRIMARY KEY ,
      ${QuoteTable.quote} TEXT ,
      ${QuoteTable.author} TEXT ,
      ${QuoteTable.isFavorite} INTEGER 
      ) """);
    }, version: 1);
  }

  void addQuote(Quote quote) async {
    var db = await openDB();
    db.insert(QuoteTable.tableName, quote.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.ignore);
  }

  void removeQuote(int id) async {
    var db = await openDB();
    db.delete(QuoteTable.tableName,
        where: "${QuoteTable.id} =? ", whereArgs: [id]);
  }

  void removeFromFavoriteList(Quote quote) async {
    var db = await openDB();
    quote.isFavorite = false;
    db.update(QuoteTable.tableName, quote.toMap(),
        where: '${QuoteTable.id} =? ', whereArgs: [quote.id]);
  }

  void addToFavoriteList(Quote quote) async {
    var db = await openDB();
    quote.isFavorite = true;
    db.update(QuoteTable.tableName, quote.toMap(),
        where: '${QuoteTable.id} =? ', whereArgs: [quote.id]);
  }

  Future<List<Quote>> getAllQuote() async {
    var db = await openDB();
    var list = await db.query(
      QuoteTable.tableName,
      orderBy: QuoteTable.id,
    );
    return [...list.map((e) => Quote.fromDataBase(e)).toList()];
  }
}
