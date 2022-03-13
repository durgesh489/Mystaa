import 'package:flutter/material.dart';
import 'package:mystaa/model/product_model.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class OtherProductDetail extends StatefulWidget {
  ProductModel product;
  OtherProductDetail(this.product);

  @override
  State<OtherProductDetail> createState() => _OtherProductDetailState();
}

class _OtherProductDetailState extends State<OtherProductDetail> {
  bool isLiked = false;
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
        width: fullWidth(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(10),
              Container(
                width: fullWidth(context),
                child: Stack(
                  // alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(
                      widget.product.image,
                      width: fullWidth(context),
                      height: 200,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            isLiked = !isLiked;
                            setState(() {
                              
                            });
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
                            nAppText(widget.product.discount.toString()+"%", 10, white),
                            nAppText("OFF", 10, white),
                          ],
                        ),
                      ),
                    ),
                  )
                  ],
                ),
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
                          nAppText(widget.product.discount.toString()+"%", 22, black),
                        
                          HSpace(10),
                          boldText(
                              "₹" + (widget.product.priceAfterDiscount).toString(), 22),
                        ],
                      ),
                      Row(
                        children: [
                          nAppText("M.R.P:  ", 16, grey),
                          Text(
                            "₹" +
                                widget.product.price.toString() +
                                ".00",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: grey),
                          ),
                        ],
                      ),
                      VSpace(2),
                      boldText(widget.product.name, 16),
                    ],
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
