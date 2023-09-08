import 'booking_entities/booking_data.dart';

abstract class BookingState{}

class BookingInitState extends BookingState{}

class BookingDataLoadedState extends BookingState{
  final BookingData bookingData;

  BookingDataLoadedState({required this.bookingData});
}

class ErrorState extends BookingState{}