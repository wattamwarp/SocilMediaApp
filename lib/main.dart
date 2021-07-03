import 'package:flutter/material.dart';
import 'package:flutter_app_bulbandkey/screens/export.dart';
import 'screens/landing_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LandingPage.route,
      routes: {
        LandingPage.route: (_) => LandingPage(),
        RatingDetails.route: (context) =>
            RatingDetails(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
