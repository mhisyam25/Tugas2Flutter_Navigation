import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  const DetailPage({
    Key? key,
    required this.image,
    required this.name,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              width: 330,
              height: 330,
            ),
            const SizedBox(height: 16,),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 16,),
            Text(price.toString()),

            Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              width: 330.0,
              height: 75,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text('Beli'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
