// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ui/widgets/categories.dart';
import 'package:ui/widgets/me.dart';
import 'package:ui/widgets/product.dart';
import 'package:ui/widgets/shopping.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int statu = 0;
  List category = [
    {"iconename": "s2", "title": "Shoes"},
    {"iconename": "mobile2", "title": "Mobile"},
    {"iconename": "c3", "title": "Clothes"},
    {"iconename": "lap2", "title": "Labtop"},
  ];
  List items = [
    {
      "image": "s2",
      "title": "Shoes",
      "subtitle": "Shoes Men",
      "price": "240",
      "size": "30  40  33  22  25"
    },
    {
      "image": "c3",
      "title": "Clothes sweat",
      "subtitle": "Clothes for could",
      "price": "20",
      "size": "30  34  27  22  31",
    },
    {
      "image": "f",
      "title": "Furnature",
      "subtitle": "Chiars ",
      "price": "150",
      "size": "1",
    },
    {
      "image": "lap",
      "title": "Labtop Mac",
      "subtitle": "Mac 6G, ram 16",
      "price": "140",
      "size": "1"
    },
    {
      "image": "mobile",
      "title": "Mobile",
      "subtitle": "I phone pro 12 ",
      "price": "250",
      "size": "1"
    },
    {
      "image": "c",
      "title": "Clothes",
      "subtitle": " Clotes For Men",
      "price": "50",
      "size": "29  30  22   25 33"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: statu,
        onTap: (value) {
          setState(() {
            statu = value;
            if (value == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Shopping(dataList: [],);
                },
              ));
            } else if (value == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Me();
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  hintText: "Search",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              )),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.menu_sharp,
                  size: 40,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: category.length,
              itemBuilder: (context, index) {
                return Categories(
                    img: "${category[index]["iconename"]}",
                    name: "${category[index]["title"]}");
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          const Text(
            "Best Selling",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GridView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Products(
                name: "${items[index]["title"]}",
                desc: "${items[index]["subtitle"]}",
                sale: "${items[index]["price"]}",
                img: "${items[index]["image"]}",
                siz: "${items[index]["size"]}",
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
            ),
          ),
        ]),
      ),
    );
  }
}
