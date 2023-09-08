import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/src/repositories/booking_repository/booking_repository_imp.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'booking_entities/booking_data.dart';
import 'booking_cubit.dart';
import 'booking_state.dart';

class BookingPage extends StatelessWidget {
  BookingCubit? _cubit;
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

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
            title: Text('Бронирвание', style: TextStyle(color: Colors.black)),
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
      return _buildBookingPage(context, state.bookingData);
    }
    return SizedBox.shrink();
  }

  Widget _buildBookingPage(BuildContext context, BookingData bookingData) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
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
                    Text(
                      bookingData.hotelName,
                      style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bookingData.hotelAdress,
                      style: const TextStyle(
                          color: Color.fromRGBO(13, 114, 255, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ])),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Table(
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
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          bookingData.departure,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
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
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            bookingData.arrivalCountry,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))
                    ]),
                    TableRow(children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Даты',
                          style: const TextStyle(
                              color: Color.fromRGBO(130, 135, 150, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${bookingData.tourDateStart} – ${bookingData.tourDateStop}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
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
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${bookingData.numberOfNights} ночей',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))
                    ]),
                    TableRow(children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Отель',
                          style: const TextStyle(
                              color: Color.fromRGBO(130, 135, 150, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            bookingData.hotelName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))
                    ]),
                    TableRow(children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Номер',
                          style: const TextStyle(
                              color: Color.fromRGBO(130, 135, 150, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            bookingData.room,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))
                    ]),
                    TableRow(children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Питание',
                          style: const TextStyle(
                              color: Color.fromRGBO(130, 135, 150, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            bookingData.nutrition,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ))
                    ]),
                  ],
                ),
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
                    Text('Информация о покупателе',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration:  const BoxDecoration(
                          color: Color.fromRGBO(246, 246, 249, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextFormField(
                        inputFormatters: [maskFormatter],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            label: Text('Номер телефона'),
                            labelStyle: TextStyle(color: Color.fromRGBO(169, 171, 183, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            alignLabelWithHint: false,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,

                      )
                    ),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration:  const BoxDecoration(
                            color: Color.fromRGBO(246, 246, 249, 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            label: Text('Почта'),
                            labelStyle: TextStyle(color: Color.fromRGBO(169, 171, 183, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            alignLabelWithHint: false,
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        )
                    ),
                    Text('Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                        style: const TextStyle(
                            color: Color.fromRGBO(130, 135, 150, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                    ))

                  ])
          ),


        ],
      ),
    );
  }
}
