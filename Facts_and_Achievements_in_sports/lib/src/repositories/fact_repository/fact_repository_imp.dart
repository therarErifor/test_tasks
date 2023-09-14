import 'fact_data_source/fact_remote_data_source.dart';
import 'fact_entities/fact_data.dart';
import 'fact_entities/facts_list.dart';
import 'fact_repository.dart';

class FactRepositoryImp extends FactRepository{
  final FactRemoteDataSource _factRemoteDataSource = FactRemoteDataSource();

  @override
  Future<FactsList> getFactDataAsync() async {
    final response = await _factRemoteDataSource.getFactDtoAsync();
    final factDto = response.list_of_facts;
    var factData = factDto.map((dto)=>
    FactData(
        id: dto.id,
        title: dto.title,
        content: dto.content,
        tags: dto.tags,
        image: dto.image)).toList();
    return FactsList(factsList: factData);
  }
}