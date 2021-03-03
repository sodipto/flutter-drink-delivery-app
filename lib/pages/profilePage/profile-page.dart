import 'package:drink_app/constants/color-utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: brandColor,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/home.svg',
                      color: Color(0xFFC1C7BA), height: 25),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/shopping-bag.svg',
                      color: Color(0xFFC1C7BA), height: 25),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/user.svg',
                      color: bottomNavigationSelectedColor, height: 25),
                  label: 'My',
                ),
              ],
              //type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: 2,
              selectedItemColor: bottomNavigationSelectedColor,
              selectedIconTheme:
                  IconThemeData(color: bottomNavigationSelectedColor),
              unselectedItemColor: Color(0xFFB1B5A3),
              selectedFontSize: 16,
              unselectedFontSize: 14,
              iconSize: 25,
              onTap: (index) {
                setState(() {});
              },
              elevation: 0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height,
                    padding: EdgeInsets.only(top: size.height * 0.10 , left: 16,right: 5),
                    width: double.infinity,
                  ),
                  Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      right: 14,
                      child: IconButton(
                          icon: SvgPicture.asset(
                              'assets/icons/copy.svg',
                              color: Colors.white,height: 25
                          ),
                          onPressed: () {
                            print(size.height);
                          }
                      )
                  ),
                  Positioned(
                    top: size.height * 0.45/2-65,
                    left: size.width/2-60,
                    child: Column(
                      children: [
                         Container(
                           height: 120,
                           width: 120,
                           decoration:BoxDecoration(
                             shape: BoxShape.circle,
                               boxShadow: <BoxShadow>[
                                 BoxShadow(
                                   color: Colors.black12,
                                   blurRadius: 5,
                                 ),
                               ],
                               image: DecorationImage(
                                   image: AssetImage('assets/images/user.png'),
                                   fit: BoxFit.fill
                               )
                           ),
                         ),
                         SizedBox(height: 10),
                         Text("Roton Pondit",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Positioned(
                      top: size.height * 0.45,
                      child: Container(
                        height: size.height/2+80,
                        width: size.width,
                        padding: EdgeInsets.only(top: 30 , left: 20,right: 20,bottom: 80),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))
                        ),
                        child: ProfileItem()
                      )
                  ),
                  Positioned(
                      top: size.height * 0.45-40,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.only(left:30,right: 25),
                        child: Container(
                          padding: EdgeInsets.all(20),
                            height: 80,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                  ),
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                            child: Text("dfdfddf fdf"),
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Divider(thickness: 1.5, color: Colors.grey),
        SizedBox(height: 5),
        ListTile(
          onTap: () {
            print("fdf");
          },
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
          leading: SvgPicture.asset('assets/icons/home.svg',
              color: IConColor, height: 22),
          title: Text("My Collection",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500)),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon:
            Icon(Icons.navigate_next, size: 30, color: IConColor),
          ),
        ),
        SizedBox(height: 5),
        Divider(thickness: 1.5, color: Colors.grey),
        SizedBox(height: 5),
        ListTile(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
          leading: SvgPicture.asset('assets/icons/home.svg',
              color:IConColor, height: 22),
          title: Text("Purchase record",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.navigate_next,
              size: 30,
              color: IConColor,
            ),
          ),
        ),
        SizedBox(height: 5),
        Divider(thickness: 1.5, color: Colors.grey),
        SizedBox(height: 5),
        ListTile(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
          leading: SvgPicture.asset('assets/icons/home.svg',
              color: IConColor, height: 22),
          title: Text("Notice",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.navigate_next,
              size: 30,
              color:IConColor,
            ),
          ),
        ),
        SizedBox(height: 5),
        Divider(thickness: 1.5, color: Colors.grey),
        SizedBox(height: 5),
        ListTile(
          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
          leading: SvgPicture.asset('assets/icons/home.svg',
              color: IConColor, height: 22),
          title: Text("Set up",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.navigate_next,
              size: 30,
              color:IConColor,
            ),
          ),
        ),
        SizedBox(height: 5),
        Divider(thickness: 1.5, color: Colors.grey),
        SizedBox(height: 5),
      ],
    );
  }
}
