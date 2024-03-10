import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'app_environment.freezed.dart';
part 'app_environment.g.dart';

@freezed
class AppEnvironment with _$AppEnvironment {
  /// [buildType] - вид билда приложения
  /// [debugOptions] - набор debug-flutter настроек приложения
  /// [logLevel] - минимальный логируемый уровень лог-системы приложения
  /// [enableEasyLocalizationLogs] - параметр управляющий включением/выключением логов слоя локализации
  /// [enableBlocLogs] - параметр управляющий включением/выключением логов Bloc слоя
  /// [enableRoutingLogs] - параметр управляющий включением/выключением логов Routing слоя
  /// [enableDioLogs] - параметр управляющий включением/выключением логов http слоя
  const factory AppEnvironment({
    required BuildType buildType,
    required DebugOptions debugOptions,
    required AppLogLevel logLevel,
    required bool enableEasyLocalizationLogs,
    required bool enableBlocLogs,
    required bool enableRoutingLogs,
    required bool enableDioLogs,
  }) = _AppEnvironment;

  factory AppEnvironment.fromJson(Map<String, dynamic> json) =>
      _$AppEnvironmentFromJson(json);
}

/// Набор конфигурируемых опций, используемых в Flutter Application
@freezed
class DebugOptions with _$DebugOptions {
  const factory DebugOptions({
    @Default(false) bool showPerformanceOverlay,
    @Default(false) bool debugShowMaterialGrid,
    @Default(false) bool checkerboardRasterCacheImages,
    @Default(false) bool checkerboardOffscreenLayers,
    @Default(false) bool showSemanticsDebugger,
    @Default(false) bool debugShowCheckedModeBanner,
  }) = _DebugOptions;

  factory DebugOptions.fromJson(Map<String, dynamic> json) =>
      _$DebugOptionsFromJson(json);
}

enum BuildType {
  /// Debug build type
  @JsonValue('debug')
  debug,

  /// Release build type
  @JsonValue('release')
  release,
}

/// Конфигурируемые уровни логирование, используемые в приложении
enum AppLogLevel {
  @JsonValue(AppLogLevels.traceStr)
  trace,
  @JsonValue(AppLogLevels.debugStr)
  debug,
  @JsonValue(AppLogLevels.infoStr)
  info,
  @JsonValue(AppLogLevels.warningStr)
  warning,
  @JsonValue(AppLogLevels.errorStr)
  error,
  @JsonValue(AppLogLevels.fatalStr)
  fatal,
  @JsonValue(AppLogLevels.offStr)
  off,
}

/// Расширения над [AppLogLevel] для работы с [Logger] и работы с переменными окружения
extension AppLogLevels on AppLogLevel {
  Level get loggerLevel {
    switch (this) {
      case AppLogLevel.trace:
        return Level.trace;
      case AppLogLevel.debug:
        return Level.debug;
      case AppLogLevel.info:
        return Level.info;
      case AppLogLevel.warning:
        return Level.warning;
      case AppLogLevel.error:
        return Level.error;
      case AppLogLevel.fatal:
        return Level.fatal;
      case AppLogLevel.off:
        return Level.off;
    }
  }

  static AppLogLevel? getFromString(String logLevelStr) {
    if (logLevelStr == traceStr) {
      return AppLogLevel.trace;
    }
    if (logLevelStr == debugStr) {
      return AppLogLevel.debug;
    }
    if (logLevelStr == infoStr) {
      return AppLogLevel.info;
    }
    if (logLevelStr == warningStr) {
      return AppLogLevel.warning;
    }
    if (logLevelStr == errorStr) {
      return AppLogLevel.error;
    }
    if (logLevelStr == fatalStr) {
      return AppLogLevel.fatal;
    }
    if (logLevelStr == offStr) {
      return AppLogLevel.off;
    }

    return null;
  }

  static const traceStr = 'trace';
  static const debugStr = 'debug';
  static const infoStr = 'info';
  static const warningStr = 'warning';
  static const errorStr = 'error';
  static const fatalStr = 'fatal';
  static const offStr = 'off';
}

/// Расширеня над [BuildType] для работы с переменными окружения
extension BuildTypes on BuildType {
  static const debugEnvKey = 'debugEnv';
  static const releaseEnvKey = 'releaseEnv';

  /// Метод возвращает строковое значение окружения, на котором базируется DI-дерево GetIt
  String get getItEnvironmentKey {
    switch (this) {
      case BuildType.debug:
        return debugEnvKey;
      case BuildType.release:
        return releaseEnvKey;
    }
  }
}
