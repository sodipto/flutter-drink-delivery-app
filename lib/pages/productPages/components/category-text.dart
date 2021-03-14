import 'package:drink_app/constants/color-utils.dart';
import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final bool isVertical;
  final Function onPress;

  const CategoryText(
      {Key key,
      @required this.text,
      this.index,
      this.selectedIndex,
      this.isVertical = false,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: !isVertical?Padding(
        padding: EdgeInsets.only(right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text,
                style: TextStyle(
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.w400,
                    fontSize: selectedIndex == index ? 16 : 16,
                    color: selectedIndex == index
                        ? Color(0xFF58910F)
                        : Colors.black)),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 4,
              width: 40,
              color: selectedIndex == index
                  ? Color(0xFFCBE19D)
                  : Colors.transparent,
            )
          ],
        ),
      ):Container(
        margin: EdgeInsets.only(top: 25),
        child: RotatedBox(
          quarterTurns: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              selectedIndex == index? Container(
                margin: EdgeInsets.only(top: 10),
                height: 8,
                width: 10,
                decoration: BoxDecoration(
                    color: BrandColor,
                    shape: BoxShape.circle
                ),
              ):Container(),
              SizedBox(width: selectedIndex == index?5:0),
              Text(text,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: selectedIndex == index?FontWeight.bold:FontWeight.w400,
                      color: selectedIndex == index
                          ? Color(0xFF58910F)
                          : OpacityColor)),
            ],
          ),
        ),
      ),
    );
  }
}
