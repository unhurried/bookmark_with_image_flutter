// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_store.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BookmarkData extends DataClass implements Insertable<BookmarkData> {
  final String url;
  final int order;
  final String? title;
  final String? thumbnailUrl;
  final String? thumbnail;
  final String? thumbnailExt;
  BookmarkData(
      {required this.url,
      required this.order,
      this.title,
      this.thumbnailUrl,
      this.thumbnail,
      this.thumbnailExt});
  factory BookmarkData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BookmarkData(
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      thumbnailUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnailUrl']),
      thumbnail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thubnail']),
      thumbnailExt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnailExt']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['url'] = Variable<String>(url);
    map['order'] = Variable<int>(order);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnailUrl'] = Variable<String?>(thumbnailUrl);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thubnail'] = Variable<String?>(thumbnail);
    }
    if (!nullToAbsent || thumbnailExt != null) {
      map['thumbnailExt'] = Variable<String?>(thumbnailExt);
    }
    return map;
  }

  BookmarkCompanion toCompanion(bool nullToAbsent) {
    return BookmarkCompanion(
      url: Value(url),
      order: Value(order),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      thumbnailExt: thumbnailExt == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailExt),
    );
  }

  factory BookmarkData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkData(
      url: serializer.fromJson<String>(json['url']),
      order: serializer.fromJson<int>(json['order']),
      title: serializer.fromJson<String?>(json['title']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      thumbnailExt: serializer.fromJson<String?>(json['thumbnailExt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'url': serializer.toJson<String>(url),
      'order': serializer.toJson<int>(order),
      'title': serializer.toJson<String?>(title),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'thumbnailExt': serializer.toJson<String?>(thumbnailExt),
    };
  }

  BookmarkData copyWith(
          {String? url,
          int? order,
          String? title,
          String? thumbnailUrl,
          String? thumbnail,
          String? thumbnailExt}) =>
      BookmarkData(
        url: url ?? this.url,
        order: order ?? this.order,
        title: title ?? this.title,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        thumbnail: thumbnail ?? this.thumbnail,
        thumbnailExt: thumbnailExt ?? this.thumbnailExt,
      );
  @override
  String toString() {
    return (StringBuffer('BookmarkData(')
          ..write('url: $url, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('thumbnailExt: $thumbnailExt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(url, order, title, thumbnailUrl, thumbnail, thumbnailExt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkData &&
          other.url == this.url &&
          other.order == this.order &&
          other.title == this.title &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.thumbnail == this.thumbnail &&
          other.thumbnailExt == this.thumbnailExt);
}

class BookmarkCompanion extends UpdateCompanion<BookmarkData> {
  final Value<String> url;
  final Value<int> order;
  final Value<String?> title;
  final Value<String?> thumbnailUrl;
  final Value<String?> thumbnail;
  final Value<String?> thumbnailExt;
  const BookmarkCompanion({
    this.url = const Value.absent(),
    this.order = const Value.absent(),
    this.title = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.thumbnailExt = const Value.absent(),
  });
  BookmarkCompanion.insert({
    required String url,
    required int order,
    this.title = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.thumbnailExt = const Value.absent(),
  })  : url = Value(url),
        order = Value(order);
  static Insertable<BookmarkData> custom({
    Expression<String>? url,
    Expression<int>? order,
    Expression<String?>? title,
    Expression<String?>? thumbnailUrl,
    Expression<String?>? thumbnail,
    Expression<String?>? thumbnailExt,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (order != null) 'order': order,
      if (title != null) 'title': title,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (thumbnail != null) 'thubnail': thumbnail,
      if (thumbnailExt != null) 'thumbnailExt': thumbnailExt,
    });
  }

  BookmarkCompanion copyWith(
      {Value<String>? url,
      Value<int>? order,
      Value<String?>? title,
      Value<String?>? thumbnailUrl,
      Value<String?>? thumbnail,
      Value<String?>? thumbnailExt}) {
    return BookmarkCompanion(
      url: url ?? this.url,
      order: order ?? this.order,
      title: title ?? this.title,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      thumbnail: thumbnail ?? this.thumbnail,
      thumbnailExt: thumbnailExt ?? this.thumbnailExt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnailUrl'] = Variable<String?>(thumbnailUrl.value);
    }
    if (thumbnail.present) {
      map['thubnail'] = Variable<String?>(thumbnail.value);
    }
    if (thumbnailExt.present) {
      map['thumbnailExt'] = Variable<String?>(thumbnailExt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkCompanion(')
          ..write('url: $url, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('thumbnailExt: $thumbnailExt')
          ..write(')'))
        .toString();
  }
}

class $BookmarkTable extends Bookmark
    with TableInfo<$BookmarkTable, BookmarkData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  @override
  late final GeneratedColumn<String?> thumbnailUrl = GeneratedColumn<String?>(
      'thumbnailUrl', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String?> thumbnail = GeneratedColumn<String?>(
      'thubnail', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _thumbnailExtMeta =
      const VerificationMeta('thumbnailExt');
  @override
  late final GeneratedColumn<String?> thumbnailExt = GeneratedColumn<String?>(
      'thumbnailExt', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [url, order, title, thumbnailUrl, thumbnail, thumbnailExt];
  @override
  String get aliasedName => _alias ?? 'bookmark';
  @override
  String get actualTableName => 'bookmark';
  @override
  VerificationContext validateIntegrity(Insertable<BookmarkData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('thumbnailUrl')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnailUrl']!, _thumbnailUrlMeta));
    }
    if (data.containsKey('thubnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thubnail']!, _thumbnailMeta));
    }
    if (data.containsKey('thumbnailExt')) {
      context.handle(
          _thumbnailExtMeta,
          thumbnailExt.isAcceptableOrUnknown(
              data['thumbnailExt']!, _thumbnailExtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  BookmarkData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BookmarkData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BookmarkTable createAlias(String alias) {
    return $BookmarkTable(attachedDatabase, alias);
  }
}

abstract class _$BookmarkStore extends GeneratedDatabase {
  _$BookmarkStore(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BookmarkTable bookmark = $BookmarkTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bookmark];
}
