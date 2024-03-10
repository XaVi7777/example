// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppEnvironmentImpl _$$AppEnvironmentImplFromJson(Map<String, dynamic> json) =>
    _$AppEnvironmentImpl(
      buildType: $enumDecode(_$BuildTypeEnumMap, json['buildType']),
      debugOptions:
          DebugOptions.fromJson(json['debugOptions'] as Map<String, dynamic>),
      logLevel: $enumDecode(_$AppLogLevelEnumMap, json['logLevel']),
      enableEasyLocalizationLogs: json['enableEasyLocalizationLogs'] as bool,
      enableBlocLogs: json['enableBlocLogs'] as bool,
      enableRoutingLogs: json['enableRoutingLogs'] as bool,
      enableDioLogs: json['enableDioLogs'] as bool,
    );

Map<String, dynamic> _$$AppEnvironmentImplToJson(
        _$AppEnvironmentImpl instance) =>
    <String, dynamic>{
      'buildType': _$BuildTypeEnumMap[instance.buildType]!,
      'debugOptions': instance.debugOptions,
      'logLevel': _$AppLogLevelEnumMap[instance.logLevel]!,
      'enableEasyLocalizationLogs': instance.enableEasyLocalizationLogs,
      'enableBlocLogs': instance.enableBlocLogs,
      'enableRoutingLogs': instance.enableRoutingLogs,
      'enableDioLogs': instance.enableDioLogs,
    };

const _$BuildTypeEnumMap = {
  BuildType.debug: 'debug',
  BuildType.release: 'release',
};

const _$AppLogLevelEnumMap = {
  AppLogLevel.trace: 'trace',
  AppLogLevel.debug: 'debug',
  AppLogLevel.info: 'info',
  AppLogLevel.warning: 'warning',
  AppLogLevel.error: 'error',
  AppLogLevel.fatal: 'fatal',
  AppLogLevel.off: 'off',
};

_$DebugOptionsImpl _$$DebugOptionsImplFromJson(Map<String, dynamic> json) =>
    _$DebugOptionsImpl(
      showPerformanceOverlay: json['showPerformanceOverlay'] as bool? ?? false,
      debugShowMaterialGrid: json['debugShowMaterialGrid'] as bool? ?? false,
      checkerboardRasterCacheImages:
          json['checkerboardRasterCacheImages'] as bool? ?? false,
      checkerboardOffscreenLayers:
          json['checkerboardOffscreenLayers'] as bool? ?? false,
      showSemanticsDebugger: json['showSemanticsDebugger'] as bool? ?? false,
      debugShowCheckedModeBanner:
          json['debugShowCheckedModeBanner'] as bool? ?? false,
    );

Map<String, dynamic> _$$DebugOptionsImplToJson(_$DebugOptionsImpl instance) =>
    <String, dynamic>{
      'showPerformanceOverlay': instance.showPerformanceOverlay,
      'debugShowMaterialGrid': instance.debugShowMaterialGrid,
      'checkerboardRasterCacheImages': instance.checkerboardRasterCacheImages,
      'checkerboardOffscreenLayers': instance.checkerboardOffscreenLayers,
      'showSemanticsDebugger': instance.showSemanticsDebugger,
      'debugShowCheckedModeBanner': instance.debugShowCheckedModeBanner,
    };
