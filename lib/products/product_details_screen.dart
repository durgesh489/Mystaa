import 'package:flutter/material.dart';

import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ds;
  final bool isReviews;
  final String url;
  final int productIndex;
  ProductDetailsScreen(this.ds, this.isReviews, this.url, this.productIndex);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isLiked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text(
          "Product Details",
        ),
      ),
      bottomNavigationBar: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Row(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
              HSpace(15),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  color: darkGreen,
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(10),
              Stack(
                // alignment: Alignment.bottomRight,
                children: [
                  CustomNetworkImage(
                      "https://mystaa.com/storage/app/public/product/" +
                          widget.ds["images"][0],
                      context,
                      fullWidth(context),
                      200),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          isLiked = !isLiked;
                          setState(() {});
                        },
                        child: CircleAvatar(
                            backgroundColor: white,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                size: 30,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            nAppText(widget.ds["discount"].toString()+"%", 10, white),
                            nAppText("OFF", 10, white),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              VSpace(15),
              Container(
                width: fullWidth(context),
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.remove,
                            size: 20,
                          ),
                          nAppText(widget.ds["discount"].toString(), 22, black),
                          bAppText(
                              widget.ds["discount_type"] == "percent"
                                  ? "%"
                                  : "%",
                              22,
                              black),
                          HSpace(10),
                          boldText(
                              "₹" + (widget.ds["purchase_price"]-(widget.ds["purchase_price"]*widget.ds["discount"])/100).toString(), 22),
                        ],
                      ),
                      Row(
                        children: [
                          nAppText("M.R.P:  ", 16, grey),
                          Text(
                            "₹" +
                                widget.ds["purchase_price"].toString() +
                                ".00",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: grey),
                          ),
                        ],
                      ),
                      VSpace(2),
                      boldText(widget.ds["name"], 16),
                    ],
                  ),
                ),
              ),
              VSpace(8),
              Container(
                width: fullWidth(context),
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText("Variation", 17),
                      VSpace(15),
                      GridView.builder(
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.6,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        shrinkWrap: true,
                        itemCount: widget.ds["variation"].length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGrey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  boldText(
                                      widget.ds["variation"][index]["price"]
                                              .toString() +
                                          " Rs",
                                      16),
                                  VSpace(2),
                                  boldText(
                                      widget.ds["variation"][index]["type"]
                                          .toString(),
                                      16),
                                  VSpace(2),
                                  normalText(
                                      widget.ds["variation"][index]["sku"]
                                          .toString(),
                                      14),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              VSpace(8),
              Container(
                width: fullWidth(context),
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText("Colors", 17),
                      VSpace(15),
                      GridView.builder(
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        shrinkWrap: true,
                        itemCount: widget.ds["colors"].length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGrey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  boldText(
                                      widget.ds["colors"][index]["name"], 16),
                                  VSpace(5),
                                  Container(
                                    width: 100,
                                    height: 20,
                                    color: Color(int.parse(widget.ds["colors"]
                                            [index]["code"]
                                        .replaceAll("#", "0XFF"))),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              VSpace(8),
              widget.isReviews
                  ? Container(
                      width: fullWidth(context),
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                boldText(
                                    "Reviews" +
                                        "(" +
                                        widget.ds["reviews"].length.toString() +
                                        ")",
                                    15),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13,
                                )
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            widget.ds["reviews"].length == 0
                                ? Center(
                                    child: bAppText("No Reviews", 15, grey))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget.ds["reviews"].length,
                                    itemBuilder: (context, index) {
                                      return Container();
                                    },
                                  ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
              VSpace(8)
            ],
          ),
        ),
      ),
    );
  }
}
