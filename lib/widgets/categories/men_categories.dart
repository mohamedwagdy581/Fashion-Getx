import 'package:flutter/material.dart';

class MenProducts extends StatefulWidget {
  const MenProducts({Key? key}) : super(key: key);

  @override
  _MenProductsState createState() => _MenProductsState();
}

class _MenProductsState extends State<MenProducts> {
  var productList = [
    {
      'name': 'Formal',
      'picture': 'assets/images/cats/formal.png',
    },
    {
      'name': 'Informal',
      'picture': 'assets/images/cats/informal.png',
    },
    {
      'name': 'Jeans',
      'picture': 'assets/images/cats/jeans.png',
    },
    {
      'name': 'Shoes',
      'picture': 'assets/images/cats/manshoes.png',
    },
    {
      'name': 'Coat',
      'picture': 'assets/images/cats/chinees.png',
    },
    {
      'name': 'Shirt',
      'picture': 'assets/images/cats/shirt.jpg',
    },
    {
      'name': 'Informal',
      'picture': 'assets/images/cats/sweetshirt.png',
    },
    {
      'name': 'T-Shirt',
      'picture': 'assets/images/cats/tshirt.png',
    },
    {
      'name': 'Sport',
      'picture': 'assets/images/cats/sport.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: productList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productList[index]['name'],
            productList[index]['picture'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final dynamic prodName;
  final dynamic prodPicture;

  const SingleProduct(this.prodName, this.prodPicture, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 80.0,
            child: ListTile(
              title: Image.asset(
                prodPicture,
                width: 150.0,
                height: 150.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  prodName,
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
