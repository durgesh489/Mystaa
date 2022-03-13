import 'package:flutter/material.dart';
import 'package:mystaa/model/product_model.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class CartScreen extends StatefulWidget {
  final bool isAppbar;
  CartScreen(this.isAppbar);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalAmount = 0;
  getTotalAmount() {
    for (var item in cartProducts) {
      totalAmount += item.price * item.quantity;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotalAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAppbar
          ? AppBar(
              elevation: 0,
              title: Text("Cart"),
            )
          : null,
      bottomNavigationBar: widget.isAppbar
          ? Container(
              color: white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          nAppText("Total Amount", 16, green),
                          nAppText(totalAmount.toString() + " ₹", 16, green),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      height: 50,
                      color: darkGreen,
                      onPressed: () {},
                      child: Text(
                        "Make Payment",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )
          : null,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.isAppbar ? SizedBox() : normalText("Cart", 22),
                  widget.isAppbar ? SizedBox() : VSpace(10),
                  ListView.builder(
                      itemCount: cartProducts.length,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      cartProducts[index].image,
                                      width: 80,
                                      height: 80,
                                    ),
                                    HSpace(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        boldText(cartProducts[index].name, 17),
                                        VSpace(5),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: green,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 2),
                                              child: Row(
                                                children: [
                                                  nAppText(
                                                      cartProducts[index]
                                                          .ratings
                                                          .toString(),
                                                      14,
                                                      white),
                                                  HSpace(5),
                                                  Icon(
                                                    Icons.star,
                                                    color: white,
                                                    size: 20,
                                                  )
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  if (cartProducts[index]
                                                          .quantity >
                                                      0) {
                                                    cartProducts[index]
                                                        .quantity -= 1;
                                                    totalAmount -=
                                                        cartProducts[index]
                                                            .price;
                                                  }

                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                )),
                                            HSpace(7),
                                            normalText(
                                                "${cartProducts[index].quantity}",
                                                17),
                                            HSpace(7),
                                            InkWell(
                                                onTap: () {
                                                  cartProducts[index]
                                                      .quantity += 1;
                                                  totalAmount +=
                                                      cartProducts[index].price;
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  size: 20,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                VSpace(10),
                                Row(
                                  children: [
                                    boldText(
                                        cartProducts[index]
                                                .priceAfterDiscount
                                                .toString() +
                                             " ₹",
                                        17),
                                    HSpace(15),
                                    Text(
                                      cartProducts[index].price.toString()+" ₹",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 17),
                                    ),
                                    HSpace(15),
                                    Text(
                                      cartProducts[index].discount.toString() +
                                          "% OFF",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),

                                // ListTile(
                                //   leading: Image.asset(
                                //     cartProducts[index].image,
                                //     width: 80,
                                //     height: 80,
                                //   ),
                                //   title: boldText(cartProducts[index].name, 17),
                                //   subtitle: boldText(
                                //       cartProducts[index].price.toString() +
                                //           " Rs",
                                //       16),
                                //   trailing: Container(
                                //     decoration:
                                //         BoxDecoration(border: Border.all()),
                                //     child: Padding(
                                //       padding: const EdgeInsets.symmetric(
                                //           horizontal: 10.0, vertical: 2),
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.min,
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceEvenly,
                                //         children: [
                                //           InkWell(
                                //               onTap: () {
                                //                 if (cartProducts[index].quantity >
                                //                     0) {
                                //                   cartProducts[index].quantity -=
                                //                       1;
                                //                   totalAmount -=
                                //                       cartProducts[index].price;
                                //                 }

                                //                 setState(() {});
                                //               },
                                //               child: Icon(
                                //                 Icons.remove,
                                //                 size: 20,
                                //               )),
                                //           HSpace(7),
                                //           normalText(
                                //               "${cartProducts[index].quantity}",
                                //               17),
                                //           HSpace(7),
                                //           InkWell(
                                //               onTap: () {
                                //                 cartProducts[index].quantity += 1;
                                //                 totalAmount +=
                                //                     cartProducts[index].price;
                                //                 setState(() {});
                                //               },
                                //               child: Icon(
                                //                 Icons.add,
                                //                 size: 20,
                                //               ))
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
                  VSpace(20),
                  Card(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldText("Price Details", 16),
                          VSpace(15),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("Price"),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text("3500" + " ₹"),
                              ),
                            ],
                          ),
                          VSpace(10),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("Discount"),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text("500" + " ₹"),
                              ),
                            ],
                          ),
                          VSpace(10),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("Total Amount"),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text("3000" + " ₹"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
