import 'package:flutter/foundation.dart';

class Task {
  final String text;
  bool done;

  Task({@required this.text, this.done = false});
}
