import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/models.dart';
import 'package:flutter/material.dart';

class ProductDetailsCard extends StatelessWidget {
  final Product product;
  final Function onPress;

  const ProductDetailsCard({Key key,@required this.product,this.onPress})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Padding(
          padding: EdgeInsets.only(top: 0),
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
                      child: Image.asset(product.imgfUrl, height: 60),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2906))),
                        SizedBox(height: 10),
                        Text("Signature Product",
                            style: TextStyle(color: OpacityColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\¥  ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: '24',
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2906))),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
