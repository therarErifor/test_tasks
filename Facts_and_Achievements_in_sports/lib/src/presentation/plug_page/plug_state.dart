import '../../repositories/fact_repository/fact_entities/fact_data.dart';

abstract class PlugState{}

class PlugInitState extends PlugState{}

class PlugLoadedState extends PlugState{
  final List<FactData> factsList;

  PlugLoadedState({required this.factsList});
}