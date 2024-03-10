import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:example/app/app_environment.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class InfrastructureModule {
  @lazySingleton
  Connectivity connectivity() => Connectivity();

  // @lazySingleton
  // DioLoggerWrapper dioLoggerWrapper(AppEnvironment appEnvironment) {
  //   return DioLoggerWrapper(
  //     Logger(
  //       printer: SimplePrinter(),
  //       filter: ProductionFilter(),
  //       level: appEnvironment.logLevel.loggerLevel,
  //       output: MultiOutput(
  //         [
  //           ConsoleOutput(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @lazySingleton
  Logger logger(AppEnvironment appEnvironment) {
    return Logger(
      printer: PrettyPrinter(
        methodCount: 0,
      ),
      filter: ProductionFilter(),
      level: appEnvironment.logLevel.loggerLevel,
      output: MultiOutput(
        [
          ConsoleOutput(),
        ],
      ),
    );
  }
}
