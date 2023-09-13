import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GalleryWidget extends StatefulWidget {
  final List<String> imageUrls;
  GalleryWidget(this.imageUrls);
  State<StatefulWidget> createState(){
    return _GalleryWidgetState(imageUrls);
  }
}
class _GalleryWidgetState extends State<GalleryWidget> {
  int _current = 0;
  final List<String> _imageUrls;
  final CarouselController carouselController = CarouselController();

  _GalleryWidgetState(this._imageUrls);
  @override
  Widget build (BuildContext context){
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: CarouselSlider(
          items: _imageUrls
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
            onPageChanged: (index, reason) {
              setState((){ _current = index;});
            },
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.all(5),
          width: 75,
          height: 17,
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imageUrls.asMap().entries.map((entry) {
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
                          .withOpacity(_current == entry.key
                          ? 0.9
                          : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      )
    ]);
  }
}