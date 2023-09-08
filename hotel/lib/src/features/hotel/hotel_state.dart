import 'package:hotel/src/features/hotel/hotel_entities/hotel_data.dart';

abstract class HotelState{}

class HotelInitState extends HotelState{}

class HotelDataLoadedState extends HotelState{
  final HotelData hotelData;

  HotelDataLoadedState({required this.hotelData});
}

class SlideImageState extends HotelDataLoadedState{

  SlideImageState({required super.hotelData});
}

class ErrorState extends HotelState{}