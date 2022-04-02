import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomTextField {

  static Widget textField(
      String title, {
        double? height,
        double? width,
        double? radius,
        bool hasHeight = false,
        bool hasBorderColor = false,
        Color borderColor = Colors.black,
        double? verPadding,
        double? horzPadding,
        hasSuffixIcon = false,
        Widget? suffixIcon,
        double margin = 15,
        int lines = 1,
        Function(String value)? onSave,
        Function(String value)? onChange,
      }) {
    return Container(
      width: width ?? double.infinity,
      height: hasHeight ? height : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        // color: Colors.black,
      ),
      margin: EdgeInsets.symmetric(vertical: margin),
      child: TextFormField(

        style:const  TextStyle(color: Colors.lightBlueAccent),
        decoration: InputDecoration(
          // hintTextDirection: TextDirection.rtl,
          suffixIcon: suffixIcon,
          hintStyle:
         const  TextStyle(color:Colors.grey),
          contentPadding: EdgeInsets.symmetric(
              vertical: verPadding!, horizontal: horzPadding!),
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: title,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: hasBorderColor
                  ? const BorderSide(width: 1)
                  : const BorderSide(width: 0, style: BorderStyle.none)),
        ),
        onChanged: (value) {
          onChange!(value);
        },

      ),
    );
  }
}
