import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.img, required this.name});

  final String img, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: Colors.grey[400],
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "images/$img.jpg",
                width: 40,
                height: 40,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey[700],
          ),
        )
      ],
    );
  }
}
