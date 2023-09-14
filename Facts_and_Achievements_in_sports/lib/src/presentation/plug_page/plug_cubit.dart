import 'package:facts_and_achievements_in_sports/src/presentation/plug_page/plug_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/fact_repository/fact_entities/fact_data.dart';
import '../../repositories/fact_repository/fact_repository.dart';

class PlugCubit extends Cubit<PlugState>{
  final FactRepository _factRepository;
  late List<FactData> _factsList;

  PlugCubit(FactRepository factRepository) :
        _factRepository = factRepository,
        super(PlugInitState()){
    init();
  }

  void init() async {
    var response = await _factRepository.getFactDataAsync();
    _factsList = response.factsList;
      emit(PlugLoadedState(factsList: _factsList));
  }
}