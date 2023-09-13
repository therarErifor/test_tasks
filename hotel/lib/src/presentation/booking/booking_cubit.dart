import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/booking_repository/booking_entities/booking_data.dart';
import '../../repositories/booking_repository/booking_entities/tourist_data.dart';
import '../../repositories/booking_repository/booking_repository.dart';

import 'booking_state.dart';
import 'container_colors.dart';

class BookingCubit extends Cubit<BookingState>{
  final Color _validColor = Color.fromRGBO(246, 246, 249, 1);
  final Color _notValidColor = Color.fromRGBO(235, 87, 87, 0.15);
  List<TouristData> _touristlist = [];
  final BookingRepository _bookingRepository;
  late BookingData _bookingData;
  late ContainerColors _containerColors;
  
  BookingCubit(BookingRepository bookingRepository) :
      _bookingRepository = bookingRepository,
      super(BookingInitState()){
    init();
  }

  void init() async {
    _initContainerColors();
    var response = await _bookingRepository.getBookingDataAsync();
    if (response.data != null){
      _bookingData = response.data!;
      _bookingData.touristList = [];
      emit(BookingDataLoadedState(bookingData: _bookingData, containerColors: _containerColors));
    }
    if(response.error != null){
      emit(ErrorState());
    }
  }

  void addTourist(){
    var touristCount = _bookingData.touristList.length;
      _bookingData.touristList[touristCount].numberOfTourist = touristCount;
      emit(BookingDataLoadedState(
          bookingData: _bookingData,
          containerColors: _containerColors));
}


  setDataFromField (int? touristId, String valueType, String value) {
    switch (valueType){
      case 'phone': _bookingData.phone = value; break;
      case 'email': _bookingData.email = value; break;
      case 'name': _touristlist[touristId!].name = value; break;
      case 'surname': _touristlist[touristId!].surname = value; break;
      case 'birthDate': _touristlist[touristId!].birthDate = value; break;
      case 'citizenship': _touristlist[touristId!].citizenship = value; break;
      case 'passportNumber': _touristlist[touristId!].passportNumber = value; break;
      case 'theValidityPeriodOfThePassport': _touristlist[touristId!].theValidityPeriodOfThePassport = value; break;
    }
  }

  validData(){

    if (_bookingData.phone.length < 18){
      _containerColors.phoneColor = _notValidColor;
    }
    else { _containerColors.phoneColor = _validColor; }

    if(EmailValidator.validate(_bookingData.email)){
      _containerColors.emailColor = _validColor;
    }
    else{ _containerColors.emailColor = _notValidColor; }

      emit(BookingDataLoadedState(
          bookingData: _bookingData,
          containerColors: _containerColors));
}



  _initContainerColors(){
    _containerColors = ContainerColors(
        phoneColor: _validColor,
    emailColor: _validColor,
    nameColor: _validColor,
    surnameColor: _validColor,
        birthDateColor: _validColor,
        citizenshipColor: _validColor,
    passportNumberColor: _validColor,
    theValidityPeriodOfThePassportColor: _validColor,
    );
  }
}