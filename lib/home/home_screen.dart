import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mystaa/home/categories_screen.dart';
import 'package:mystaa/home/search_screen.dart';
import 'package:mystaa/model/product_model.dart';
import 'package:mystaa/others/cart_screen.dart';
import 'package:mystaa/others/favourite_products._screen.dart';
import 'package:mystaa/products/banner_products.dart';
import 'package:mystaa/products/best_selling_products.dart';
import 'package:mystaa/products/brands.dart';
import 'package:mystaa/products/categories.dart';
import 'package:mystaa/products/featured_products.dart';
import 'package:mystaa/products/latest_products.dart';
import 'package:mystaa/products/top_rated_products.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: lightGrey,
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 30,
        title: Row(
          children: [
            CircleAvatar(
           backgroundColor: white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  "images/header-logo.png",
                  width: 60,
                  height: 60,

                
                ),
              ),
            ),
            HSpace(5),
            Text("Mystaa")
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                goto(context, FavouriteProductsScreen(true));
              },
              icon: Icon(Icons.favorite_outline)),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                  onPressed: () {
                    goto(context, CartScreen(true));
                  },
                  icon: Icon(Icons.shopping_cart_outlined)),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: normalText(cartProducts.length.toString(), 8),
                ),
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                goto(context, SearchScreen());
              },
              child: Container(
                color: white,
                  height: 45,
                  width: fullWidth(context),
                 
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Search Products"),
                      ))),
            ),
          ),
        ),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                // items: [Image.asset(bannerProducts[0]["photo"])],
                items: bannerProducts.map((items) {
                  return Image.network(
                      "https://mystaa.com/storage/app/public/banner/" +
                          items["photo"]);
                }).toList(),
                options: CarouselOptions(
                  
                  viewportFraction: 1.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 1500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                )),
            Categories(),
            VSpace(10),
            BestSellingProducts(context),
            VSpace(10),
            Brands(context),
            VSpace(10),
            TopRatedProducts(context),
            VSpace(10),
            LatestProducts(context),
            VSpace(10),
            FeaturedProducts(),
            VSpace(10),
          ],
        ),
      )),
    );
  }
}
