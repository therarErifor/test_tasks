import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/booking_repository/booking_repository.dart';
import 'booking_entities/booking_data.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState>{
  final BookingRepository _bookingRepository;
  late BookingData _bookingData;
  BookingCubit(BookingRepository bookingRepository) :
      _bookingRepository = bookingRepository,
      super(BookingInitState()){
    init();
  }

  void init() async {
    var response = await _bookingRepository.getBookingDataAsync();
    if (response.data != null){
      _bookingData = response.data!;
      emit(BookingDataLoadedState(bookingData: _bookingData));
    }
    if(response.error != null){
      emit(ErrorState());
    }
  }
}