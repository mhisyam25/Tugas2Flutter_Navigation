import 'package:flutter/material.dart';
import 'package:tugas2_navigation/detail_page.dart';

import 'package:tugas2_navigation/model/jualan.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: _createListCard(),
      ),
    );
  }

  Widget _createListCard() {
    var dataJualan = getData;

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataJualan[index], context);
      },
      itemCount: dataJualan.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: const EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(Jualan data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(image: data.image, name: data.name, price: data.price,);
          }));
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(data.image),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Text(data.name)),
            ),
          ],
        ),
      ),
    );
  }
}
