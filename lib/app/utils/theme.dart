import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppTheme {
  AppTheme._();
  static ThemeData light = ThemeData(
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green
    )
  );


  static InputDecoration customDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey[200],
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey[400]!, width: 1.0),
      ),
      // prefixIcon: Icon(prefixicon.iconData),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  static customToast(String msg,)
  {
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0

    );
  }

}


