import 'package:drift/drift.dart';
import 'package:example/arch/drfit_migrator/drift_migrator.dart';
import 'package:flutter/widgets.dart' hide Table;

part 'app_database.g.dart';

/// Сущность для отображения базы данных Moor
/// В случае добавления новых табилц или Dao, нужно их добавлять в UseMoor
@DriftDatabase(
  tables: [],
  daos: [],
)
class AppDatabase extends _$AppDatabase {
  @protected
  final DriftMigrator<AppDatabase> migrator;

  @override
  MigrationStrategy get migration => migrator.delegateStrategy(this);

  @override
  int get schemaVersion => migrator.schemaVersion;

  AppDatabase({
    required QueryExecutor queryExecutor,
    required this.migrator,
  }) : super(queryExecutor);
}
