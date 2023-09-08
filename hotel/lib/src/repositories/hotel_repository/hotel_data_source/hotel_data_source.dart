import '../../repository_entities/resp.dart';
import 'hotel_dto/hotel_data_dto.dart';

abstract class HotelDataSource{
  Future<Resp<HotelDataDto>> getHotelDataDtoAsync();
}