import 'dart:async';

import 'package:example/app/app.dart';
import 'package:example/app/app_environment.dart';
import 'package:example/app/runner.config.dart';
import 'package:example/arch/key_value_store_migrator/key_value_store.dart';
import 'package:example/arch/key_value_store_migrator/key_value_store_migrator.dart';
import 'package:example/core/infrastructure/logger_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  ignoreUnregisteredTypes: [
    AppEnvironment,
  ],
)
class Runner {
  static Future<void> run(
    AppEnvironment appEnvironment,
  ) async {
    await initializeFlutterPluginsAndDependencies(
      appEnvironment: appEnvironment,
    );
    if (appEnvironment.enableBlocLogs) {
      Bloc.observer = GetIt.I.get<LoggerBlocObserver>();
    }

    FlutterError.onError = (details) {
      GetIt.I.get<Logger>().e(
            'Flutter Error: ${details.exception}',
            stackTrace: details.stack,
          );
    };
    runApp(const App());
  }

  static Future<void> initializeFlutterPluginsAndDependencies({
    required AppEnvironment appEnvironment,
  }) async {
    //================================= DI =================================
    await configureDependencies(appEnvironment: appEnvironment);

    //================================= DB =================================
    // Производим миграции [KeyValueStore]
    await GetIt.I.get<KeyValueStore>().init();
    await GetIt.I.get<KeyValueStoreMigrator>().migrate();

    // //================================= Логирование =================================
    // final easyLoggerWrapper = GetIt.I.get<EasyLoggerWrapper>();
    // EasyLocalization.logger = EasyLogger(
    //   name: '🌎 Easy Localization',
    //   printer: (appEnvironment.enableEasyLocalizationLogs)
    //       ? easyLoggerWrapper.log
    //       : easyLoggerWrapper.stubLog,
    // );

    // //================================= Локализация =================================
    // await EasyLocalization.ensureInitialized();
  }

  static Future<void> configureDependencies({
    required AppEnvironment appEnvironment,
  }) async {
    GetIt.I.registerSingleton<AppEnvironment>(appEnvironment);

    $initGetIt(
      GetIt.instance,
      environment: appEnvironment.buildType.getItEnvironmentKey,
    );
  }
}
