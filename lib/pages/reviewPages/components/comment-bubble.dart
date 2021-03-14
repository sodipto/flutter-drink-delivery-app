import 'package:drink_app/constants/color-utils.dart';
import 'package:flutter/material.dart';

import '../../../models.dart';

class CommentBubble extends StatelessWidget {
  final Review user;

  const CommentBubble({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          leading: Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(1.8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.5, color: BrandColor),
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(user.userimage), fit: BoxFit.fitWidth),
              ),
            ),
          ),
          title: Text(user.username,
              style: TextStyle(
                  color: OpacityColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          subtitle: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(user.comment,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600))),
        ));
  }
}
