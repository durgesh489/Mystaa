import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mystaa/resources/colors.dart';

// BoxDecoration boxDecoration = BoxDecoration(
//     border: Border.all(width: 1), borderRadius: BorderRadius.circular(5));
// StreamBuilder(
//               stream: lostThingsStream,
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 return snapshot.hasData
//                     ? snapshot.data!.docs.length == 0
//                         ? Center(child: Text(widget.collectionName=="Lost"?"No Lost Things":"No found Things"))
//                         : ListView.builder(
//                           shrinkWrap: true,
//                             itemCount: snapshot.data!.docs.length,
//                             itemBuilder: (context, index) {
//                               DocumentSnapshot ds = snapshot.data!.docs[index];
//                               return LostThingTile(ds);
//                             })
//                     : Center(child: CircularProgressIndicator());
//               },
//             ),
BoxDecoration boxDecoration(double borderWidth, double borderRadius) {
  return BoxDecoration(
    border: Border.all(width: borderWidth),
    borderRadius: BorderRadius.circular(borderRadius),
  );
}

BoxDecoration gboxDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.grey, Colors.green],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(width: 1.8, color: Colors.black),
      borderRadius: BorderRadius.circular(10));
}

TextStyle ntextStyle(double size, Color color) {
  return TextStyle(
    color: color,
    fontSize: size,
  );
}

TextStyle bTextStyle(double size, Color color) {
  return TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold);
}

goto(BuildContext context, Widget nextScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
}

gotoWithoutBack(BuildContext context, Widget nextScreen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => nextScreen));
}

goBack(BuildContext context) {
  Navigator.of(context).pop();
}

Widget normalText(String text, double size) {
  return Text(text,
      style: TextStyle(
        fontSize: size,
      ),
      textAlign: TextAlign.center);
}

Widget boldText(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );
}

Widget veryBoldText(String text, double size) {
  return Text(
    text,
    style: TextStyle(fontSize: size, fontWeight: FontWeight.w900),
    textAlign: TextAlign.center,
  );
}

Widget nAppText(String text, double size, Color? color) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size),
  );
}

Widget bAppText(String text, double size, Color? color) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
  );
}

Widget PrimaryButton(BuildContext context, Function fun, String buttonText) {
  return MaterialButton(
    minWidth: fullWidth(context),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    height: 45,
    color: darkGreen,
    onPressed: () {
      fun();
    },
    child: Text(
      buttonText,
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Widget kSecondaryButton(
    Function fun, String buttonText, Color? color, double width) {
  return MaterialButton(
    minWidth: width,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    height: 45,
    color: color,
    onPressed: () {
      fun();
    },
    child: Text(
      buttonText,
      style: TextStyle(color: white, fontSize: 17),
    ),
  );
}

Widget PrimaryOutlineButton(Function fun, String buttonText, double width) {
  return SizedBox(
    width: width,
    height: 45,
    child: OutlinedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      onPressed: () {
        fun();
      },
      child: nAppText(buttonText, 18, darkGreen),
    ),
  );
}

showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: boldText(
      content,
      16,
    ),
  ));
}

showWarningDialog(BuildContext context, String content) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  goBack(context);
                },
                child: Text("Ok"))
          ],
        );
      });
}

Widget DrawerItems(Icon icon, String title, Function fun) {
  return ListTile(
    onTap: () {
      fun();
    },
    leading: icon,
    title: bAppText(title, 17, Colors.brown),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 15,
      color: Colors.brown,
    ),
  );
}

Widget VSpace(double h) {
  return SizedBox(
    height: h,
  );
}

Widget HSpace(double w) {
  return SizedBox(
    width: w,
  );
}

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget VerticalListTile(String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      boldText(title, 16),
      VSpace(5),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: normalText(content, 17),
        ),
      )
    ],
  );
}

Widget CustomNetworkImage(
    String imageUrl, BuildContext context, double width, double height) {
  return Container(
    width: width,
   
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      // fit: BoxFit.cover,
      placeholder: (context, imageUrl) {
        return Icon(
          Icons.image,
          color: grey,
          size: 60,
        );
      },
      errorWidget: (context, imageUrl, dynamic) {
        return Icon(
          Icons.image,
          color: grey,
          size: 60,
        );
      },
    ),
  );
}
