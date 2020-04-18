import 'package:flutter/material.dart';

ThemeData colorPalatte() {
  return ThemeData(
      primaryColor: Colors.black,
      accentColor: new Color(0xffEE9B01),
      textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.grey),
          subtitle1: TextStyle(color: Colors.black),
          subtitle2: TextStyle(color: Colors.grey, fontSize: 14.0),
          headline5: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          headline4: TextStyle(color: Colors.black)));
}

BoxDecoration myBoxDecoration(context) {
  return BoxDecoration(
    border: Border.all(
      width: 2,
      color: Theme.of(context).primaryColor,
    ),
  );
}
