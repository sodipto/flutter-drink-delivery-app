import 'package:carousel_slider/carousel_slider.dart';
import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:drink_app/pages/productPages/components/category-item-card.dart';
import 'package:drink_app/pages/productPages/components/category-new-product.dart';
import 'package:drink_app/pages/productPages/components/category-text.dart';
import 'package:flutter/material.dart';

class ProductCategoryPage extends StatefulWidget {
  @override
  _ProductCategoryPageState createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  int selectedindex = 0;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Drink",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900)),
                    // Padding(
                    //   padding: EdgeInsets.only(right:20.0),
                    //   child: IconButton(
                    //     padding: EdgeInsets.zero,
                    //       constraints: BoxConstraints(),
                    //       icon: SvgPicture.asset(
                    //           'assets/icons/menu.svg',
                    //           color: AppBarIConColor, height: 26
                    //       ),
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, '/home');
                    //       }
                    //   ),
                    // )
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
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: Catagories.length,
                          itemBuilder: (context, index) {
                            var category = Catagories[index];
                            return CategoryText(
                              text: category,
                              index: index,
                              selectedIndex: selectedindex,
                              isVertical: true,
                              onPress: () {
                                setState(() {
                                  selectedindex = index;
                                });
                              },
                            );
                          }),
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
                          var product = Products[index];
                          return CategoryItemCard(
                            product: product,
                            onPress: () {
                              Navigator.pushNamed(context, '/home');
                            },
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
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900)),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text("More",
                          style: TextStyle(
                              fontSize: 18,
                              color: OpacityColor,
                              fontWeight: FontWeight.w500)),
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
                    itemBuilder: (context, index){
                      var product = Products[index];
                      return CategoryNewProductCard(
                        product: product,
                        onPress: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ));
  }
}
