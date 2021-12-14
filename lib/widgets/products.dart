import 'package:fashion/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      'name': 'Black Accessories',
      'picture': 'assets/images/blackaccessoires.jpg',
      'old_price': '49.99',
      'price': '24.99',
      'brand': '110 Black USB'
    },
    {
      'name': 'Black Shoes',
      'picture': 'assets/images/blackshoes.jpg',
      'old_price': '24.99',
      'price': '14.99',
      'brand': 'S.O.G'
    },
    {
      'name': 'Blazer',
      'picture': 'assets/images/Blazer.jpg',
      'old_price': '50.00',
      'price': '24.99',
      'brand': 'But-I'
    },
    {
      'name': 'Blue Dress',
      'picture': 'assets/images/bluedress.jpg',
      'old_price': '60.00',
      'price': '39.99',
      'brand': 'Lorem ipsum'
    },
    {
      'name': 'Blue Shoes',
      'picture': 'assets/images/blueshoes.jpg',
      'old_price': '500.00',
      'price': '314.99',
      'brand': 'Sony'
    },
    {
      'name': 'Green Jacket',
      'picture': 'assets/images/greenjacket.jpg',
      'old_price': '300.00',
      'price': '99.99',
      'brand': 'ThrustMaster T Racing'
    },
    {
      'name': 'Formal',
      'picture': 'assets/images/formal.jpg',
      'old_price': '40.00',
      'price': '19.99',
      'brand': 'C.O.G'
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
            productList[index]['old_price'],
            productList[index]['price'],
            productList[index]['brand'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final dynamic prodName;
  final dynamic prodPicture;
  final dynamic prodOldPrice;
  final dynamic prodPrice;
  final dynamic prodBrand;

  const SingleProduct(this.prodName, this.prodPicture, this.prodOldPrice,
      this.prodPrice, this.prodBrand,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: () {
            Get.to(
              () => ProductsDetails(
                prodName,
                prodPicture,
                prodPrice,
                prodOldPrice,
                prodBrand,
              ),
            );
          },
          child: GridTile(
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Image.asset(
                  prodPicture,
                  fit: BoxFit.contain,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            footer: Container(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$prodName',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$$prodPrice',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
