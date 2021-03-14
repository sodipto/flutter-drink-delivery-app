import 'package:drink_app/constants/color-utils.dart';
import 'package:flutter/material.dart';

class CommentTextfieldArea extends StatelessWidget {
  final Function (String) onChange;

  const CommentTextfieldArea({
    Key key,
    this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      onChanged: onChange,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Add a comment...',
          hintStyle: TextStyle(
              color: OpacityColor, fontSize: 16)),
    );
  }
}
