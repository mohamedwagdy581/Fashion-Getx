import 'package:flutter/material.dart';

class KidsCategories extends StatefulWidget {
  const KidsCategories({Key? key}) : super(key: key);

  @override
  _KidsCategoriesState createState() => _KidsCategoriesState();
}

class _KidsCategoriesState extends State<KidsCategories> {
  var productList = [
    {
      'name': 'SweetShirt',
      'picture': 'assets/images/cats/kids.png',
    },
    {
      'name': 'SweetShirt',
      'picture': 'assets/images/cats/kids1.png',
    },
    {
      'name': 'T-Shirt',
      'picture': 'assets/images/cats/kids2.png',
    },
    {
      'name': 'Back Bag',
      'picture': 'assets/images/cats/kids3.png',
    },
    {
      'name': 'Shirt',
      'picture': 'assets/images/cats/shirt.jpg',
    },
    {
      'name': 'Hat',
      'picture': 'assets/images/cats/kids4.png',
    },
    {
      'name': 'Coat',
      'picture': 'assets/images/cats/kidscoat.png',
    },
    {
      'name': 'Shoes',
      'picture': 'assets/images/cats/kidshoes.png',
    },
    {
      'name': 'Formal',
      'picture': 'assets/images/cats/formal.png',
    },
    {
      'name': 'Formal',
      'picture': 'assets/images/cats/formal.png',
    },
    {
      'name': 'Jeans',
      'picture': 'assets/images/cats/jeans.png',
    },
    {
      'name': 'Shirt',
      'picture': 'assets/images/cats/shirt.jpg',
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
