import 'package:flutter/material.dart';
import 'package:mystaa/model/product_model.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                normalText("Orders", 22),
                VSpace(10),
                ListView.builder(
                        itemCount: orders.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: Image.asset(
                                orders[index].image,
                                width: 80,
                                height: 80,
                              ),
                              title: boldText(orders[index].name, 17),
                              subtitle: normalText(
                                  orders[index].price.toString() + " Rs", 16),
                             
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


