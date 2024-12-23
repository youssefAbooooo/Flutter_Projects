import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String id;
  final Timestamp createdAt;

  Message({required this.message, required this.id, required this.createdAt});

  factory Message.fromJson(jsonData) {
    return Message(
      message: jsonData['message'],
      id: jsonData['id'],
      createdAt: jsonData['createdAt'],
    );
  }
}
