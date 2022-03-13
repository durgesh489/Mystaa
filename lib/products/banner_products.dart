import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/services/api_methods.dart';

class BannerProducts extends StatefulWidget {
  const BannerProducts({Key? key}) : super(key: key);

  @override
  _BannerProductsState createState() => _BannerProductsState();
}

class _BannerProductsState extends State<BannerProducts> {
  List bannerProducts = [];
  getBannerProducts() async {
    bannerProducts = await ApiMethods().getData(bannerProductsApi);
    print(bannerProducts);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBannerProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        child: CarouselSlider(
          items: [
            Image.asset(bannerProducts[0]["photo"])
          ],
            // items: bannerProducts.map((items) {
            //   return Image.asset(items["photo"]);
            // }).toList(),
            options: CarouselOptions(
              viewportFraction: 0.95,
              // height: 380,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }
}
