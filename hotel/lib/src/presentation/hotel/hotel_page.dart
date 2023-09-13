import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotel/src/ui/button_widget.dart';
import 'package:hotel/src/ui/custom_icons.dart';
import 'package:hotel/src/ui/gallery_widget.dart';
import 'package:hotel/src/ui/text_widgets.dart';
import '../../repositories/hotel_repository/hotel_repository_imp.dart';
import '../room/room_page.dart';
import '../../repositories/hotel_repository/hotel_entities/hotel_data.dart';
import 'hotel_cubit.dart';
import 'hotel_state.dart';

class HotelPage extends StatelessWidget {
  HotelCubit? _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HotelCubit>(
      create: (_) => HotelCubit(HotelRepositoryImp()),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 249, 1),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Отель', style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<HotelCubit, HotelState>(builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HotelState state) {
    _cubit = context.read<HotelCubit>();

    if (state is HotelInitState) {
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
    if (state is HotelDataLoadedState) {
      return _buildHotelPage(context, state.hotelData);
    }
    return const SizedBox.shrink();
  }

  Widget _buildHotelPage(BuildContext context, HotelData hotelData) {
    final CarouselController carouselController = CarouselController();
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
           GalleryWidget(hotelData.imageUrls),
            SizedBox(height: 10),
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
                          '${hotelData.rating} ${hotelData.ratingName}',
                          style: const TextStyle(
                              color: Color.fromRGBO(255, 168, 0, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ))),
            const SizedBox(height: 10),
            TextWidget('header', hotelData.name),
            const SizedBox(height: 10),
            TextWidget('addressText', hotelData.adress),
            SizedBox(height: 10),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextWidget('HeaderMinimalPriceText', hotelData.minimalPrice),
              const SizedBox(width: 10),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  hotelData.priceForIt,
                  style: const TextStyle(
                      color: Color.fromRGBO(130, 135, 150, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              )
            ]),
          ])),
      SizedBox(height: 10),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextWidget('header', 'Об отеле'),
            SizedBox(height: 10),
            Wrap(
              children: [
                for (int i = 0;
                    i < hotelData.aboutTheHotel.peculiarities.length;
                    i++)
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 0),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 252, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      '${hotelData.aboutTheHotel.peculiarities[i]}',
                      style: TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10),
            TextWidget('',hotelData.aboutTheHotel.description),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(251, 251, 252, 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(CustomIcons.emoji_happy,
                          color: Colors.black, size: 25),
                    ),
                    title: Text(
                      'Удобства',
                      style: TextStyle(
                          color: Color.fromRGBO(44, 48, 53, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Самое необходимое',
                      style: TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.navigate_next,
                        color: Color.fromRGBO(44, 48, 53, 1)),
                    onTap: () {},
                  ),
                  Divider(
                      indent: 65,
                      endIndent: 15,
                      color: Color.fromRGBO(130, 135, 150, 0.15)),
                  ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(CustomIcons.tick_square,
                          color: Colors.black, size: 25),
                    ),
                    title: Text(
                      'Что включено',
                      style: TextStyle(
                          color: Color.fromRGBO(44, 48, 53, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Самое необходимое',
                      style: TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.navigate_next,
                        color: Color.fromRGBO(44, 48, 53, 1)),
                    onTap: () {},
                  ),
                  Divider(
                      indent: 65,
                      endIndent: 15,
                      color: Color.fromRGBO(130, 135, 150, 0.15)),
                  ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                    leading: SizedBox(
                      height: 50,
                      width: 40,
                      child: Icon(CustomIcons.close_square,
                          color: Colors.black, size: 25),
                    ),
                    title: Text(
                      'Что не включено',
                      style: TextStyle(
                          color: Color.fromRGBO(44, 48, 53, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Самое необходимое',
                      style: TextStyle(
                          color: Color.fromRGBO(130, 135, 150, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.navigate_next,
                        color: Color.fromRGBO(44, 48, 53, 1)),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 10),

      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white),
        child: ButtonWidget(RoomPage(hotelData.name), 'К выбору номера'),
      ),
    ]));
  }
}
