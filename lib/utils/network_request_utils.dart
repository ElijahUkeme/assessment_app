
import 'package:dio/dio.dart';

import '../constants/app_constants.dart';

class NetworkRequestUtil {
  static NetworkRequestUtil _instance = NetworkRequestUtil._internal();

  factory NetworkRequestUtil() {
    return _instance;
  }

  late Dio dio;
  late Map<String, String> _mainHeaders;
   late int _responseCode;
  int get responseCode=> _responseCode;
  late String _errorMessage;
  String get errorMessage=>_errorMessage;
  NetworkRequestUtil._internal() {
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      //'Authorization': 'Bea',
    };
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.APP_BASE_URL,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 5),
        headers: _mainHeaders,
    );
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      var response =
      await dio.post(path, data: data, queryParameters: queryParameters);
      _responseCode = response.statusCode!;
      return response.data;
    }on DioException catch (e) {
      _errorMessage = e.message!;
      print("The error in the catch is ${e.requestOptions}");
      print("The error message is ${e.message}");
    }
  }
}