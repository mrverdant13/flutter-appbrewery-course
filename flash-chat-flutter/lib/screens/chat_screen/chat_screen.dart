import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen/messages_list.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseUser _loggedInUser;
  String messageText;
  final TextEditingController messageTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                try {
                  firebaseAuthInstance.signOut();
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _loggedInUser != null
                ? MessagesList(
                    loggedInUserEmail: _loggedInUser.email,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextEditingController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextEditingController.clear();
                      firebaseFirestoreInstance
                          .collection(messageCollection)
                          .add({
                        messageCollectionTextField: messageText,
                        messageCollectionSenderField: _loggedInUser.email,
                        messageCollectionTimestampField:
                            Timestamp.now().toDate().toString(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentUser() async {
    try {
      final user = await firebaseAuthInstance.currentUser();
      if (user != null) {
        setState(() {
          _loggedInUser = user;
        });
        print(_loggedInUser.email);
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }
}
