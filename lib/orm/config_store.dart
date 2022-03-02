import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'config_store.g.dart';

class Config extends Table {
  TextColumn get id => text().withDefault(const Constant('config'))();
  TextColumn get browserPath => text().named('browserPath').nullable()();
  TextColumn get launchOptions => text().named('launchOptions').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Config])
class ConfigStore extends _$ConfigStore {
  ConfigStore() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<ConfigData> get get => select(config).getSingle();

  Future<void> set(ConfigCompanion con) {
    return into(config).insertOnConflictUpdate(con);
  }
}
