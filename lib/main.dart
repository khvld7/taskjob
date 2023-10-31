import 'package:flutter/material.dart';
import 'package:taskjob/components/custom_textfield.dart';
import 'package:taskjob/views/recipient.dart';
import 'package:taskjob/views/sender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Sender());
  }
}
