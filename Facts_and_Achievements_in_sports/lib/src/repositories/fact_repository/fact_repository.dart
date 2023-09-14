import 'fact_entities/fact_data.dart';
import 'fact_entities/facts_list.dart';

abstract class FactRepository{
  Future<FactsList> getFactDataAsync ();
}