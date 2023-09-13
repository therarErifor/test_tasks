import '../../repositories/hotel_repository/hotel_entities/hotel_data.dart';
import '../repository_entities/resp.dart';

abstract class HotelRepository{
  Future<Resp<HotelData>> getHotelDataAsync();
}