import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/src/features/room/room_cubit.dart';
import 'package:hotel/src/features/room/room_entities/room.dart';
import 'package:hotel/src/features/room/room_state.dart';
import 'package:hotel/src/repositories/rooms_repository/hotel_repository_imp.dart';

import '../booking/booking_page.dart';

class RoomPage extends StatelessWidget {
  RoomsCubit? _cubit;
  final String _pageName;

  RoomPage(String pageName) : _pageName = pageName {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoomsCubit>(
      create: (_) => RoomsCubit(RoomsRepositoryImp()),
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
          title: Text('$_pageName', style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<RoomsCubit, RoomsState>(builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, RoomsState state) {
    _cubit = context.read<RoomsCubit>();

    if (state is RoomsInitState) {
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
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 45),
              SizedBox(height: 20),
              Text('Error!', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _cubit?.init(),
                child: Text('Попробуйте загрузить страницу снова'))
        ],
      ));
    }

    if (state is RoomsListLoadedState) {
      return _buildRoomsTable(context, state.roomsList);
    }
    return const SizedBox.shrink();
  }

  Widget _buildRoomsTable(BuildContext context, List<Room> roomsList) {
    final CarouselController carouselController = CarouselController();
    List<TableRow> rows = [];
    for (int roomId = 0; roomId < roomsList.length; roomId++) {
      rows.add(
        TableRow(children: [
          Column(children: [
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(alignment: AlignmentDirectional.bottomEnd, children: <
                        Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: CarouselSlider(
                          items: roomsList[roomId]
                              .imageUrls
                              .map(
                                (item) => Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 300,
                                      width: double.infinity,
                                      child: Image.network(item,
                                          fit: BoxFit.cover),
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 273,
                            autoPlay: false,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) =>
                                _cubit?.slideImage(roomId, index),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 75,
                          height: 17,
                          alignment: AlignmentDirectional.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: roomsList[roomId]
                                .imageUrls
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: 7.0,
                                  height: 7.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black)
                                          .withOpacity(
                                              roomsList[roomId].imageId ==
                                                      entry.key
                                                  ? 0.9
                                                  : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 10),
                    Text('${roomsList[roomId].name}',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: roomsList[roomId].peculiarities.map((item) {
                        return Row(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                                left: 0, right: 8, top: 8, bottom: 0),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(251, 251, 252, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              '$item',
                              style: const TextStyle(
                                  color: Color.fromRGBO(130, 135, 150, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ]);
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () {},
                        label: Text('Подробнее о номере',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(13, 114, 255, 1))),
                        icon: Icon(Icons.navigate_before,
                            color: Color.fromRGBO(13, 114, 255, 1)),
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(13, 114, 255, 0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text(
                        '${roomsList[roomId].price.toString()} ₽',
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          roomsList[roomId].pricePer,
                          style: const TextStyle(
                              color: Color.fromRGBO(130, 135, 150, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context, MaterialPageRoute(builder: (_)=> BookingPage())
                        ),
                        child: Text('Выбрать номер',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),

                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 48),
                          backgroundColor: Color.fromRGBO(13, 114, 255, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ]),
            ),
          ]),
        ]),
      );
    }
    ;

    return SingleChildScrollView(
        child: Column(children: [
      Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: rows),
    ]));
  }
}
