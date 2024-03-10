import 'package:example/arch/migration_observer/migration_observer.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class MigrationObserverLogger implements MigrationObserver {
  @protected
  final Logger logger;

  MigrationObserverLogger(this.logger);

  @override
  Future<void> onCreate(int createdVersion) async {
    logger.d('SharedPrefs onCreate $createdVersion');
  }

  @override
  Future<void> onMissedMigration(int version) async {
    logger.e('SharedPrefs onMissedMigration  $version');
  }

  @override
  Future<void> onUpgrade(int fromVersion, int toVersion) async {
    logger.e('SharedPrefs onUpgrade $fromVersion -> $toVersion');
  }
}
