import 'package:flutter/material.dart';
import 'package:mystaa/model/product_model.dart';
import 'package:mystaa/others/other_product_detail_screen.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class FavouriteProductsScreen extends StatefulWidget {
  final bool isAppbar;
  FavouriteProductsScreen(this.isAppbar);

  @override
  State<FavouriteProductsScreen> createState() =>
      _FavouriteProductsScreenState();
}

class _FavouriteProductsScreenState extends State<FavouriteProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAppbar
          ? AppBar(
              elevation: 0,
              title: Text("Favourites"),
            )
          : null,
      body: SafeArea(
        child: Container(
          width: fullWidth(context),
          height: fullHeight(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.isAppbar ? SizedBox() : normalText("Favourite", 22),
                widget.isAppbar ? SizedBox() : VSpace(10),
                GridView.builder(
                    itemCount: favouriteProducts.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          goto(context, OtherProductDetail(favouriteProducts[index]));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  favouriteProducts[index].image,
                                  width: 80,
                                  height: 80,
                                ),
                                VSpace(10),
                                normalText(favouriteProducts[index].name, 17)
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
