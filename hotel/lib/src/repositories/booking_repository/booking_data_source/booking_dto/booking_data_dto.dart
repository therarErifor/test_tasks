import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_data_dto.freezed.dart';

part 'booking_data_dto.g.dart';

@freezed
class BookingDataDto with _$BookingDataDto{
  const factory BookingDataDto({
    required int id,
    required String hotel_name,
    required String hotel_adress,
    required int horating,
    required String rating_name,
    required String departure,
    required String arrival_country,
    required String tour_date_start,
    required String tour_date_stop,
    required int number_of_nights,
    required String room,
    required String nutrition,
    required int tour_price,
    required int fuel_charge,
    required int service_charge
  }) = _BookingDataDto;

  factory BookingDataDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDataDtoFromJson(json);
}