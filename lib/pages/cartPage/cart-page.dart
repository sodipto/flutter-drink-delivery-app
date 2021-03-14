import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/data/static-data.dart';
import 'package:drink_app/models.dart';
import 'package:drink_app/pages/cartPage/components/cart-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalBill = 110;
  int _selectedIndexTab = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      //physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.top + 20, horizontal: 18),
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
                Text("A total of 3 pices",
                    style: TextStyle(fontSize: 18, color: OpacityColor)),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: Cartitems.take(3).length,
                itemBuilder: (context, index) {
                  CartItem item = Cartitems[index];
                  return CartProduct(
                    item: item,
                    addItemOnpress: () {
                      setState(() {
                        item.quantity++;
                        totalBill += item.price;
                      });
                    },
                    removeItemOnpress: () {
                      setState(() {
                        if (item.quantity > 0) {
                          item.quantity--;
                          totalBill -= item.price;
                        }
                      });
                    },
                  );
                }),
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
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
                onPressed: () {
                  Navigator.pushNamed(context, '/delivery');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Total  ¥  ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: totalBill.toStringAsFixed(0),
                              style: TextStyle(fontSize: 26)),
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
}
