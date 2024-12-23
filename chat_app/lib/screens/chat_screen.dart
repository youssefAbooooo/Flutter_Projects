import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String id = 'chatScreen';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    List<Message> messagesList = [];
    Widget showLoadingIndicator() {
      return const Center(child: CircularProgressIndicator());
    }

    void scrollDown() {
      _controller.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }

    Widget showChatPage() {
      return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                kLogo,
                height: 50,
              ),
              const Text('Chat', style: TextStyle(color: kSecondaryColor)),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: messagesList.length,
                itemBuilder: (context, index) {
                  return messagesList[index].id == email
                      ? ChatBuble(message: messagesList[index])
                      : ChatBubleForFriend(message: messagesList[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                onSubmitted: (data) {
                  messages.add(
                    {'message': data, 'createdAt': DateTime.now(), 'id': email},
                  );
                  controller.clear();
                  scrollDown();
                },
                decoration: InputDecoration(
                  hintText: 'Message',
                  suffixIcon: IconButton(
                    onPressed: () {
                      messages.add(
                        {
                          'message': controller.text,
                          'createdAt': DateTime.now(),
                          'id': email
                        },
                      );
                      controller.clear();
                      scrollDown();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //! clearing the list to not duplicate the messages and build the same message twice
          messagesList = [];

          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          // for (var i = 0; i < snapshot.data!.docs.length; i++) {
          //   print(messagesList[i].message);
          // }
          return showChatPage();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }
}
