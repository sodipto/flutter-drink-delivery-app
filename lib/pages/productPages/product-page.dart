import 'package:drink_app/commonComponents/product-card.dart';
import 'package:drink_app/commonComponents/product-details-card.dart';
import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:drink_app/pages/productPages/components/category-text.dart';
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
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20, left: 20, right: 20),
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
                    icon: SvgPicture.asset('assets/icons/menu.svg',
                        color: AppBarIConColor, height: 26),
                    onPressed: () {
                      Navigator.pushNamed(context, '/category');
                    })
              ],
            ),
            SizedBox(height: 30),
            TextField(
              decoration: new InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
                  child: Icon(Icons.search, size: 24, color: Color(0xFFCBCCC9)),
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
                  itemBuilder: (context, index) {
                    var category = TeaCatagories[index];
                    return CategoryText(
                      text: category,
                      index: index,
                      selectedIndex: selectedindex,
                      isVertical: false,
                      onPress: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                    );
                  }),
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Products.length,
                  itemBuilder: (context, index) {
                    var product = Products[index];
                    return ProductCard(
                      product: product,
                      onPress: () {
                        Navigator.pushNamed(context, '/product-details');
                      },
                    );
                  }),
            ),
            SizedBox(height: 30),
            Text("Will Buy",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: Products.length,
              itemBuilder: (context, index){
                var product = Products[index];
                return ProductDetailsCard(
                  product: product,
                  onPress: () {
                    Navigator.pushNamed(context, '/product-details');
                  },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
