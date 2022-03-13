import 'package:flutter/material.dart';
import 'package:mystaa/home/sub_categories_screen.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

Widget Categories() {
  return Container(
    color: Colors.grey[100],
    height: 160,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          boldText("Categories", 18),
          VSpace(10),
          FutureBuilder<List>(
            future: ApiMethods().getData(categoriesApi),
            builder: (context, snapshot) {
              print(snapshot.data);
              return snapshot.hasData
                  ? Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var ds = snapshot.data![index];
                          return InkWell(
                            onTap: () {
                              goto(context,
                                  SubCategoriesScreen(ds["childes"]));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right:12.0),
                              child: Container(
                                width: 70,
                                child: Column(

                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Center(
                                          child: Image.network(
                                            "https://mystaa.com/storage/app/public/category/${ds["icon"]}",
                                            width: 35,
                                            height: 35,
                                            color: green,
                                          ),
                                        ),
                                      ),
                                    ),
                                    VSpace(10),
                                    Text(ds["name"],textAlign: TextAlign.center,style: TextStyle(fontSize: 13),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    ),
  );
}
