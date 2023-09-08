// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomsListDto _$$_RoomsListDtoFromJson(Map<String, dynamic> json) =>
    _$_RoomsListDto(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RoomsListDtoToJson(_$_RoomsListDto instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };
