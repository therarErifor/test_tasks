import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_the_hotel_dto.freezed.dart';

part 'about_the_hotel_dto.g.dart';

@freezed
class AboutTheHotelDto with _$AboutTheHotelDto{
  const factory AboutTheHotelDto({
    required String description,
    required List<String> peculiarities
  }) = _AboutTheHotelDto;

  factory AboutTheHotelDto.fromJson(Map<String, dynamic> json) =>
    _$AboutTheHotelDtoFromJson(json);
}