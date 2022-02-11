import 'dart:convert';
import 'package:bookmark_with_image_flutter/bookmark_entity.dart';
import 'package:bookmark_with_image_flutter/bookmark_item.dart';
import 'package:bookmark_with_image_flutter/scraping.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class BookmarkStore with ChangeNotifier {
  List<BookmarkItem> bookmarkList = [];
  late final Database _db;
  final String _table = 'bookmark';

  Future<void> init() async {
    sqfliteFfiInit();
    _db = await databaseFactoryFfi.openDatabase(
        join(await databaseFactoryFfi.getDatabasesPath(), 'data.db'));
    await _db.execute('CREATE TABLE IF NOT EXISTS $_table (' +
        '"url" text PRIMARY KEY NOT NULL,' +
        '"order" integer NOT NULL,' +
        '"title" text,' +
        '"thumbnailUrl" text,' +
        '"thumbnail" text,' +
        '"thumbnailExt" text)');
    await _db.execute('UPDATE $_table AS b1 SET "order" = (' +
        'SELECT new_order FROM (' +
        'SELECT url, ROW_NUMBER() OVER (ORDER BY "order") AS new_order FROM $_table' +
        ') AS b2 WHERE b1.url = b2.url)');
    var list = await _getList();
    bookmarkList = List.generate(list.length, (index) {
      return BookmarkItem(list[index].url, list[index].thumbnail);
    });
    notifyListeners();
  }

  Future<List<BookmarkEntity>> _getList() async {
    final List<Map<String, dynamic>> list = await _db.query(_table);
    return List.generate(list.length, (index) {
      return BookmarkEntity(
        url: list[index]['url'],
        order: list[index]['order'],
        title: list[index]['title'],
        thumbnailUrl: list[index]['thumbnailUrl'],
        thumbnailExt: list[index]['thumbnailExt'],
        thumbnail: list[index]['thubnail'] != null
            ? base64.decode(list[index]['thumbnail'])
            : null,
      );
    });
  }

  void deleteItem(String url) async {
    _db.delete(_table, where: 'url = ?', whereArgs: [url]);
    bookmarkList.removeWhere((element) => element.url == url);
    notifyListeners();
  }

  Future<void> addItem(String url) async {
    var entity = await Scraping().createBookmark(url);
    entity.order = await _getNewOrder();
    int insertedRows = await _db.insert(
      _table,
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    if (insertedRows != 0) {
      this.bookmarkList.add(new BookmarkItem(entity.url, entity.thumbnail));
      notifyListeners();
    }
  }

  Future<int> _getNewOrder() async {
    const String column = 'MAX("order")';
    var x = await _db.query(_table, columns: [column]);
    return x[0][column] != null ? (x[0][column] as int) + 1 : 1;
  }
}
