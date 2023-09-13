import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/src/presentation/booking/container_colors.dart';
import 'package:hotel/src/presentation/booking/digits_to_word_parser.dart';
import 'package:hotel/src/repositories/booking_repository/booking_repository_imp.dart';
import 'package:hotel/src/ui/custom_icons.dart';
import 'package:hotel/src/ui/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../repositories/booking_repository/booking_entities/booking_data.dart';
import '../../repositories/booking_repository/booking_entities/tourist_data.dart';
import '../../ui/button_widget.dart';
import '../../ui/text_widgets.dart';
import 'booking_cubit.dart';
import 'booking_state.dart';

class BookingPage extends StatelessWidget {
  BookingCubit? _cubit;
  DigitsToWordsParser _digitsToWordsParser = DigitsToWordsParser();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var dataMask = new MaskTextInputFormatter(
      mask: '##.##.####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var passportMask = new MaskTextInputFormatter(
      mask: '## #######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool isEmailValid(email) {
    bool valid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingCubit>(
        create: (_) => BookingCubit(BookingRepositoryImp()),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(246, 246, 249, 1),
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.navigate_before),
                onPressed: () => Navigator.of(context).pop()),
            iconTheme: IconThemeData(color: Colors.black),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            elevation: 0,
            centerTitle: true,
            title: Text('Бронирование', style: TextStyle(color: Colors.black)),
          ),
          body: BlocBuilder<BookingCubit, BookingState>(builder: _buildBody),
        ));
  }

  Widget _buildBody(BuildContext context, BookingState state) {
    _cubit = context.read<BookingCubit>();

    if (state is BookingInitState) {
      return Center(
          child: SimpleDialog(backgroundColor: Colors.white, children: <Widget>[
        Column(children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Text('Пожалуйста, подождите')
        ])
      ]));
    }
    if (state is ErrorState) {
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 45),
          SizedBox(height: 20),
          Text('Error!', style: TextStyle(color: Colors.black, fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => _cubit?.init(),
              child: Text('Попробуйте загрузить страницу снова'))
        ],
      );
    }
    if (state is BookingDataLoadedState) {
      return _buildBookingPage(
          context, state.bookingData, state.containerColors);
    }
    return SizedBox.shrink();
  }

  Widget _buildBookingPage(BuildContext context, BookingData bookingData,
      ContainerColors containerColors) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 149,
                        height: 29,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 199, 0, 0.2),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 168, 0, 1),
                                  size: 18,
                                ),
                                Text(
                                  '${bookingData.horating} ${bookingData.ratingName}',
                                  style: const TextStyle(
                                      color: Color.fromRGBO(255, 168, 0, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ))),
                    const SizedBox(height: 10),
                    TextWidget('header', bookingData.hotelName),
                    const SizedBox(height: 10),
                    TextWidget('addressText', bookingData.hotelAdress),
                  ])),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Table(
              columnWidths: {0: FractionColumnWidth(0.4)},
              children: [
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Вылет из',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextWidget('', bookingData.departure),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Страна, город',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidget('', bookingData.arrivalCountry))
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Даты',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidget(
                        '',
                        '${bookingData.tourDateStart} – ${bookingData.tourDateStop}',
                      ))
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Кол-во ночей',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child:
                          TextWidget('', '${bookingData.numberOfNights} ночей'))
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Отель',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidget('', bookingData.hotelName))
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Номер',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidget('', bookingData.room))
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Питание',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextWidget('', bookingData.nutrition))
                ]),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextWidget('header', 'Информация о покупателе'),
                    Form(
                      child:Column( children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: containerColors.phoneColor,
                            borderRadius:BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            initialValue: bookingData.phone,
                            inputFormatters: [maskFormatter],
                            onChanged: (value) => _cubit?.setDataFromField(null, 'phone', value),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text('Номер телефона'),
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(169, 171, 183, 1),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                          )),

                        Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: containerColors.emailColor,
                              borderRadius:BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextFormField(
                             initialValue: bookingData.email,
                              inputFormatters: [],
                              onChanged: (value) => _cubit?.setDataFromField(null, 'email', value),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text('Почта'),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(169, 171, 183, 1),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            )),
                    ])
                    ),
                    Text(
                        'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
                        style: const TextStyle(
                            color: Color.fromRGBO(130, 135, 150, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400))
                  ])),
          _buildTouristDataList(context, bookingData, containerColors),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Table(columnWidths: {
              0: FractionColumnWidth(0.8)
            }, children: [
              TableRow(
                children: [
                  TextWidget('header', 'Добавить туриста'),
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(13, 114, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      onTap: () => _cubit?.addTourist(),
                    ),
                  ),
                ],
              )
            ]),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Table(
              columnWidths: {0: FractionColumnWidth(0.4)},
              children: [
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Тур',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: TextWidget('simplePriceText', bookingData.tourPrice),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Топливный сбор',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child:
                          TextWidget('simplePriceText', bookingData.fuelCharge))
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Сервисный сбор',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextWidget(
                          'simplePriceText', bookingData.serviceCharge))
                ]),
                TableRow(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'К оплате',
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        NumberFormat.currency(
                                locale: 'ru_RU', symbol: '₽', decimalDigits: 0)
                            .format(bookingData.tourPrice +
                                bookingData.fuelCharge +
                                bookingData.serviceCharge),
                        style: const TextStyle(
                            color: Color.fromRGBO(13, 114, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ))
                ]),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _cubit?.validData();
                  },
                  child: Text(
                      'Оплатить ${NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0).format(bookingData.tourPrice + bookingData.fuelCharge + bookingData.serviceCharge)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 48),
                    backgroundColor: Color.fromRGBO(13, 114, 255, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTouristDataList(BuildContext context, BookingData bookingData, ContainerColors containerColors) {
    List<Widget> touristDataList = [];
    for (int touristId = 0; touristId < bookingData.touristList.length; touristId++) {
      touristDataList.add(Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Stack(alignment: Alignment.topRight, children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(13, 114, 255, 0.1),
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
          ExpandablePanel(
              header: TextWidget('header', '${_digitsToWordsParser.toWords(number: touristId + 1)} турист'),
              theme: ExpandableThemeData(
                  iconPadding: EdgeInsets.only(bottom: 10),
                  inkWellBorderRadius: BorderRadius.circular(6),
                  iconColor: Colors.blue,
                  iconSize: 32,
                  collapseIcon: CustomIcons.expand_icon,
                  expandIcon: CustomIcons.collaps_icon),
              collapsed: Container(),
              expanded: Column(
                children: [

                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: containerColors.nameColor,
                          borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        // initialValue: touristDataList,
                        onChanged: (value) => _cubit?.setDataFromField(touristId, 'name', value),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Имя'),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(169, 171, 183, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: containerColors.surnameColor,
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        onChanged: (value) => _cubit?.setDataFromField(touristId, 'surname', value),
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Фамилия'),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(169, 171, 183, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: containerColors.birthDateColor,
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        inputFormatters: [dataMask],
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Дата рождения'),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(169, 171, 183, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: containerColors.citizenshipColor,
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Гражданство'),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(169, 171, 183, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: containerColors.passportNumberColor,
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        inputFormatters: [passportMask],
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Номер загранпаспорта'),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(169, 171, 183, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: containerColors.theValidityPeriodOfThePassportColor,
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        inputFormatters: [dataMask],
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Срок действия загранпаспорта'),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(169, 171, 183, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      )),
                ],
              ))
        ]),
      ));
    }
    return Column(children: touristDataList);
  }
}
