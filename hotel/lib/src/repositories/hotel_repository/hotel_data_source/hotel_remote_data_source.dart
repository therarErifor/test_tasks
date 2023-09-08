import 'package:dio/dio.dart';
import '../../repository_entities/resp.dart';
import 'hotel_data_source.dart';
import 'hotel_dto/hotel_data_dto.dart';

class HotelRemoteDataSource implements HotelDataSource{
  late Dio _dio;

  HotelRemoteDataSource() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://run.mocky.io/v3/';
  }
  
  @override
  Future<Resp<HotelDataDto>>  getHotelDataDtoAsync()async{
    try{
      final resp = await _dio.get('35e0d18e-2521-4f1b-a575-f0fe366f66e3');
      return Resp.fromData(HotelDataDto.fromJson(resp.data));
    }catch(e){
      return Resp.fromError(e);
    }
  }
  
}
