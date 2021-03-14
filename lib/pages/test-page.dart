import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE2EFC6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height*0.50,
              width: double.infinity,
              color: Color(0xFFE2EFC6),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: size.height*0.05),
                  height: size.height* 0.35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/drink-red.png'),
                          fit: BoxFit.fitHeight
                      )
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20,right: 20, bottom: 30),
              height: size.height*0.50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Drink the best drink in town!", textAlign: TextAlign.center, style: TextStyle(color: BrandColor,fontSize: 28,fontWeight: FontWeight.bold)),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 55,
                        width: (size.width/2)- 40,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: ButtonColor,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 55,
                          width: (size.width/2)- 40,
                          child: FlatButton(
                            onPressed:(){
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: BrandColor,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: BrandColor,
                                    width: 1,
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(30)),
                          )
                      ),
                    ],
                  ),
                  //SizedBox(height: 25),
                  Container(
                      height: 55,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed:() {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/icons/facebook.svg',
                                color: BrandColor,
                                height: 25
                            ),
                            SizedBox(width:10),
                            Text(
                              "Connect with Facebook",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: BrandColor
                              ),
                            ),
                          ],
                        ),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: BrandColor,
                                width: 1,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(30)),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
