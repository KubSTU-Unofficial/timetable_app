// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GroupsTable extends Groups with TableInfo<$GroupsTable, GroupsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instituteMeta = const VerificationMeta(
    'institute',
  );
  @override
  late final GeneratedColumn<String> institute = GeneratedColumn<String>(
    'institute',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [name, institute];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<GroupsEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('institute')) {
      context.handle(
        _instituteMeta,
        institute.isAcceptableOrUnknown(data['institute']!, _instituteMeta),
      );
    } else if (isInserting) {
      context.missing(_instituteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  GroupsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupsEntry(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      institute: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institute'],
      )!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class GroupsEntry extends DataClass implements Insertable<GroupsEntry> {
  final String name;
  final String institute;
  const GroupsEntry({required this.name, required this.institute});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['institute'] = Variable<String>(institute);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(name: Value(name), institute: Value(institute));
  }

  factory GroupsEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupsEntry(
      name: serializer.fromJson<String>(json['name']),
      institute: serializer.fromJson<String>(json['institute']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'institute': serializer.toJson<String>(institute),
    };
  }

  GroupsEntry copyWith({String? name, String? institute}) => GroupsEntry(
    name: name ?? this.name,
    institute: institute ?? this.institute,
  );
  GroupsEntry copyWithCompanion(GroupsCompanion data) {
    return GroupsEntry(
      name: data.name.present ? data.name.value : this.name,
      institute: data.institute.present ? data.institute.value : this.institute,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupsEntry(')
          ..write('name: $name, ')
          ..write('institute: $institute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, institute);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupsEntry &&
          other.name == this.name &&
          other.institute == this.institute);
}

class GroupsCompanion extends UpdateCompanion<GroupsEntry> {
  final Value<String> name;
  final Value<String> institute;
  final Value<int> rowid;
  const GroupsCompanion({
    this.name = const Value.absent(),
    this.institute = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupsCompanion.insert({
    required String name,
    required String institute,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       institute = Value(institute);
  static Insertable<GroupsEntry> custom({
    Expression<String>? name,
    Expression<String>? institute,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (institute != null) 'institute': institute,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupsCompanion copyWith({
    Value<String>? name,
    Value<String>? institute,
    Value<int>? rowid,
  }) {
    return GroupsCompanion(
      name: name ?? this.name,
      institute: institute ?? this.institute,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (institute.present) {
      map['institute'] = Variable<String>(institute.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('name: $name, ')
          ..write('institute: $institute, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $GroupsTable groups = $GroupsTable(this);
  late final GroupsDao groupsDao = GroupsDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [groups];
}

typedef $$GroupsTableCreateCompanionBuilder =
    GroupsCompanion Function({
      required String name,
      required String institute,
      Value<int> rowid,
    });
typedef $$GroupsTableUpdateCompanionBuilder =
    GroupsCompanion Function({
      Value<String> name,
      Value<String> institute,
      Value<int> rowid,
    });

class $$GroupsTableFilterComposer extends Composer<_$Database, $GroupsTable> {
  $$GroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get institute => $composableBuilder(
    column: $table.institute,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GroupsTableOrderingComposer extends Composer<_$Database, $GroupsTable> {
  $$GroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get institute => $composableBuilder(
    column: $table.institute,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GroupsTableAnnotationComposer
    extends Composer<_$Database, $GroupsTable> {
  $$GroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get institute =>
      $composableBuilder(column: $table.institute, builder: (column) => column);
}

class $$GroupsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $GroupsTable,
          GroupsEntry,
          $$GroupsTableFilterComposer,
          $$GroupsTableOrderingComposer,
          $$GroupsTableAnnotationComposer,
          $$GroupsTableCreateCompanionBuilder,
          $$GroupsTableUpdateCompanionBuilder,
          (GroupsEntry, BaseReferences<_$Database, $GroupsTable, GroupsEntry>),
          GroupsEntry,
          PrefetchHooks Function()
        > {
  $$GroupsTableTableManager(_$Database db, $GroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<String> institute = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GroupsCompanion(
                name: name,
                institute: institute,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required String institute,
                Value<int> rowid = const Value.absent(),
              }) => GroupsCompanion.insert(
                name: name,
                institute: institute,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $GroupsTable,
      GroupsEntry,
      $$GroupsTableFilterComposer,
      $$GroupsTableOrderingComposer,
      $$GroupsTableAnnotationComposer,
      $$GroupsTableCreateCompanionBuilder,
      $$GroupsTableUpdateCompanionBuilder,
      (GroupsEntry, BaseReferences<_$Database, $GroupsTable, GroupsEntry>),
      GroupsEntry,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
}
