import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: PageScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top+20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tea",
                    style:
                    TextStyle(fontSize: 36, fontWeight: FontWeight.w900)),
                IconButton(
                    icon: SvgPicture.asset(
                        'assets/icons/category.svg',
                        color: brandColor,height: 30
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/category');
                    }
                )
              ],
            ),
            SizedBox(height: 30),
            TextField(
              decoration: new InputDecoration(
                contentPadding: new EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                hintText: "Green Tea",
                hintStyle: TextStyle(color: Color(0xFFCBCCC9), fontSize: 18),
                fillColor: Color(0xFFF5F6F2),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 10),
                  child:
                  Icon(Icons.search, size: 24, color: Color(0xFFCBCCC9)),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 40,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: TeaCatagories.length,
                  itemBuilder: (context, index) => buildCatagory(index)),
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Products.length,
                itemBuilder: (context, index) => buildProductCard(Products[index]),
              ),
            ),
            SizedBox(height: 30),
            Text("Will Buy", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: Products.length,
              itemBuilder: (context, index) => buildBuyProductCard(Products[index]),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCatagory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(TeaCatagories[index],
                //textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: selectedindex == index ?FontWeight.bold:FontWeight.w400,
                    fontSize: selectedindex == index ? 16 : 16,
                    color: selectedindex == index
                        ? Color(0xFF58910F)
                        : Colors.black)),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 4,
              width: 40,
              color: selectedindex == index
                  ? Color(0xFFCBE19D)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/product-details');
        },
        child: Padding(
          padding: EdgeInsets.only(right: 16),
          child: Container(
            height: 175,
            width: 150,
            decoration: BoxDecoration(
                color: Converter.getColorFromHex(product.color), borderRadius: BorderRadius.circular(22)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(product.imgfUrl, height: 120),
                  SizedBox(height: 10),
                  Text(product.name,
                      style: TextStyle(fontSize: 18, color: Colors.white))
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildBuyProductCard(Product product) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/product-details');
        },
        child: Padding(
          padding: EdgeInsets.only(top: 0),
          child: Container(
              height: 120,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Converter.getColorFromHex(product.color),
                        borderRadius: BorderRadius.circular(22)),
                    child: Center(
                      child: Image.asset(
                          product.imgfUrl,
                          height: 60
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color(0xFF1F2906))),
                        SizedBox(height: 10),
                        Text("Signature Product",style: TextStyle(color:opacityColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\¥  ',
                      style: TextStyle(color: Colors.black,fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(text: '24', style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Color(0xFF1F2906))),
                      ],
                    ),
                  )
                ],
              )
          ),
        ));
  }
}
