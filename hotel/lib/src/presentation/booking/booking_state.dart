import '../../repositories/booking_repository/booking_entities/booking_data.dart';
import '../../repositories/booking_repository/booking_entities/tourist_data.dart';
import 'container_colors.dart';

abstract class BookingState{}

class BookingInitState extends BookingState{}

class BookingDataLoadedState extends BookingState{
  final BookingData bookingData;
  final ContainerColors containerColors;

  BookingDataLoadedState({required this.bookingData, required this.containerColors});
}


class ErrorState extends BookingState{}