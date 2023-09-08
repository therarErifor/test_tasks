import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/hotel_repository/hotel_repository.dart';
import 'hotel_entities/hotel_data.dart';
import 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState>{
  final HotelRepository _hotelRepository;
  late HotelData _hotelData;
  HotelCubit(HotelRepository hotelRepository) :
      _hotelRepository = hotelRepository,
      super(HotelInitState()){
    init();
  }

  void slideImage(int currentId) {
      _hotelData.imageId = currentId;
      emit(HotelDataLoadedState(hotelData: _hotelData));
  }

  void init() async {
    var responseHotelData = await _hotelRepository.getHotelDataAsync();
    if (responseHotelData.data != null){
      _hotelData = responseHotelData.data!;
      emit(HotelDataLoadedState(hotelData: _hotelData));
    }
    if(responseHotelData.error != null){
      emit(ErrorState());
    }
  }
}