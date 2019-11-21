import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isMyMessage;

  MessageBubble({
    @required this.messageSender,
    @required this.messageText,
    this.isMyMessage = true,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            messageSender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMyMessage ? 30.0 : 0),
              topRight: Radius.circular(!isMyMessage ? 30.0 : 0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMyMessage ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                messageText,
                style: TextStyle(
                  color: isMyMessage ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
