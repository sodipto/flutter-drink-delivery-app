import 'package:drink_app/constants/converter-helper.dart';
import 'package:drink_app/models.dart';
import 'package:flutter/material.dart';

class CategoryItemCard extends StatelessWidget {
  final Product product;
  final Function onPress;

  const CategoryItemCard({
    Key key,
    @required this.product,
    this.onPress
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        padding: EdgeInsets.all(20),
        width: 300,
        decoration: BoxDecoration(
          color: Converter.getColorFromHex(product.color),
          borderRadius:
          BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text('Cool summer \nevent',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400)),
            SizedBox(height: 5),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(product.imgfUrl,
                        height: 200,
                        fit: BoxFit.fitHeight))),
            Text('¥ 36.00',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
