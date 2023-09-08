import 'package:hotel/src/repositories/rooms_repository/rooms_data_source/rooms_remote_data_source.dart';

import '../../features/room/room_entities/room.dart';
import '../../features/room/room_entities/rooms_list.dart';
import '../repository_entities/resp.dart';
import 'hotel_repository.dart';

class RoomsRepositoryImp extends RoomsRepository{
  final RoomsRemoteDataSource _roomsRemoteDataSource = RoomsRemoteDataSource();

  @override
  Future<Resp<RoomsList>> getRoomsListAsync()async{
    final resp = await _roomsRemoteDataSource.getRoomListDtoAsync();
    final dto = resp.data;

    if((resp.isSuccessTheResp == true)&&(dto != null)){
      var rooms = dto.rooms.map((dto)=>
      Room(
        id: dto.id,
        name: dto.name,
        price: dto.price,
        pricePer: dto.price_per,
        peculiarities: dto.peculiarities,
        imageUrls: dto.image_urls,
        imageId: 0
      )).toList();
      return Resp(RoomsList(rooms: rooms), null);
    }
    return Resp(null, resp.error);
  }


}