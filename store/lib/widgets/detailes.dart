import 'package:flutter/material.dart';
import 'package:ui/widgets/Home.dart';
import 'package:ui/widgets/shopping.dart';

import 'me.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({
    super.key,
    required this.nam,
    required this.des,
    required this.sal,
    required this.im,
    required this.size,
  });
  final String nam, des, sal, im, size;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  var list = [];
  int statu = 0;
  int notif = 0;
  @override
  void dispose() {
    notif = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: statu,
        onTap: (value) {
          setState(() {
            statu = value;
            if (value == 1) {
              notif = 0;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Shopping(dataList: list);
                },
              ));
            } else if (value == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Me();
                },
              ));
            } else if (value == 0) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Shooping"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Me")
        ],
        iconSize: 30,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
      ),
      appBar: AppBar(
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    notif = 0;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Shopping(dataList: list);
                      },
                    ));
                  });
                },
                child: Icon(
                  Icons.shop,
                  color: notif == 0 ? Colors.black : Colors.red,
                ),
              ),
              Positioned(
                top: -2,
                right: 1,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: notif > 0 ? Colors.grey : Colors.grey[300],
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "$notif",
                    style: TextStyle(
                        color: notif == 0 ? Colors.grey[300] : Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("Sing")),
                const PopupMenuItem(child: Text("About")),
                const PopupMenuItem(child: Text("Home")),
                PopupMenuItem(
                  child: const Text("logout"),
                  onTap: () {
                    Navigator.of(context).pop(const HomePage());
                  },
                ),
              ];
            },
          ),
        ],
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shop,
              color: Colors.orange,
            ),
            Text(
              " Shopping",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              " Now ",
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.grey[700]),
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/${widget.im}.jpg"),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              widget.nam,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            child: Text(
              widget.des,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              "${widget.sal} \$",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.orange,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Color :    ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.orange)),
              ),
              Text(
                "   Gray    ",
                style: TextStyle(color: Colors.grey[600]),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Text(
                "   Black",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              " Size :  ${widget.size}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            color: Colors.black,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  notif++;

                  list.add({
                    "name": widget.nam,
                    "image": widget.im,
                    "price": widget.sal
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.orange,
                      duration: Duration(seconds: 1),
                      content: Text("Added successfuly"),
                    ),
                  );
                });
              },
              child: const Text(
                "Add To Cart",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
