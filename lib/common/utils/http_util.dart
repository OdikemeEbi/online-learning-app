import 'package:dio/dio.dart';
import 'package:we_learn/common/entities/value/constant.dart';
import 'package:we_learn/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }
  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic mydata,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Options requestOptions = Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(path,
        data: mydata,
        queryParameters: queryParameters,
        options: requestOptions);

    print('my response data is ${response.toString()}');
    // print('my statuscode is ${response.statusCode}');
    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers["Authorization"] = 'Bearer $accessToken';
    }
    return headers;
  }
}
