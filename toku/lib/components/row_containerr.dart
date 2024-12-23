import 'package:flutter/material.dart';
import 'package:toku/model/object.dart';
import 'package:toku/components/phrases_item.dart';

class RowContainerr extends StatelessWidget {
  const RowContainerr({super.key, required this.object});
  final Object object;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.blueGrey,
      child: Row(
        children: [
          Container(
            color: const Color.fromARGB(255, 203, 215, 226),
            child: Image.asset(object.image!),
          ),
          Expanded(child: PhrasesItem(object: object))
        ],
      ),
    );
  }
}
