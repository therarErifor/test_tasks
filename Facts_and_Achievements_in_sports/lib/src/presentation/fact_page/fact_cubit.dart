import 'package:facts_and_achievements_in_sports/src/presentation/fact_page/fact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/fact_repository/fact_entities/fact_data.dart';
import '../../repositories/fact_repository/fact_repository.dart';

class FactCubit extends Cubit<FactState>{
  final FactRepository _factRepository;
  late List<FactData> _factsList;

  FactCubit(FactRepository factRepository) :
        _factRepository = factRepository,
        super(FactInitState()){
    init();
  }

  void init() async {
    var response = await _factRepository.getFactDataAsync();
    _factsList = response.factsList;
      emit(FactLoadedState(factsList: _factsList));
  }
}