import 'package:we_learn/common/entities/entities.dart';
import 'package:we_learn/common/utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    // response = response.data after the post method returns
    var response =
        await HttpUtil().post("api/login", queryParameters: params?.toJson());

    print(response.toString());
    return UserLoginResponseEntity.fromJson(response);
  }
}
