import 'package:flutter/material.dart';
import 'package:front_end/Pages/home_page.dart';
import 'package:front_end/utils/routes.dart';
import 'package:front_end/Pages/banq_and_venues.dart';
import 'package:front_end/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        // remove venueFormRoute from here
      },
      onGenerateRoute: (settings) {
        if (settings.name == MyRoutes.venueFormRoute) {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => VenueFormPage(
              bid: args['bid'],
              onBidChanged: args['onBidChanged'],
            ),
          );
        }
        return null; // fallback
      },
    );
  }
}
