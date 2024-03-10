// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;

import '../arch/key_value_store_migrator/key_value_store.dart' as _i4;
import '../arch/key_value_store_migrator/key_value_store_migrator.dart' as _i11;
import '../arch/migration_observer/database/app_database.dart' as _i10;
import '../arch/migration_observer/database/db_module.dart' as _i13;
import '../core/infrastructure/infrastructure_module.dart' as _i12;
import '../core/infrastructure/logger_bloc_observer.dart' as _i8;
import '../core/storage/migration_observer_logger/migration_observer_logger.dart'
    as _i9;
import '../core/storage/shared_prefs/prefs_key_value_store.dart' as _i5;
import 'app_environment.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final infrastructureModule = _$InfrastructureModule();
  final dbModule = _$DbModule();
  gh.lazySingleton<_i3.Connectivity>(() => infrastructureModule.connectivity());
  gh.lazySingleton<_i4.KeyValueStore>(() => _i5.SharedPrefsKeyValueStore());
  gh.lazySingleton<_i6.Logger>(
      () => infrastructureModule.logger(gh<_i7.AppEnvironment>()));
  gh.factory<_i8.LoggerBlocObserver>(
      () => _i8.LoggerBlocObserver(gh<_i6.Logger>()));
  gh.lazySingleton<_i9.MigrationObserverLogger>(
      () => _i9.MigrationObserverLogger(gh<_i6.Logger>()));
  gh.lazySingleton<_i10.AppDatabase>(
      () => dbModule.appDatabase(observer: gh<_i9.MigrationObserverLogger>()));
  gh.lazySingleton<_i11.KeyValueStoreMigrator>(
      () => _i5.KeyValueStoreMigratorImpl(
            keyValueStore: gh<_i4.KeyValueStore>(),
            observer: gh<_i9.MigrationObserverLogger>(),
          ));
  return getIt;
}

class _$InfrastructureModule extends _i12.InfrastructureModule {}

class _$DbModule extends _i13.DbModule {}
