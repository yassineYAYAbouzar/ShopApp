import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
  static Dio dio;
  static init(){
    dio = Dio();
    dio.options.baseUrl="https://student.valuxapps.com/api/";
  }



 static Future<Response> getData({
  @required String url,
   dynamic query,
   String lang = "ar",
   String token
})async
  {
    dio.options.headers = {
      'lang':lang,
      'Authorization':token
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    @required String url,
    Map<String,dynamic> query,
    @required Map<String,dynamic> data,
    String lang = "ar",
    String token
  })async
  {
    dio.options.headers = {
      'lang':lang,
      'Authorization':token
    };
    return await dio.post(
        url,
        queryParameters: query,
        data: data
    );
  }
}