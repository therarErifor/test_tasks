import 'package:dio/dio.dart';
import 'package:hotel/src/repositories/rooms_repository/rooms_data_source/rooms_data_source.dart';
import 'package:hotel/src/repositories/rooms_repository/rooms_data_source/rooms_dto/room_list_dto.dart';
import '../../repository_entities/resp.dart';

class RoomsRemoteDataSource implements RoomListDataSource{
  late Dio _dio;

  RoomsRemoteDataSource() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://run.mocky.io/v3/';
  }
  
  @override
  Future<Resp<RoomsListDto>>  getRoomListDtoAsync()async{
    try{
      final resp = await _dio.get('f9a38183-6f95-43aa-853a-9c83cbb05ecd');
      return Resp.fromData(RoomsListDto.fromJson(resp.data));
    }catch(e){
      return Resp.fromError(e);
    }
  }
}
