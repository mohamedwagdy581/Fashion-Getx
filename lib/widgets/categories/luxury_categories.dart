import 'package:flutter/material.dart';

class LuxuryCategories extends StatefulWidget {
  const LuxuryCategories({Key? key}) : super(key: key);

  @override
  _LuxuryCategoriesState createState() => _LuxuryCategoriesState();
}

class _LuxuryCategoriesState extends State<LuxuryCategories> {
  var productList = [
    {
      'name': 'Black Accessories',
      'picture': 'assets/images/blackaccessoires.jpg',
    },
    {
      'name': 'Black Shoes',
      'picture': 'assets/images/blackshoes.jpg',
    },
    {
      'name': 'Blazer',
      'picture': 'assets/images/Blazer.jpg',
    },
    {
      'name': 'Blue Dress',
      'picture': 'assets/images/bluedress.jpg',
    },
    {
      'name': 'Blue Shoes',
      'picture': 'assets/images/blueshoes.jpg',
    },
    {
      'name': 'Green Jacket',
      'picture': 'assets/images/greenjacket.jpg',
    },
    {
      'name': 'Formal',
      'picture': 'assets/images/formal.jpg',
    },
    {
      'name': 'Formal',
      'picture': 'assets/images/formal2.jpg',
    },
    {
      'name': 'Grey Blazer',
      'picture': 'assets/images/grayBlazer.jpg',
    },
    {
      'name': 'Pink Shoes',
      'picture': 'assets/images/pinkShoes.jpg',
    },
    {
      'name': 'Shoes',
      'picture': 'assets/images/pinkshoess.jpg',
    },
    {
      'name': 'Orange Dress',
      'picture': 'assets/images/redDress.jpg',
    },
    {
      'name': 'Red Jacket',
      'picture': 'assets/images/redjacket.jpg',
    },
    {
      'name': 'Red Shirt',
      'picture': 'assets/images/redtshirt.jpg',
    },
    {
      'name': 'Travel Accessories',
      'picture': 'assets/images/travelaccessoires.jpg',
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
