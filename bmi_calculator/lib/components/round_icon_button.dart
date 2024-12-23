import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPress});

  final IconData? icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 3.0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
