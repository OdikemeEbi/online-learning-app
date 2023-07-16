import 'package:we_learn/common/entities/course.dart';
import 'package:we_learn/common/utils/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');

    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }
}
