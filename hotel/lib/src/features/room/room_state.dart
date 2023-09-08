import 'package:hotel/src/features/room/room_entities/room.dart';

abstract class RoomsState{}

class RoomsInitState extends RoomsState{}

class RoomsListLoadedState extends RoomsState{
  final List<Room> roomsList;

  RoomsListLoadedState({required this.roomsList});
}

class SlideImageState extends RoomsListLoadedState{

  SlideImageState({required super.roomsList});
}

class ErrorState extends RoomsState{}