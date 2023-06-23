import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/pages/welcome/bloc/welcome_events.dart';
import 'package:we_learn/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    print('WelcomeBloc');
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
