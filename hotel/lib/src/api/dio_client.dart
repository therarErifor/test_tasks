import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;

  DioClient({required this.dio}) {
    dio = Dio();
    dio.options.baseUrl = 'https://run.mocky.io/v3/';
  }
}