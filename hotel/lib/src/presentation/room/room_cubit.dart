import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/src/presentation/room/room_state.dart';
import '../../repositories/rooms_repository/rooms_repository.dart';
import '../../repositories/rooms_repository/room_entities/room.dart';

class RoomsCubit extends Cubit<RoomsState>{
  final RoomsRepository _roomsRepository;
  late List<Room> _roomsListLoaded = [];
  RoomsCubit(RoomsRepository roomsRepository) :
      _roomsRepository = roomsRepository,
      super(RoomsInitState()){
    init();
  }

  void init() async {
    var response = await _roomsRepository.getRoomsListAsync();
    final _roomsList = response.data;
    if (_roomsList != null){
      _roomsListLoaded.addAll(_roomsList.rooms);
      emit(RoomsListLoadedState(roomsList: _roomsListLoaded));
    }
    if(response.error != null){
      emit(ErrorState());
    }
  }
}