import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mystaa/resources/colors.dart';
import 'package:mystaa/widgets/custom_widgets.dart';

class CustomTextField extends StatefulWidget {
  String hintText = "";
  TextEditingController controller;
  List<FieldValidator> validators;
  bool isPassword = false;
  int maxLines;
  Color color;

  TextInputType keyboardType;
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.validators,
      this.hintText = "",
      this.isPassword = false,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,this.color=Colors.black})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: widget.color),
      
      keyboardType: widget.keyboardType,
      validator: MultiValidator(widget.validators),
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword
          ? isHide
              ? true
              : false
          : false,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.color),
          errorStyle: TextStyle(color: widget.color),
          border: UnderlineInputBorder(borderSide: BorderSide(color: widget.color)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: widget.color)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: widget.color)),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                  icon: Icon(
                    isHide ? Icons.visibility_off : Icons.visibility,
                    color: widget.color,
                  ))
              : null),
    );
  }
}
