import 'package:dio/dio.dart';

// var token;
// // Create storage
// addtoken() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('token', "$token");
// }

// gettoken() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString("token");
//   return token;
// }

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          followRedirects: true,
          baseUrl: 'http://192.168.1.143/medlink/public/v1/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
            'mobile-app': 'true',
            'authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjE0My9tZWRsaW5rL3B1YmxpYy92MS9hdXRoZW50aWNhdGUvcmVnaXN0ZXIiLCJpYXQiOjE2NzQ1NTM0NjMsImV4cCI6MTY4MTc1MzQ2MywibmJmIjoxNjc0NTUzNDYzLCJqdGkiOiJ0ZDlxbEVwb1dyQmV0bThnIiwic3ViIjoiMjYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LWKd-YIZah3q9FB3uB5rdwlcI3QMeItqxHsd9XqYftk',
          }),
    );
  }

  static Future<Response> getData({required String url, dynamic query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String url, dynamic query, dynamic data}) async {
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> updateData({
    required String url,
    dynamic query,
    dynamic data,
  }) async {
    return dio.put(url, queryParameters: query, data: data);
  }
}
