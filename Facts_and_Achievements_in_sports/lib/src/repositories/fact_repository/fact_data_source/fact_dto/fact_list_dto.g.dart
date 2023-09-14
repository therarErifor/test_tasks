// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FactListDto _$$_FactListDtoFromJson(Map<String, dynamic> json) =>
    _$_FactListDto(
      list_of_facts: (json['list_of_facts'] as List<dynamic>)
          .map((e) => FactDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FactListDtoToJson(_$_FactListDto instance) =>
    <String, dynamic>{
      'list_of_facts': instance.list_of_facts,
    };
