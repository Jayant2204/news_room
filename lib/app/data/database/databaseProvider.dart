import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBProvider {
  // Create a singleton
  DBProvider._();

  static final DBProvider instance = DBProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  _onOpen(Database db) async {
    // Database is open, print its version
  }

  /// Create News table V1
  void _createTableNews(Database db, int version) {
    db.execute('''CREATE TABLE IF NOT EXISTS news(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT NOT NULL,
                    author TEXT,
                    token TEXT DEFAULT '',
                    created_at TEXT DEFAULT '',
                    updated_at TEXT DEFAULT '')''');
  }

  initDB() async {
    // Get the location of our app directory. This is where files for our app,
    // and only our app, are stored. Files in this directory are deleted
    // when the app is deleted.
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'news_room.db');

    try {
      return await openDatabase(path,
          version: 1,
          onOpen: _onOpen,
          onCreate: _createTableNews,
          onDowngrade: onDatabaseDowngradeDelete);
    } catch (e) {
      throw e;
    }
  }
}
