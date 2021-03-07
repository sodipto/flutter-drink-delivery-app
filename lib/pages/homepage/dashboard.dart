import 'package:carousel_slider/carousel_slider.dart';
import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:drink_app/models.dart';
import 'package:drink_app/pages/detailsPage/details-page.dart';
import 'package:drink_app/pages/homepage/home-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int selectedindex = 0;

  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery
              .of(context)
              .padding
              .top + 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Drink",
                        style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
                    Padding(
                      padding: EdgeInsets.only(right:20.0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: SvgPicture.asset(
                              'assets/icons/menu.svg',
                              color: appBarIConColor, height: 26
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          }
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: Catagories.length,
                          itemBuilder: (context, index) => buildCatagory(index)),
                    ),
                    Expanded(
                      child: CarouselSlider.builder(
                        itemCount: Products.length,
                        options: CarouselOptions(
                            height: size.height * 0.50,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.8
                            //reverse: true
                        ),
                        itemBuilder: (context, index, realIdx) {
                          var product=Products[index];
                          return Container(
                            padding: EdgeInsets.all(20),
                            width: 300,
                            decoration: BoxDecoration(
                              color: Converter.getColorFromHex(product.color),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600)),
                                SizedBox(height: 5),
                                Text('Cool summer \nevent',style: TextStyle(fontSize: 16,color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w400)),
                                SizedBox(height: 5),
                                Expanded(child: Align(alignment:Alignment.center,child: Image.asset(product.imgfUrl,height: 200,fit: BoxFit.fitHeight))),
                                Text('¥ 36.00',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New products",
                        style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                    Padding(
                      padding: EdgeInsets.only(right:20.0),
                      child: Text("More",
                          style:
                          TextStyle(fontSize: 18, color: opacityColor, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  height: 160,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: Products.length,
                    itemBuilder: (context, index) => buildProductCard(Products[index]),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        )
    );
  }

  Widget buildCatagory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: RotatedBox(
          quarterTurns: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              selectedindex == index? Container(
                margin: EdgeInsets.only(top: 10),
                height: 8,
                width: 10,
                decoration: BoxDecoration(
                  color: brandColor,
                  shape: BoxShape.circle
                ),
              ):Container(),
              SizedBox(width: selectedindex == index?5:0),
              Text(Catagories[index],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: selectedindex == index?FontWeight.bold:FontWeight.w400,
                      color: selectedindex == index
                          ? Color(0xFF58910F)
                          : opacityColor)),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildProductCard(Product product) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetails()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(right: 16),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(bottom: 20),
                width: 140,
                decoration: BoxDecoration(
                    color: Converter.getColorFromHex(product.color), borderRadius: BorderRadius.circular(16)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                      product.name,
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              Positioned(
                top: -5,
                left: 20,
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
          )
        ));
  }
}
