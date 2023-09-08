import 'package:hotel/src/repositories/rooms_repository/rooms_data_source/rooms_dto/room_list_dto.dart';

import '../../repository_entities/resp.dart';


abstract class RoomListDataSource{
  Future<Resp<RoomsListDto>> getRoomListDtoAsync();
}