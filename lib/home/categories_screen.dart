import 'package:flutter/material.dart';
import 'package:mystaa/home/sub_categories_screen.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.work,
                        size: 30,
                        color: darkGreen,
                      )),
                  boldText("Categories", 30),
                  VSpace(25),
                  FutureBuilder<List>(
                    future: ApiMethods().getData(categoriesApi),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      return snapshot.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var ds = snapshot.data![index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: InkWell(
                                    onTap: () {
                                      goto(context,
                                          SubCategoriesScreen(ds["childes"]));
                                    },
                                    child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: (index % 2 == 0)
                                              ? Colors.green[200]
                                              : Colors.cyan[300]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              "https://mystaa.com/storage/app/public/category/${ds["icon"]}",
                                              width: 60,
                                              height: 60,
                                            ),
                                            VSpace(10),
                                            boldText(ds["name"], 18),
                                            VSpace(5),
                                            normalText(ds["slug"], 16),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
