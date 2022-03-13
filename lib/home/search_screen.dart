import 'package:flutter/material.dart';
import 'package:mystaa/resources/all_apis.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/services/api_methods.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List? searchedProducts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
    print(searchedProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 30,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: white,
            // borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            focusNode: focusNode,
            controller: searchingController,
            onChanged: (value) async {
              if (value != "") {
                searchedProducts = await ApiMethods().getSearchedProducts(
                  "https://mystaa.com/api/search?name=${value}",
                );
              } else {
                searchedProducts = null;
              }

              print(searchedProducts);
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Products",
                contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0)),
          ),
        ),
      ),
      body: Container(
          child: searchedProducts != null
              ? searchedProducts!.length == 0
                  ? Center(child: bAppText("No Products", 16, grey))
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                          itemCount: searchedProducts!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomNetworkImage(
                                      "https://mystaa.com/storage/app/public/" +
                                          searchedProducts![index]["thumbnail"],
                                      context,
                                      fullWidth(context),
                                      80),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2),
                                    child: boldText(
                                        searchedProducts![index]["name"], 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2),
                                    child: normalText(
                                        searchedProducts![index]["slug"], 14),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
              : Center(
                  child: searchingController.text == ""
                      ? bAppText("Search Products", 16, grey)
                      : CircularProgressIndicator())),
    );
  }
}
