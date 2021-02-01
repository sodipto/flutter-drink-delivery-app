import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/pages/cartPage/cart-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF9FC743),
      //   elevation: 0,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left:16.0),
      //     child: IconButton(
      //         icon: SvgPicture.asset(
      //             'assets/icons/left-arrow.svg',
      //             color: Colors.white,height: 25
      //         ),
      //         onPressed: () => Navigator.pop(context)
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding:  EdgeInsets.only(right:12.0),
      //       child: IconButton(
      //         icon: SvgPicture.asset(
      //           'assets/icons/shopping-bag.svg',
      //           color: Colors.white,height: 25
      //       ),
      //       ),
      //     ),
      //   ],
      // ),
      backgroundColor: Color(0xFF9FC743),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: SvgPicture.asset(
                    'assets/icons/edit.svg',
                    color: Color(0xFFC1C7BA),height: 25
                ),
                onPressed: () {}
                ),
            IconButton(
                icon: Icon(Icons.favorite_outline_sharp,
                    size: 30, color: Color(0xFFC1C7BA)),
                onPressed: () {}),
            Container(
              height: 65,
              width: 150,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: buttonColor,
                textColor: Colors.white,
                padding: EdgeInsets.all(12.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Text(
                  "Purchased",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
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
                  top: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(right: 0),
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF92BF2A),
                          width: 40,
                        )
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 14,
                  child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/icons/left-arrow.svg',
                          color: Colors.white,height: 25
                      ),
                      onPressed: () => Navigator.pop(context)
                  )
                ),
                Positioned(
                    top: 30,
                    right: 14,
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/icons/shopping-bag.svg',
                          color: Colors.white,height: 25
                      ),
                        onPressed: () {
                          print(size.height);
                        }
                    )
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Green Tea",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("Signature Product",style: TextStyle(color: Colors.white,fontSize: 18)),
                      Padding(
                        padding: EdgeInsets.only(top:50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\¥",style: TextStyle(color: Colors.white,fontSize: 24)),
                            SizedBox(width: 5),
                            Text("36",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: size.height * 0.40,
                    child: Container(
                      height: size.height/2+80,
                      width: size.width,
                      padding: EdgeInsets.only(top: size.height * 0.06 , left: 20,right: 8,bottom: 70),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))
                      ),
                      child: ListView(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Particulars",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold)),
                          SizedBox(height: 15),
                          Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.",style: TextStyle(color: Colors.black.withOpacity(0.50),fontSize: 18,fontFamily: 'Open Sans')),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Icon(Icons.star,size: 25,color: Color(0xFF86C100)),
                              SizedBox(width : 5),
                              Icon(Icons.star,size: 25,color: Color(0xFF86C100)),
                              SizedBox(width : 5),
                              Icon(Icons.star,size: 25,color: Color(0xFF86C100)),
                              SizedBox(width : 5),
                              Icon(Icons.star,size: 25,color: Color(0xFF86C100)),
                              SizedBox(width : 5),
                              Icon(Icons.star,size: 25,color: Color(0xFF86C100)),
                            ],
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDF5DA),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.favorite_outline_sharp,size: 30,color: Color(0xFF86C100)),
                                    SizedBox(height: 5),
                                    Text("500ml",style: TextStyle(color: Color(0xFF86C100),fontSize: 18,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDF5DA),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.ac_unit_rounded,size: 30,color: Color(0xFF86C100)),
                                    SizedBox(height: 5),
                                    Text("Less ice",style: TextStyle(color: Color(0xFF86C100),fontSize: 18,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEDF5DA),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.animation,size: 30,color: Color(0xFF86C100)),
                                    SizedBox(height: 5),
                                    Text("suger",style: TextStyle(color: Color(0xFF86C100),fontSize: 18,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Text("Service",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold)),
                          SizedBox(height: 15),
                          Text("There are many variations of passages of Lorem Ipsum available.",style: TextStyle(color: Colors.black.withOpacity(0.50),fontSize: 18)),
                          SizedBox(height: 30),
                          Text("Description",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold)),
                          SizedBox(height: 15),
                          Text("There are many variations of passages of Lorem Ipsum available.",style: TextStyle(color: Colors.black.withOpacity(0.50),fontSize: 18)),
                          SizedBox(height: 30),
                        ],
                      ),
                    )
                ),
                Positioned(
                  top: size.height * 0.40-180,
                  right: 0,
                  child: Container(
                    height: 230,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/drink-red.png'),
                            fit: BoxFit.fitHeight
                        )
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
