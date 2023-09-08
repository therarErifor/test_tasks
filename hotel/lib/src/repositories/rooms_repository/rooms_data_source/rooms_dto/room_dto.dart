import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_dto.freezed.dart';

part 'room_dto.g.dart';

@freezed
class RoomDto with _$RoomDto{
  const factory RoomDto({
    required int id,
    required String name,
    required int price,
    required String price_per,
    required List<String> peculiarities,
    required List<String> image_urls
  }) = _RoomDto;

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);
}