import 'package:bloc/bloc.dart';

import 'package:example/arch/sr_bloc/sr_mixin.dart';

/// Абстракция для расширения возможностей блок для отправки SingleResult - событий которые необходимо отрендерить 1 раз
/// - Навигация
/// - Тост
/// - Снек
/// - Какое-то взаимодействие с анимацией
abstract class SrBloc<Event, State, SR> extends Bloc<Event, State>
    with SingleResultMixin<Event, State, SR> {
  // ignore: use_super_parameters
  SrBloc(State state) : super(state);
}
