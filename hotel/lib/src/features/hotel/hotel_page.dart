import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotel/src/ui/custom_icons.dart';
import '../../repositories/hotel_repository/hotel_repository_imp.dart';
import '../room/room_page.dart';
import 'hotel_entities/hotel_data.dart';
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
            Stack(alignment: AlignmentDirectional.bottomEnd, children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: CarouselSlider(
                  items: hotelData.imageUrls
                      .map(
                        (item) => Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: Image.network(item, fit: BoxFit.cover),
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
                    onPageChanged: (index, reason) => _cubit?.slideImage(index),
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
                    children: hotelData.imageUrls.asMap().entries.map((entry) {
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
                                  .withOpacity(hotelData.imageId == entry.key
                                      ? 0.9
                                      : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ]),
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
            Text(
              hotelData.name,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              hotelData.adress,
              style: const TextStyle(
                  color: Color.fromRGBO(13, 114, 255, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                'от ${hotelData.minimalPrice.toString()} ₽',
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Об Отеле',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
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
            Text(
              '${hotelData.aboutTheHotel.description}',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(color: Colors.white),
        child: ElevatedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => RoomPage(hotelData.name))),
          child: Text('К выбору номера',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(13, 114, 255, 1),
            minimumSize: Size(150, 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    ]));
  }
}
