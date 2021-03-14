import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onPress;

  const ProductCard({Key key,@required this.product,this.onPress})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
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
}
