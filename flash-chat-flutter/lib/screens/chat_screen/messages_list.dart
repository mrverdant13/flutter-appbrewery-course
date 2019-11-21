import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen/message_bubble.dart';

class MessagesList extends StatelessWidget {
  final String loggedInUserEmail;

  MessagesList({
    @required this.loggedInUserEmail,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firebaseFirestoreInstance
          .collection(messageCollection)
          .orderBy(messageCollectionTimestampField, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final Iterable<DocumentSnapshot> messages = snapshot.data.documents;
        List<MessageBubble> messageWidgets = [];
        for (DocumentSnapshot message in messages) {
          final String messageText = message.data[messageCollectionTextField];
          final String messageSender =
              message.data[messageCollectionSenderField];
          final messageWidget = MessageBubble(
            messageText: messageText,
            messageSender: messageSender,
            isMyMessage: messageSender == loggedInUserEmail,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
