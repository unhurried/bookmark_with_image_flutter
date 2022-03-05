import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import '../bookmark_item.dart';
import '../scraping.dart';

part 'bookmark_store.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bookmark.sqlite'));
    return NativeDatabase(file);
  });
}

class Bookmark extends Table {
  TextColumn get url => text().named('url')();
  IntColumn get order => integer().named('order')();
  TextColumn get title => text().named('title').nullable()();
  TextColumn get thumbnailUrl => text().named('thumbnailUrl').nullable()();
  TextColumn get thumbnail => text().named('thubnail').nullable()();
  TextColumn get thumbnailExt => text().named('thumbnailExt').nullable()();

  @override
  Set<Column> get primaryKey => {url};
}

@DriftDatabase(tables: [Bookmark])
class BookmarkStore extends _$BookmarkStore with c.ChangeNotifier {
  BookmarkStore() : super(_openConnection());

  List<BookmarkItem> bookmarkList = [];

  @override
  int get schemaVersion => 1;

  getList() async {
    var list = await select(bookmark).get();
    bookmarkList = list
        .map((e) => BookmarkItem(
            e.url, e.thumbnail != null ? base64.decode(e.thumbnail!) : null))
        .toList();
    notifyListeners();
  }

  Future<void> addItem(String url) async {
    var entity = await Scraping().createBookmark(url);
    await into(bookmark).insert(
      BookmarkData(
          url: entity.url,
          order: await _getNewOrder(),
          thumbnail: entity.thumbnail == null
              ? null
              : base64.encode(entity.thumbnail!),
          thumbnailUrl: entity.thumbnailUrl,
          thumbnailExt: entity.thumbnailExt),
    );
    getList();
  }

  Future<int> _getNewOrder() async {
    final colMaxOrder = bookmark.order.max();
    var query = selectOnly(bookmark)..addColumns([colMaxOrder]);
    var maxOrder = await query.map((row) => row.read(colMaxOrder)).getSingle();
    return maxOrder == null ? 1 : maxOrder + 1;
  }

  Future<void> deleteItem(String url) async {
    await (delete(bookmark)..where((tbl) => tbl.url.equals(url))).go();
    getList();
  }
}
