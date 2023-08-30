import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://egyhealthh.onlinewebshop.net/api/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> postData(
  String url,
  {
  required dynamic data,
    String? token,
    String? token2,
    dynamic query
})async
  {
    dio.options.headers={
      'auth-token': token2
    };
    return await dio.post(url,data: data,queryParameters: query);
  }

  static Future<Response> putData(
      String url,
      {
        required dynamic data,
        String? token,
        dynamic query
      })async
  {
    dio.options.headers={
      'Content-Type':'application/json',
      'token': token
    };
    return await dio.put(url,data: data,queryParameters: query);
  }

  static Future<Response> getData(

      String url,
      {
        String? token,
      Map < String,dynamic>? query,
      })async{
    dio.options.headers={
      'auth-token':token
    };
    return await dio.get(url,queryParameters: query);
  }



}