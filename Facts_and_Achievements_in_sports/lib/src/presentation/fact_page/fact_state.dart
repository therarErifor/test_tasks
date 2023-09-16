import '../../repositories/fact_repository/fact_entities/fact_data.dart';

abstract class FactState{}

class FactInitState extends FactState{}

class FactLoadedState extends FactState{
  final List<FactData> factsList;

  FactLoadedState({required this.factsList});
}