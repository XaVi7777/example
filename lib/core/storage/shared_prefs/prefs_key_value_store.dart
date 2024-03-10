import 'package:example/arch/key_value_store_migrator/key_value_store.dart';
import 'package:example/arch/key_value_store_migrator/key_value_store_migrator.dart';
import 'package:example/core/storage/migration_observer_logger/migration_observer_logger.dart';
import 'package:example/core/storage/shared_prefs/store_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Базовая реализация над [KeyValueStore] для [SharedPreferences]
///
/// Перед использованием необходимо вызывать [init]
@LazySingleton(as: KeyValueStore)
class SharedPrefsKeyValueStore implements KeyValueStore {
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<T?> read<T>(TypeStoreKey<T> typedStoreKey) async =>
      _sharedPreferences.get(typedStoreKey.key) as T?;

  @override
  Future<bool> contains(TypeStoreKey<dynamic> typedStoreKey) async =>
      _sharedPreferences.containsKey(typedStoreKey.key);

  @override
  Future<void> write<T>(TypeStoreKey<T> typedStoreKey, T? value) async {
    if (value == null) {
      await _sharedPreferences.remove(typedStoreKey.key);

      return;
    }
    switch (T) {
      case const (int):
        await _sharedPreferences.setInt(typedStoreKey.key, value as int);
      case const (String):
        await _sharedPreferences.setString(typedStoreKey.key, value as String);
      case const (double):
        await _sharedPreferences.setDouble(typedStoreKey.key, value as double);
      case const (bool):
        await _sharedPreferences.setBool(typedStoreKey.key, value as bool);
      case const (List):
        await _sharedPreferences.setStringList(
            typedStoreKey.key, value as List<String>);
    }
  }
}

@LazySingleton(as: KeyValueStoreMigrator)
class KeyValueStoreMigratorImpl extends KeyValueStoreMigrator {
  KeyValueStoreMigratorImpl({
    required super.keyValueStore,
    required MigrationObserverLogger super.observer,
  }) : super(
          migrations: {},
          schemaVersion: 1,
          schemaVersionKey: StoreKeys.prefsVersionKey,
        );
}
