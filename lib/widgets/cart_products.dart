import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productOnCart = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productOnCart.length,
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cartProdName: productOnCart[index]['name'],
          cartProdPicture: productOnCart[index]['picture'],
          cartProdPrice: productOnCart[index]['price'],
          cartProdBrand: productOnCart[index]['brand'],
          /* cartProdSize: productOnCart[index]['size'],
          cartProdColor: productOnCart[index]['color'],
          cartProdQuantity: productOnCart[index]['quantity'],*/
        );
      },
    );
  }
}

class SingleCartProduct extends StatefulWidget {
  final dynamic cartProdName;
  final dynamic cartProdPicture;
  final dynamic cartProdPrice;
  final dynamic cartProdBrand;
  /*final cartProdSize;
  final cartProdColor;
  final cartProdQuantity;*/

  const SingleCartProduct({
    Key? key,
    this.cartProdName,
    this.cartProdPicture,
    this.cartProdPrice,
    this.cartProdBrand,
    /*
        this.cartProdSize,
        this.cartProdColor,
        this.cartProdQuantity
        */
  }) : super(key: key);

  @override
  State<SingleCartProduct> createState() => _SingleCartProductState();
}

class _SingleCartProductState extends State<SingleCartProduct> {
  var i = 1;
  @override
  Widget build(BuildContext context) {
    var cartProdQuantity = 1;
    return Card(
      child: ListTile(
        leading: Image.asset(
          widget.cartProdPicture,
          width: 80.0,
          height: 100.0,
        ),
        title: Text(widget.cartProdName),
        subtitle: Container(
          alignment: Alignment.topLeft,
          child: Text(
            '\$${widget.cartProdPrice}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red,
            ),
          ),
        ),
        trailing: SizedBox(
          width: 150,
          height: 100,
          child: Row(
            children: <Widget>[
              // Custom Decrease button
              customAddAndMinusButton(() {
                setState(() {
                  if (i > 0) {
                    i--;
                  }
                });
              }, Icons.remove),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text('$i'),
              ),
              // Custom Add Button
              customAddAndMinusButton(() {
                setState(() {
                  i++;
                });
              }, Icons.add),
            ],
          ),
        ),
      ),
    );
  }

  Widget customAddAndMinusButton(VoidCallback onPress, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 30,
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.grey,
          onPressed: onPress,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
