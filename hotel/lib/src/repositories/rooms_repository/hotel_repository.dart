import '../../features/room/room_entities/rooms_list.dart';
import '../repository_entities/resp.dart';

abstract class RoomsRepository{
  Future<Resp<RoomsList>> getRoomsListAsync();
}