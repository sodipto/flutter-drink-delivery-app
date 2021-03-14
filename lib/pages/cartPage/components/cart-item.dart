import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/constants/converter-helper.dart';
import 'package:flutter/material.dart';

import '../../../models.dart';

class CartProduct extends StatelessWidget {
  final CartItem item;
  final Function addItemOnpress;
  final Function removeItemOnpress;

  const CartProduct({Key key,@required this.item,this.addItemOnpress,this.removeItemOnpress})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
          height: 120,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/product-details');
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Converter.getColorFromHex(item.color),
                      borderRadius: BorderRadius.circular(22)),
                  child: Center(
                    child: Image.asset(
                        item.imgfUrl,
                        height: 60
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color(0xFF1F2906))),
                    SizedBox(height: 10),
                    Text("Signature Product",style: TextStyle(fontSize: 14,color:OpacityColor)),
                    SizedBox(height: 10),
                    Text("¥ ${item.price.toStringAsFixed(0)}",style: TextStyle(fontSize: 18,color:BrandColor,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.add,size: 22),
                    onPressed: addItemOnpress,
                  ),
                  Text(item.quantity.toString(),style: TextStyle(fontSize: 16)),
                  IconButton(
                    icon: Icon(Icons.remove,size: 22,color: item.quantity==1? OpacityColor:Colors.black,),
                    onPressed: removeItemOnpress,
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
