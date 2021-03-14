import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/models.dart';
import 'package:flutter/material.dart';

class CategoryNewProductCard extends StatelessWidget {
  final Product product;
  final Function onPress;

  const CategoryNewProductCard({Key key, @required this.product, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/product-details');
        },
        child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(bottom: 20),
                  width: 140,
                  decoration: BoxDecoration(
                      color: Converter.getColorFromHex(product.color),
                      borderRadius: BorderRadius.circular(16)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(product.name,
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                Positioned(
                  top: -5,
                  left: 20,
                  child: Container(
                      height: 100,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/drink-red.png'))),
                      )),
                )
              ],
            )));
  }
}
