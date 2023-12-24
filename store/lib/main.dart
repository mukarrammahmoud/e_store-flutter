import 'package:flutter/material.dart';

import 'package:ui/widgets/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "متجر ألكتروني",
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
