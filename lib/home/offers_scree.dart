import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({ Key? key }) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Offers"),
      ),
    );
  }
}