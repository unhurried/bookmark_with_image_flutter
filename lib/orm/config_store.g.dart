// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_store.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ConfigData extends DataClass implements Insertable<ConfigData> {
  final String id;
  final String? browserPath;
  final String? launchOptions;
  ConfigData({required this.id, this.browserPath, this.launchOptions});
  factory ConfigData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ConfigData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      browserPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}browserPath']),
      launchOptions: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}launchOptions']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || browserPath != null) {
      map['browserPath'] = Variable<String?>(browserPath);
    }
    if (!nullToAbsent || launchOptions != null) {
      map['launchOptions'] = Variable<String?>(launchOptions);
    }
    return map;
  }

  ConfigCompanion toCompanion(bool nullToAbsent) {
    return ConfigCompanion(
      id: Value(id),
      browserPath: browserPath == null && nullToAbsent
          ? const Value.absent()
          : Value(browserPath),
      launchOptions: launchOptions == null && nullToAbsent
          ? const Value.absent()
          : Value(launchOptions),
    );
  }

  factory ConfigData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigData(
      id: serializer.fromJson<String>(json['id']),
      browserPath: serializer.fromJson<String?>(json['browserPath']),
      launchOptions: serializer.fromJson<String?>(json['launchOptions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'browserPath': serializer.toJson<String?>(browserPath),
      'launchOptions': serializer.toJson<String?>(launchOptions),
    };
  }

  ConfigData copyWith(
          {String? id, String? browserPath, String? launchOptions}) =>
      ConfigData(
        id: id ?? this.id,
        browserPath: browserPath ?? this.browserPath,
        launchOptions: launchOptions ?? this.launchOptions,
      );
  @override
  String toString() {
    return (StringBuffer('ConfigData(')
          ..write('id: $id, ')
          ..write('browserPath: $browserPath, ')
          ..write('launchOptions: $launchOptions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, browserPath, launchOptions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigData &&
          other.id == this.id &&
          other.browserPath == this.browserPath &&
          other.launchOptions == this.launchOptions);
}

class ConfigCompanion extends UpdateCompanion<ConfigData> {
  final Value<String> id;
  final Value<String?> browserPath;
  final Value<String?> launchOptions;
  const ConfigCompanion({
    this.id = const Value.absent(),
    this.browserPath = const Value.absent(),
    this.launchOptions = const Value.absent(),
  });
  ConfigCompanion.insert({
    this.id = const Value.absent(),
    this.browserPath = const Value.absent(),
    this.launchOptions = const Value.absent(),
  });
  static Insertable<ConfigData> custom({
    Expression<String>? id,
    Expression<String?>? browserPath,
    Expression<String?>? launchOptions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (browserPath != null) 'browserPath': browserPath,
      if (launchOptions != null) 'launchOptions': launchOptions,
    });
  }

  ConfigCompanion copyWith(
      {Value<String>? id,
      Value<String?>? browserPath,
      Value<String?>? launchOptions}) {
    return ConfigCompanion(
      id: id ?? this.id,
      browserPath: browserPath ?? this.browserPath,
      launchOptions: launchOptions ?? this.launchOptions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (browserPath.present) {
      map['browserPath'] = Variable<String?>(browserPath.value);
    }
    if (launchOptions.present) {
      map['launchOptions'] = Variable<String?>(launchOptions.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigCompanion(')
          ..write('id: $id, ')
          ..write('browserPath: $browserPath, ')
          ..write('launchOptions: $launchOptions')
          ..write(')'))
        .toString();
  }
}

class $ConfigTable extends Config with TableInfo<$ConfigTable, ConfigData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfigTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant('config'));
  final VerificationMeta _browserPathMeta =
      const VerificationMeta('browserPath');
  @override
  late final GeneratedColumn<String?> browserPath = GeneratedColumn<String?>(
      'browserPath', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _launchOptionsMeta =
      const VerificationMeta('launchOptions');
  @override
  late final GeneratedColumn<String?> launchOptions = GeneratedColumn<String?>(
      'launchOptions', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, browserPath, launchOptions];
  @override
  String get aliasedName => _alias ?? 'config';
  @override
  String get actualTableName => 'config';
  @override
  VerificationContext validateIntegrity(Insertable<ConfigData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('browserPath')) {
      context.handle(
          _browserPathMeta,
          browserPath.isAcceptableOrUnknown(
              data['browserPath']!, _browserPathMeta));
    }
    if (data.containsKey('launchOptions')) {
      context.handle(
          _launchOptionsMeta,
          launchOptions.isAcceptableOrUnknown(
              data['launchOptions']!, _launchOptionsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfigData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ConfigData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConfigTable createAlias(String alias) {
    return $ConfigTable(attachedDatabase, alias);
  }
}

abstract class _$ConfigStore extends GeneratedDatabase {
  _$ConfigStore(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ConfigTable config = $ConfigTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [config];
}
