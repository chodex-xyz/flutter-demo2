import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_demo2/core/exceptions/server_exception.dart';
import 'package:flutter_demo2/core/urls.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

abstract class HttpClient {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParameters,
  });
  Future<dynamic> post(String url, {Map headers, @required body});
  Future<dynamic> put(String url, {Map headers, @required body});
}

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  HttpClientImpl(this._dio) {
    _initApiClient();
  }

  void _initApiClient() {
    var cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(cookieJar));
    _dio.options.baseUrl = URLs.baseUrl;
    _dio.options.connectTimeout = 30000; //30s
    _dio.options.receiveTimeout = 3000;
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioError catch (e) {
      // print('[API Dio Helper - GET] Connection Exception => ' + e.message);

      if (e?.response?.data != null) throw Exception(e.response.data);

      throw Exception(e.message);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map headers,
    @required body,
    bool authorization = false,
  }) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');

      final response = await _dio.post(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response.data;
    } on DioError catch (e) {
      print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      if (e.response.statusCode == 401) {
        Get.toNamed("/signin");
      }

      if (e?.response?.data != null) throw Exception(e.response.data);

      throw Exception(e.message);
    }
  }

  @override
  Future put(
    String url, {
    Map headers,
    @required body,
  }) async {
    try {
      // print('[API Dio Helper - POST] Server Request: $body');

      final response = await _dio.put(url, data: body, options: Options(headers: headers));

      // final String res = json.encode(response.data);
      // print('[API Dio Helper - POST] Server Response: ' + res);

      return response.data;
    } on DioError catch (e) {
      // print('[API Dio Helper - POST] Connection Exception => ' + e.message);

      if (e?.response?.data != null) throw ServerException(e.response.data);

      throw Exception(e.message);
    }
  }
}
