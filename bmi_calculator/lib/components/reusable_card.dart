import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.colour, this.cardChild, this.onPress});

  final Color? colour;
  final Widget? cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
