import 'dart:math';

import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:flutter/cupertino.dart';
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
                        image: AssetImage('assets/images/Orange.jpg'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: size.height * 0.50 - 120,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Orange Juice',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text('Freezing orange juice in summer',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.50 - 30,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 0),
                  height: 120,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: BrandColor,
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
                              SizedBox(width: 20),
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
                          icon:
                              Icon(Icons.share, color: Colors.white, size: 28),
                          onPressed: () {})
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.50 + 60,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
                            itemCount: ReviewList.length,
                            itemBuilder: (context, index) {
                              var user = ReviewList[index];
                              return Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 0),
                                    leading: Container(
                                      height: 60,
                                      width: 60,
                                      padding: EdgeInsets.all(1.8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1.5, color: BrandColor),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(user.userimage),
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                    ),
                                    title: Text(user.username,
                                        style: TextStyle(
                                            color: OpacityColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(user.comment,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  ));
                            }),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: OpacityBgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
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
                                    hintStyle: TextStyle(
                                        color: OpacityColor, fontSize: 16)),
                              ),
                            ),
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
