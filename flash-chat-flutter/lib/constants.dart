import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const String kHeroLogoTag = 'logo';

final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
final Firestore firebaseFirestoreInstance = Firestore.instance;
const String messageCollection = 'messages';
const String messageCollectionTextField = 'text';
const String messageCollectionSenderField = 'sender';
const String messageCollectionTimestampField = 'timestamp';
