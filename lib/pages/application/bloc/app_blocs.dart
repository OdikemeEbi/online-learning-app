import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/pages/application/bloc/app_events.dart';
import 'package:we_learn/pages/application/bloc/app_states.dart';

class AppBolcs extends Bloc<AppEvent, AppState> {
  AppBolcs() : super(const AppState()) {
    on<TriggerAppEvent>(
      (event, emit) {
        print('my tapped index is ${event.index}');
        emit(AppState(index: event.index));
      },
    );
  }
}
