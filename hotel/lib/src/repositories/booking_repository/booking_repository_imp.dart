import 'package:hotel/src/features/booking/booking_entities/booking_data.dart';
import '../repository_entities/resp.dart';
import 'booking_data_source/booking_remote_data_source.dart';
import 'booking_repository.dart';

class BookingRepositoryImp extends BookingRepository{
  final BookingRemoteDataSource _bookingRemoteDataSource = BookingRemoteDataSource();

  @override
  Future<Resp<BookingData>> getBookingDataAsync()async{
    final resp = await _bookingRemoteDataSource.getBookingDataDtoAsync();
    final dto = resp.data;

    if((resp.isSuccessTheResp == true)&&(dto != null)){
      return Resp(BookingData(
        id: dto.id,
        hotelName: dto.hotel_name,
        hotelAdress: dto.hotel_adress,
        horating: dto.horating,
        ratingName: dto.rating_name,
        departure: dto.departure,
        arrivalCountry: dto.arrival_country,
        tourDateStart: dto.tour_date_start,
        tourDateStop: dto.tour_date_stop,
        numberOfNights: dto.number_of_nights,
        room: dto.room,
        nutrition: dto.nutrition,
        tourPrice: dto.tour_price,
        fuelCharge: dto.fuel_charge,
        serviceCharge: dto.service_charge,
      ), null);
    }
    return Resp(null, resp.error);
  }


}