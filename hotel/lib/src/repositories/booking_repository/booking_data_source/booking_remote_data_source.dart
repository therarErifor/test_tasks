import 'package:dio/dio.dart';
import 'package:hotel/src/repositories/booking_repository/booking_data_source/booking_data_source.dart';
import 'package:hotel/src/repositories/booking_repository/booking_data_source/booking_dto/booking_data_dto.dart';
import '../../repository_entities/resp.dart';

class BookingRemoteDataSource implements BookingDataSource{
  late Dio _dio;

  BookingRemoteDataSource() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://run.mocky.io/v3/';
  }
  
  @override
  Future<Resp<BookingDataDto>>  getBookingDataDtoAsync()async{
    try{
      final resp = await _dio.get('e8868481-743f-4eb2-a0d7-2bc4012275c8');
      return Resp.fromData(BookingDataDto.fromJson(resp.data));
    }catch(e){
      return Resp.fromError(e);
    }
  }
}
