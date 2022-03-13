import 'package:flutter/material.dart';
import 'package:mystaa/model/product_model.dart';
import 'package:mystaa/widgets/custom_widgets.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
                normalText("Notifications", 22),
                VSpace(10),
                ListView.builder(
                        itemCount: notifications.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: Image.asset(
                                notifications[index].image,
                                width: 80,
                                height: 80,
                              ),
                              title: boldText(notifications[index].name, 17),
                              subtitle: normalText(
                                  notifications[index].price.toString() + " Rs", 16),
                              trailing: Text(DateFormat("dd/ mm/ yy").format(DateTime.now())),
                              
                             
                            ),
                          );
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
