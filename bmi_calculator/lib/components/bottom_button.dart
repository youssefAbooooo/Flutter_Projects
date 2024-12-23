import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.text, this.onpressed});

  final String text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: const EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Center(
          child: Text(
            text,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
