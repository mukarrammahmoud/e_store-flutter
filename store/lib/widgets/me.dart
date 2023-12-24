import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _ShoppingState();
}

class _ShoppingState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Me"),
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
