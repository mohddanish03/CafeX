import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://img.etimg.com/thumb/msid-78825344,width-650,imgsize-247196,,resizemode-4,quality-100/to-spread-the-festive-season-cheer-the-good-folks-at-apple-have-introduced-attractive-deals-and-offers-for-those-who-wish-to-save-on-their-purchase-of-the-latest-iphone-.jpg',
  'https://cardinsider.com/wp-content/uploads/2022/01/Credit-Card-Offer-on-Apple-Products.png',
  'https://cdn.mos.cms.futurecdn.net/ritx9zUhQgUJ7fVo4DxNUK.jpg',
  'https://img.etimg.com/thumb/msid-78825344,width-650,imgsize-247196,,resizemode-4,quality-100/to-spread-the-festive-season-cheer-the-good-folks-at-apple-have-introduced-attractive-deals-and-offers-for-those-who-wish-to-save-on-their-purchase-of-the-latest-iphone-.jpg',
  'https://cardinsider.com/wp-content/uploads/2022/01/Credit-Card-Offer-on-Apple-Products.png',
  'https://cdn.mos.cms.futurecdn.net/ritx9zUhQgUJ7fVo4DxNUK.jpg'
];

class ImgSlider extends StatelessWidget {
  const ImgSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                ],
              )),
        ))
    .toList();
