import 'package:flutter/material.dart';
import 'package:whatsapp_clone/whatsapp-calls-screen.dart';

import 'package:whatsapp_clone/whatsapp-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ChatsScreen());
  }
}
