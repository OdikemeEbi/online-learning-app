import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_events.dart';
import 'package:we_learn/pages/signin/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    // print('My value is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    // print('My value is ${event.password}');

    emit(state.copyWith(password: event.password));
  }
}
