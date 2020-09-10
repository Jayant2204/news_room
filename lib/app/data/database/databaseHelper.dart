import 'package:news_room/app/data/model/newsList.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'dart:async';

import 'databaseProvider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database db;

  DatabaseHelper.internal();

  initDb() async {
    DBProvider dbProvider = DBProvider.instance;
    db = await dbProvider.database;
  }

  Future<int> saveUser(Article article) async {
    try {
      int res = await db.insert("news", article.toJson());
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Article> getArticle(int id) async {
    var row = await db.query('news', where: 'id = ?', whereArgs: [id]);
    if (row != null && row.length > 0) {
      return row.isNotEmpty ? Article.fromJson(row.first) : false;
    }
    return null;
  }

  Future<List<Article>> getArticleList() async {
    try {
      var rows = await db.query('news', orderBy: 'id DESC');
      if (rows != null && rows.length > 0) {
        return rows.isNotEmpty
            ? rows.map((location) => Article.fromJson(location)).toList()
            : [];
      }
      return [];
    } catch (e) {
      throw e;
    }
  }

  Future<int> deleteArticles() async {
    return db.rawDelete('Delete from news');
  }
}
