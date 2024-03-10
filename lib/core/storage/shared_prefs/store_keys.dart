import 'package:example/arch/key_value_store_migrator/key_value_store.dart';

/// Статическое хранилище ключей [TypeStoreKey] используемых в приложении
class StoreKeys {
  static final prefsVersionKey = TypeStoreKey<int>('prefs_version_key');
}
