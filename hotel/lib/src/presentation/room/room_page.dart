import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/src/presentation/room/room_cubit.dart';
import 'package:hotel/src/presentation/room/room_state.dart';
import 'package:hotel/src/repositories/rooms_repository/rooms_repository_imp.dart';
import 'package:hotel/src/ui/button_widget.dart';
import 'package:hotel/src/ui/gallery_widget.dart';

import '../../repositories/rooms_repository/room_entities/room.dart';
import '../../ui/text_widgets.dart';
import '../booking/booking_page.dart';

class RoomPage extends StatelessWidget {
  RoomsCubit? _cubit;
  final String _pageName;

  RoomPage(String pageName) : _pageName = pageName;

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
                   GalleryWidget(roomsList[roomId].imageUrls),
                    SizedBox(height: 10),
                    TextWidget('header', roomsList[roomId].name),
                    SizedBox(height: 5),
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

                      TextButton.icon(
                        onPressed: () {},
                        label: Icon(Icons.navigate_next, color: Color.fromRGBO(13, 114, 255, 1)),
                        icon: Text('Подробнее о номере', style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(13, 114, 255, 1))),
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(13, 114, 255, 0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                    ),
                    SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      TextWidget('headerPriceText', roomsList[roomId].price,
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
                    ButtonWidget(BookingPage(), 'Выбрать номер')
                  ]),
            ),
          ]),
        ]),
      );
    };

    return SingleChildScrollView(
        child: Column(children: [
      Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: rows),
    ]));
  }
}
