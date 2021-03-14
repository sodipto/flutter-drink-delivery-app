import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/pages/cartPage/cart-page.dart';
import 'package:drink_app/pages/productPages/product-page.dart';
import 'package:drink_app/pages/profilePage/profile-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({ Key key,this.index=0}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex=widget.index;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> pages=[
       ProductPage(),
       CartPage(),
       ProfilePage(),
    ];
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
                      color: _selectedIndex==0?BottomNavigationSelectedColor:Color(0xFFC1C7BA),
                      height: 25
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/shopping-bag.svg',
                      color: _selectedIndex==1?BottomNavigationSelectedColor:Color(0xFFC1C7BA),
                      height: 25
                  ),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/user.svg',
                      color: _selectedIndex==2?BottomNavigationSelectedColor:Color(0xFFC1C7BA),
                      height: 25
                  ),
                  label: 'My',
                ),
              ],
              //type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              selectedItemColor: BottomNavigationSelectedColor,
              selectedIconTheme: IconThemeData(
                  color: BottomNavigationSelectedColor
              ),
              unselectedItemColor: Color(0xFFB1B5A3),
              selectedFontSize: 16,
              unselectedFontSize: 14,
              iconSize: 25,
              onTap:(index){
                setState(() {
                  _selectedIndex=index;
                });
              },
              elevation: 0,
            ),
          ),
        ),
      body: pages[_selectedIndex]
    );
  }

}
