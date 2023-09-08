// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HotelDataDto _$$_HotelDataDtoFromJson(Map<String, dynamic> json) =>
    _$_HotelDataDto(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      minimal_price: json['minimal_price'] as int,
      price_for_it: json['price_for_it'] as String,
      rating: json['rating'] as int,
      rating_name: json['rating_name'] as String,
      image_urls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      about_the_hotel: AboutTheHotelDto.fromJson(
          json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HotelDataDtoToJson(_$_HotelDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimal_price': instance.minimal_price,
      'price_for_it': instance.price_for_it,
      'rating': instance.rating,
      'rating_name': instance.rating_name,
      'image_urls': instance.image_urls,
      'about_the_hotel': instance.about_the_hotel,
    };
