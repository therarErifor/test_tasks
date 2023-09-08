import 'package:freezed_annotation/freezed_annotation.dart';

import 'about_the_hotel_dto.dart';

part 'hotel_data_dto.freezed.dart';

part 'hotel_data_dto.g.dart';

@freezed
class HotelDataDto with _$HotelDataDto{
  const factory HotelDataDto({
    required int id,
    required String name,
    required String adress,
    required int minimal_price,
    required String price_for_it,
    required int rating,
    required String rating_name,
    required List<String> image_urls,
    required AboutTheHotelDto about_the_hotel
  }) = _HotelDataDto;

  factory HotelDataDto.fromJson(Map<String, dynamic> json) =>
      _$HotelDataDtoFromJson(json);
}