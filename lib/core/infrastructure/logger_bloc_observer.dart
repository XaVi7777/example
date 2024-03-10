import 'package:example/arch/sr_bloc/sr_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Реализация [SrBlocObserver] для логирования через [logger]
@Injectable()
class LoggerBlocObserver extends SrBlocObserver<dynamic> {
  final Logger logger;

  LoggerBlocObserver(this.logger);

  @override
  void onError(
    BlocBase<dynamic> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    super.onError(bloc, error, stackTrace);
    logger.e('onError $bloc - $error \n $stackTrace');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('onEvent $bloc - $event');
  }

  @override
  void onSr(
    Bloc<dynamic, dynamic> bloc,
    // ignore: type_annotate_public_apis
    sr,
  ) {
    super.onSr(bloc, sr);
    logger.d('onSr $bloc - $sr');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    logger.d('onTransition to state ${transition.nextState}');
  }
}
