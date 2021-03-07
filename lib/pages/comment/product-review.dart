import 'dart:math';

import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:flutter/material.dart';

class ProductReview extends StatefulWidget {
  @override
  _ProductReviewState createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
              ),
              Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                height: size.height * 0.50,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login3.jpg'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: size.height * 0.50 - 30,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 0),
                  height: 120,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: brandColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(Icons.favorite_outline_sharp,
                                      color: Colors.white, size: 28),
                                  onPressed: () {}),
                              SizedBox(width: 12),
                              Text('2205',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(Icons.message_outlined,
                                      color: Colors.white, size: 28),
                                  onPressed: () {}),
                              SizedBox(width: 12),
                              Text('26',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))
                            ],
                          )
                        ],
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.share, color: Colors.white, size: 28),
                          onPressed: () {})
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.50 + 60,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  width: size.width,
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      )),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: Products.length,
                            itemBuilder: (context, index){
                              var product=Products[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom:10.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                                  leading: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/user.png'),
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  title: Text(product.name,style: TextStyle(color: opacityColor,fontSize: 16,fontWeight: FontWeight.w500)),
                                  subtitle: Text('This is my favourite taste dfdfd dfdffd fdfdfdf fdfdfdfdfdf!',maxLines:1, overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
                                )
                              );
                            }
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: opacityBgColor,
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/user.png'),
                                    fit: BoxFit.fitWidth),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Add a comment...',
                                    hintStyle: TextStyle(color: opacityColor,fontSize: 16)
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
