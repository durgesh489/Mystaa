import 'package:flutter/material.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class SubCategoriesScreen extends StatefulWidget {
  final List subCategories;
  SubCategoriesScreen(this.subCategories);

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Sub Categories"),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: widget.subCategories.length,
                    itemBuilder: (context, index) {
                      var ds = widget.subCategories[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (index % 2 == 0)
                                    ? Colors.green[200]
                                    : Colors.cyan[300]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
