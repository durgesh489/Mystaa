

import 'package:flutter/material.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

Widget TopRatedProducts(BuildContext context) {
  return Container(
      width: fullWidth(context),
    color: Colors.grey[100],
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText("Top Rated", 18),
            VSpace(8),
            FutureBuilder<List>(
              future: ApiMethods().getFeaturedProducts(topRatedProducts),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ?snapshot.data!.length==0?Text("No Products"):
                     Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var ds = snapshot.data![index];
                            return Container(
                              
                              decoration: boxDecoration(1,10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image.network("https://mystaa.com/storage/app/public/latests/"+ds["thumbnail"]),
                                    boldText(ds["name"], 17),
                                    normalText(ds["slug"], 16),
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
