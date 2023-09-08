import '../../repository_entities/resp.dart';
import 'booking_dto/booking_data_dto.dart';

abstract class BookingDataSource{
  Future<Resp<BookingDataDto>> getBookingDataDtoAsync();
}