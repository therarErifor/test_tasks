// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_the_hotel_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AboutTheHotelDto _$$_AboutTheHotelDtoFromJson(Map<String, dynamic> json) =>
    _$_AboutTheHotelDto(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AboutTheHotelDtoToJson(_$_AboutTheHotelDto instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
