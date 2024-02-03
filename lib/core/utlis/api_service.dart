import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
ApiService(this.dio);
  

  Future<Map<String, dynamic>> getMethod({required String endPoint}) async {
    Response response = await dio.get('$_baseUrl$endPoint');

    return response.data;
  }
}
