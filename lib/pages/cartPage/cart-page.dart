import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalBill = 110;
  int _selectedIndexTab = 1;
  List<CartItem> items =[
    new CartItem('Green Tea','9FC743','assets/images/drink-red.png',1,36),
    new CartItem('Rose Tea','CBDB51','assets/images/drink-red.png',2,24),
    new CartItem('Black Tea','E8DC9A','assets/images/drink-red.png',1,26),
    new CartItem('Jasmine tea','FFE4E4','assets/images/drink-red.png',1,25),
    new CartItem('Green Tea','9FC743','assets/images/drink-red.png',1,27),
    new CartItem('Jasmine Tea','CBDB51','assets/images/drink-red.png',5,19),
    new CartItem('Black Tea','E8DC9A','assets/images/drink-red.png',1,18),
    new CartItem('Rose tea','FFE4E4','assets/images/drink-red.png',1,17),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top + 20,horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shopping Cart",
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("A total of 3 pices",style: TextStyle(fontSize:18,color:opacityColor)),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: items.take(3).length,
                itemBuilder: (context, index) {
                  CartItem item= items[index];
                  // error show setState() or markNeedsBuild() called during build.
                  // setState(() {
                  //       totalBill+=item.price;
                  // });
                  return buildCartProduct(item);
                }
              ),
              SizedBox(height: 20),
              Container(
                height: 65,
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color(0xFF86C100),
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical:12.0,horizontal: 30),
                  onPressed: () {
                    Navigator.pushNamed(context, '/delivery');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Total  ¥  ',
                          style: TextStyle(color: Colors.white,fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(text: totalBill.toStringAsFixed(0), style: TextStyle(fontSize: 26)),
                          ],
                        ),
                      ),
                      Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget buildCartProduct(CartItem product) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
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
                        Text("Signature Product",style: TextStyle(fontSize: 14,color:opacityColor)),
                        SizedBox(height: 10),
                        Text("¥ ${product.price.toStringAsFixed(0)}",style: TextStyle(fontSize: 18,color:brandColor,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     IconButton(
                       icon: Icon(Icons.add,size: 22),
                       onPressed: (){
                           setState(() {
                             product.quantity++;
                             totalBill+=product.price;
                           });
                       },
                     ),
                    Text(product.quantity.toString(),style: TextStyle(fontSize: 16)),
                    IconButton(
                      icon: Icon(Icons.remove,size: 22,color: product.quantity==1? opacityColor:Colors.black,),
                      onPressed: (){
                        setState(() {
                          if(product.quantity > 0) {
                            product.quantity--;
                            totalBill-=product.price;
                          }
                        });
                      },
                    )
                    ],
                  )
                ],
              )
          ),
        ));
  }
}
