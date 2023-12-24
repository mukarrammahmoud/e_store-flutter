import 'package:flutter/material.dart';
import 'package:ui/widgets/detailes.dart';

class Products extends StatelessWidget {
  const Products(
      {super.key,
    required  this.siz,
      required this.name,
      required this.desc,
      required this.sale,
      required this.img});
  final String name, desc, sale, img,siz;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ItemDetails(nam: name, des: desc, sal: sale, im: img, size:siz,);
          },
        ));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(20),
              width: 300,
              color: Colors.grey[200],
              child: Image.asset(
                "images/$img.jpg",
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$desc ",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$sale\$ ",
                    style: const TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
