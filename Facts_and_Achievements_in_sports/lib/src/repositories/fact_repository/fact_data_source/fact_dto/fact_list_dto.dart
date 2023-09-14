import 'package:freezed_annotation/freezed_annotation.dart';

import 'fact_dto.dart';

part 'fact_list_dto.freezed.dart';

part 'fact_list_dto.g.dart';

@freezed
class FactListDto with _$FactListDto{
  const factory FactListDto({
    required List <FactDto> list_of_facts,
  }) = _FactListDto;

  factory FactListDto.fromJson(Map<String, dynamic> json) =>
      _$FactListDtoFromJson(json);
}