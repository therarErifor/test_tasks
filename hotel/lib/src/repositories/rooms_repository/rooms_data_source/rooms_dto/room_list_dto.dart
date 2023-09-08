import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel/src/repositories/rooms_repository/rooms_data_source/rooms_dto/room_dto.dart';

part 'room_list_dto.freezed.dart';

part 'room_list_dto.g.dart';

@freezed
class RoomsListDto with _$RoomsListDto{
  const factory RoomsListDto({
    required List<RoomDto> rooms
  }) = _RoomsListDto;

  factory RoomsListDto.fromJson(Map<String, dynamic> json) =>
      _$RoomsListDtoFromJson(json);
}