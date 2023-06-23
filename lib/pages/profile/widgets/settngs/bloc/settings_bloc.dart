import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/pages/profile/widgets/settngs/bloc/settings_event.dart';
import 'package:we_learn/pages/profile/widgets/settngs/bloc/settings_state.dart';

class SettingBlocs extends Bloc<SettingEvents, SettingStates> {
  SettingBlocs() : super(SettingStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingEvents events, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}
