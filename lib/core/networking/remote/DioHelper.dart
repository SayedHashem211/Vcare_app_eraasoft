
import 'package:dio/dio.dart';

import '../local/cache_helper.dart';
import '../local/enums.dart';



class DioHelper{
  static late Dio dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://vcare.integration25.com/api',            //https://newsapi.org/ //127.0.0.1:8000/api
        receiveDataWhenStatusError: true,
        // headers: {
        //   "Content-Type":"application/json"
        // },
      ),
    );
  }

  static Future<Response> getData ({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    token=CacheHelper.getString(key: MySharedKeys.token);
    dio.options.headers= {
      "Content-Type":"application/json",
      "Accept":"application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.get(url,
      queryParameters: query,
    );
  }




  static Future<Response> PostData ({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,

  }) async
  {
    token=CacheHelper.getString(key: MySharedKeys.token);

    dio.options.headers= {
      "Content-Type":"application/json",
      "Accept":"application/json",
      'Authorization':"Bearer ${token ?? ""}",
    };

    return await dio.post(url,
        data: data,
        queryParameters: query
    );

  }

  static Future<Response> PutData ({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,

  }) async
  {


    dio.options.headers= {
      "Content-Type":"application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.put(url,
        data: data,
        queryParameters: query
    );

  }


  static Future<Response> DeleteData ({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,

  }) async
  {
    token=CacheHelper.getString(key: MySharedKeys.token);

    dio.options.headers= {
      "Content-Type":"application/json",
      "Accept":"application/json",
      'Authorization':"Bearer ${token ?? ""}",
    };

    return await dio.delete(url,
        data: data,
        queryParameters: query
    );


  }

}