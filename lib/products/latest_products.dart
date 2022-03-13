import 'package:flutter/material.dart';
import 'package:mystaa/products/product_details_screen.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

Widget LatestProducts(BuildContext context) {
  return Container(
    width: fullWidth(context),
    color: Colors.grey[100],
    height: 240,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boldText("Latest Products", 18),
          VSpace(12),
          FutureBuilder<List>(
            future: ApiMethods().getFeaturedProducts(latestProductsApi),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? snapshot.data!.length == 0
                      ? Text("No Products")
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var ds = snapshot.data![index];
                                return InkWell(
                                  onTap: () {
                                    goto(
                                        context,
                                        ProductDetailsScreen(ds, false,
                                            latestProductsApi, index));
                                  },
                                  child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: white,
                                      // borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomNetworkImage(
                                            "https://mystaa.com/storage/app/public/product/" +
                                                ds["images"][0],
                                            context,
                                            150,
                                            80),
                                        VSpace(5),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 2),
                                          child:normalText(ds["name"], 16),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 8.0, vertical: 2),
                                        //   child: normalText(ds["slug"], 14),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 2),
                                          child: boldText(
                                              ds["purchase_price"].toString() +
                                                  " Rs",
                                              16),
                                        ),
                                         Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 2),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              ds["purchase_price"].toString() +
                                                  " Rs",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: grey,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            Row(
                                              children: [
                                                 bAppText(ds["discount"].toString(),
                                                15, grey),
                                            bAppText(
                                                ds["discount_type"] == "percent"
                                                    ? "%"
                                                    : "%",
                                                15,
                                                grey),
                                                bAppText(
                                               "Off",
                                                15,
                                                grey),

                                              ],
                                            ),
                                        
                                           
                                          ],
                                        ),
                                      ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    ),
  );
}
