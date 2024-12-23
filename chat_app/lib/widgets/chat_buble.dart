import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: kPrimaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${message.message} ",
              style: const TextStyle(color: kSecondaryColor),
            ),
            Text(
              "${message.createdAt.toDate().hour}:${message.createdAt.toDate().minute}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: Color(0XFF006D84),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${message.id} ",
                  style: const TextStyle(color: Colors.orange),
                ),
                Text(
                    "${message.createdAt.toDate().hour}:${message.createdAt.toDate().minute}",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            Text(
              message.message,
              // textAlign: TextAlign.left,
              style: const TextStyle(color: kSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
