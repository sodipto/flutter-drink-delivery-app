import 'package:drink_app/constants/color-utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white, //Color(0xFFE2EFC6),
      body: Column(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/2.jpg'),
                    fit: BoxFit.fitHeight)),
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 20,
                  right: 20,
                  bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Drink',
                      style: TextStyle(
                          fontSize: 36,
                          color:  Colors.white,
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: 15),
                  Text(
                      'Welcome to the best app to order cold drink in the world.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.20),
                    height: 60,
                    width: size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: buttonColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //     margin: EdgeInsets.only(top: size.height * 0.20),
                  //     height: 55,
                  //     width: size.width,
                  //     child: FlatButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, '/login');
                  //       },
                  //       child: Text(
                  //         "Get Started",
                  //         style: TextStyle(fontSize: 20.0, color: brandColor),
                  //       ),
                  //       shape: RoundedRectangleBorder(
                  //           side: BorderSide(
                  //               color: brandColor,
                  //               width: 1,
                  //               style: BorderStyle.solid),
                  //           borderRadius: BorderRadius.circular(30)),
                  //     )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
