import 'package:example/arch/drfit_migrator/drift_migrator.dart';
import 'package:example/arch/migration_observer/database/app_database.dart';
import 'package:example/arch/migration_observer/database/db_query_executor/shared.dart';
import 'package:example/core/storage/migration_observer_logger/migration_observer_logger.dart';
import 'package:injectable/injectable.dart';

/// Модуль для поставления зависимостей, связанных с БД Moor
@module
abstract class DbModule {
  /// При необходимости новой миграции нужно увеличить версию [schemaVersion] (N)
  /// Реализовать новую миграцию на версию N - MoorMigrationN, и добавить ее в перечень [migration]
  @lazySingleton
  AppDatabase appDatabase({
    required MigrationObserverLogger observer,
  }) {
    return AppDatabase(
      queryExecutor: createQueryExecutor(),
      migrator: DriftMigrator<AppDatabase>(
        migrationLogics: {},
        schemaVersion: 1,
        observer: observer,
      ),
    );
  }
}
