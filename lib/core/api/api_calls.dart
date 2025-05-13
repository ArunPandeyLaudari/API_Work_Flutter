import 'package:dio/dio.dart';
import 'package:todoapi_aplication/constants/api_constants.dart';
import 'package:todoapi_aplication/core/api/dio_exception.dart';

class ApiCalls {

  // * get method
  getData({
    required String endpoint
  }) async{
   try {
     final Dio dio = Dio(
      BaseOptions(
        baseUrl:ApiConstants.apiBaseUrl, 
      ),
    );

    final response = await dio.get(endpoint);
    return response.data;
   }
  on DioException catch (e){
    // calling the name constructor of exception
    throw CustomDioException.fromDioError(e);
   }
  }
}