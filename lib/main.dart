import 'package:drink_app/pages/authPages/auth-page.dart';
import 'package:drink_app/pages/authPages/login-page.dart';
import 'package:drink_app/pages/cartPage/cart-page.dart';
import 'package:drink_app/pages/commentPages/product-review.dart';
import 'package:drink_app/pages/deliveryPages/delivery-page.dart';
import 'package:drink_app/pages/detailsPage/details-page.dart';
import 'package:drink_app/pages/homepage/dashboard.dart';
import 'package:drink_app/pages/homepage/home-page.dart';
import 'package:drink_app/pages/profilePage/profile-page.dart';
import 'package:drink_app/pages/test-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cold Drink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Open Sans'
      ),
      home: ProductReview()
    );
  }
}
