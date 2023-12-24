import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key, required this.dataList});
  final List dataList;
  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My cart"),
      ),
      body: ListView.builder(
        
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Container(
                height: 130,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(140),
                  child: Image.asset(
                    "images/${widget.dataList[index]["image"]}.jpg",
                    height: 100,
                    // width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                "${widget.dataList[index]["name"]}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.amber),
              ),
              subtitle: Text(
                "${DateTime.now()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.red),
              ),
              trailing: Text(
                "${widget.dataList[index]["price"]} \$",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          );
        },
      ),
    );
  }
}
