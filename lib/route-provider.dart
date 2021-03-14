import 'package:drink_app/pages/authPages/auth-page.dart';
import 'package:drink_app/pages/authPages/login-page.dart';
import 'package:drink_app/pages/deliveryPages/delivery-page.dart';
import 'package:drink_app/pages/detailsPage/details-page.dart';
import 'package:drink_app/pages/homePages/home-page.dart';
import 'package:drink_app/pages/productPages/product-category.dart';
import 'package:drink_app/pages/test-page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'pages/reviewPages/product-review-page.dart';

class RouteProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => AuthPage());
      case '/login':
        return PageTransition(child: LoginPage(),curve: Curves.linear, type: PageTransitionType.rightToLeft);
      case '/category':
        return PageTransition(child: ProductCategoryPage(),curve: Curves.linear, type: PageTransitionType.rightToLeft);
      case '/home':
        return PageTransition(child: HomePage(),curve: Curves.linear, type: PageTransitionType.rightToLeft);
      case '/product-details':
        return PageTransition(child: ProductDetails(),curve: Curves.linear, type: PageTransitionType.rightToLeft);
      case '/delivery':
        return PageTransition(child: DeliveryPage(),curve: Curves.linear, type: PageTransitionType.rightToLeft);
      case '/review':
        return PageTransition(child: ProductReviewPage(),curve: Curves.linear, type: PageTransitionType.rightToLeft);

    //   Map<String, dynamic> values =
    //   settings.arguments as Map<String, dynamic>;
    //   return MaterialPageRoute(
    //       settings: RouteSettings(name: settings.name, arguments: values),
    //       builder: (context) => TestView(title: values['title']));
      default:
        return MaterialPageRoute(builder: (context) => TestPage());
    }
  }
}
