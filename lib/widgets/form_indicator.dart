import 'package:flutter/material.dart';
import 'package:zebrazone/helper/formColor.dart';

class FormIndicator extends StatelessWidget {
  final String letter;
  const FormIndicator({Key key, this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: formColor(letter),
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
