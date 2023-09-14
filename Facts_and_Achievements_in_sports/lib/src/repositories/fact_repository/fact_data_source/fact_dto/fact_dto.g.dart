// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FactDto _$$_FactDtoFromJson(Map<String, dynamic> json) => _$_FactDto(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_FactDtoToJson(_$_FactDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
      'image': instance.image,
    };
