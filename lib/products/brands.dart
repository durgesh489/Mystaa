import 'package:flutter/material.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

Widget Brands(BuildContext context) {
  return Container(
    width: fullWidth(context),
    color: Colors.grey[100],
    height: 180,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boldText("Brands", 18),
          VSpace(12),
          FutureBuilder<List>(
            future: ApiMethods().getData(brandsApi),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var ds = snapshot.data![index];
                            return Container(
                              width: 130,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: white
                               
                              ),
                             
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    // borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://mystaa.com/storage/app/public/brand/" +
                                          ds["image"],
                                      width: 130,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  VSpace(5),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8),
                                    child: boldText(ds["name"], 15),
                                  ),
                                  // normalText(ds["slug"], 16),
                                ],
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
