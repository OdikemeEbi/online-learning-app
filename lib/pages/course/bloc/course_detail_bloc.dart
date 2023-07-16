import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/pages/course/bloc/course_detail_events.dart';

import 'package:we_learn/pages/course/bloc/course_detatl_state.dart';

class CourseDetailBlocs extends Bloc<CourseDetailEvents, CourseDetailStates> {
  CourseDetailBlocs() : super(const CourseDetailStates()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }
  void _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
