import '../booking_repository/booking_entities/booking_data.dart';
import '../repository_entities/resp.dart';

abstract class BookingRepository{
  Future<Resp<BookingData>> getBookingDataAsync();
}