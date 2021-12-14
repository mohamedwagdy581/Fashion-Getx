import 'package:flutter/material.dart';

class WomenProducts extends StatefulWidget {
  const WomenProducts({Key? key}) : super(key: key);

  @override
  _WomenProductsState createState() => _WomenProductsState();
}

class _WomenProductsState extends State<WomenProducts> {
  var productList = [
    {
      'name': 'Dress',
      'picture': 'assets/images/cats/dress.png',
    },
    {
      'name': 'Accessories',
      'picture': 'assets/images/cats/accessories.png',
    },
    {
      'name': 'Hoodi',
      'picture': 'assets/images/cats/hoodiwomen.png',
    },
    {
      'name': 'Shoes',
      'picture': 'assets/images/cats/shoes.png',
    },
    {
      'name': 'Coat',
      'picture': 'assets/images/cats/coatwomen.jpg',
    },
    {
      'name': 'MiniSkirt',
      'picture': 'assets/images/cats/miniskirt.png',
    },
    {
      'name': 'Shoes',
      'picture': 'assets/images/cats/shoes1.png',
    },
    {
      'name': 'Boat',
      'picture': 'assets/images/cats/shoes2.png',
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
