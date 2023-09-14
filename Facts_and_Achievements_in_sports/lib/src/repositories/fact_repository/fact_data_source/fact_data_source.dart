import 'fact_dto/fact_list_dto.dart';

abstract class FactDataSource{
  Future<FactListDto> getFactDtoAsync();
}