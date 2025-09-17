
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData  lightTheme (BuildContext context) => ThemeData(
        primarySwatch:Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 2.1,
          iconTheme: IconThemeData(color: Colors.black),
          
        )
        //primaryTextTheme: GoogleFonts.latoTextTheme()
      );
  static ThemeData  DarkTheme (BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}