import 'package:flutter/material.dart';
import 'package:front_end/Pages/home_page.dart';
import 'package:front_end/utils/routes.dart';
import 'package:front_end/Pages/banq_and_venues.dart';
import 'package:front_end/widgets/themes.dart';


void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:MyTheme.lightTheme(context) ,
      //for the debug banner
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.DarkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context)=>HomePage(),
        MyRoutes.venuesRoute: (context)=>VenueFormPage(),
      },
    );
  }
}

