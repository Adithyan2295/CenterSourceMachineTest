import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DetailsPage/detailsPage.dart';
import 'HomePage/homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MockAPP());
}

class MockAPP extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
      },
    );

    
  }
}


