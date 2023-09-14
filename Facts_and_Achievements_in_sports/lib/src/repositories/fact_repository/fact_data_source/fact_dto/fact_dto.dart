import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_dto.freezed.dart';

part 'fact_dto.g.dart';

@freezed
class FactDto with _$FactDto{
  const factory FactDto({
    required int id,
    required String title,
    required String content,
    required List<String> tags,
    required String image,
  }) = _FactDto;

  factory FactDto.fromJson(Map<String, dynamic> json) =>
      _$FactDtoFromJson(json);
}