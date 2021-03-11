import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:drink_app/models.dart';
import 'package:drink_app/pages/commentPages/product-review.dart';
import 'package:drink_app/pages/detailsPage/details-page.dart';
import 'package:drink_app/pages/homepage/dashboard.dart';
import 'package:drink_app/pages/profilePage/profile-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedindex = 0;
  int _selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2,
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      color: _selectedIndexTab==0?bottomNavigationSelectedColor:Color(0xFFC1C7BA),
                      height: 25
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/shopping-bag.svg',
                      color: _selectedIndexTab==1?bottomNavigationSelectedColor:Color(0xFFC1C7BA),
                      height: 25
                  ),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/user.svg',
                      color: _selectedIndexTab==2?bottomNavigationSelectedColor:Color(0xFFC1C7BA),
                      height: 25
                  ),
                  label: 'My',
                ),
              ],
              //type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: _selectedIndexTab,
              selectedItemColor: bottomNavigationSelectedColor,
              selectedIconTheme: IconThemeData(
                  color: bottomNavigationSelectedColor
              ),
              unselectedItemColor: Color(0xFFB1B5A3),
              selectedFontSize: 16,
              unselectedFontSize: 14,
              iconSize: 25,
              onTap:(index){
                setState(() {
                  _selectedIndexTab=index;
                  if(_selectedIndexTab==2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  }
                  else if(_selectedIndexTab==0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  }

                  else if(_selectedIndexTab==1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductReview()),
                    );
                  }
                });
              },
              elevation: 0,
            ),
          ),
        ),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Coolcat",
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.w900)),
                  IconButton(
                      icon: SvgPicture.asset(
                          'assets/icons/messenger.svg',
                          color: appBarIConColor,height: 28
                      ),
                      onPressed: () {}
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
                  hintText: "Lemonade",
                  hintStyle: TextStyle(color: Color(0xFFCBCCC9), fontSize: 22),
                  fillColor: Color(0xFFF5F6F2),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 10),
                    child:
                        Icon(Icons.search, size: 28, color: Color(0xFFCBCCC9)),
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
              Text("Will Buy", style: TextStyle(fontSize: 22)),
              SizedBox(),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: Products.length,
                    itemBuilder: (context, index) => buildBuyProductCard(Products[index]),
                  )
                ],
              )
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
      child: Padding(
        padding: EdgeInsets.only(right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(TeaCatagories[index],
                style: TextStyle(
                    fontSize: selectedindex == index ? 18 : 14,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetails()),
          );
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetails()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(top: 10),
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
