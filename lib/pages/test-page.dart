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
        appBar: AppBar(
          backgroundColor: Color(0xFF9FC743),
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: IconButton(
                icon: SvgPicture.asset('assets/icons/left-arrow.svg',
                    color: Colors.white, height: 25),
                onPressed: () => Navigator.pop(context)),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: Icon(Icons.shopping_bag_rounded,
                    color: Colors.white, size: 25),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 100,left: 100),
          height: 250,
          color: Colors.red,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: 250,
                width: 150,
                margin: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    color: Converter.getColorFromHex('9FC743'),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Image.asset('assets/images/drink-red.png', height: 80),
                      SizedBox(height: 10),
                      Text('Green Tea',
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -50,
                left: 25,
                child: Container(
                  height: 100,
                    width: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/drink-red.png')
                        )
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
