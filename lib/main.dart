import 'dart:async';
import 'dart:convert';

import 'package:example/app/app_environment.dart';
import 'package:example/app/runner.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';

void main() async {
  Future<Map<String, dynamic>> loadConfig() async {
    final configString = await rootBundle.loadString(Assets.config);
    return json.decode(configString) as Map<String, dynamic>;
  }

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final config = await loadConfig();
    final appLogLevel = AppLogLevels.getFromString(
        config['logLevel'] as String? ?? 'defaultLogLevel');
    final enableLogs = appLogLevel != AppLogLevel.off;
    final debugInstrumentsEnv = (config['debugInstruments'] ?? false) as bool;
    final buildType = !kReleaseMode || debugInstrumentsEnv
        ? BuildType.debug
        : BuildType.release;
    await Runner.run(
      AppEnvironment(
        buildType: buildType,
        debugOptions: DebugOptions(
          debugShowCheckedModeBanner: buildType == BuildType.debug,
        ),
        logLevel: appLogLevel ?? AppLogLevel.trace,
        enableBlocLogs: enableLogs,
        enableRoutingLogs: enableLogs,
        enableDioLogs: enableLogs,
        enableEasyLocalizationLogs: false,
      ),
    );
  }, (error, stack) {
    Logger().e('Ошибка при инициализации приложения: $error');
  });
}
