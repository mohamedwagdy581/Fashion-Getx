import 'package:fashion/widgets/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.home),
        onPressed: () => Get.to(() => const HomePage()),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /* bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.blueGrey),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shop, color: Colors.deepPurpleAccent),
              onPressed: () => Get.to(() => const AllProductsPage()),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.blueAccent),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () => Get.to(() => const FavoritePage()),
            ),
          ],
        ),
      ),*/
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.redAccent),
        title: InkWell(
          onTap: () => Get.back(),
          child: const Center(
            child: Text(
              'Shopping Cart',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.redAccent,
              ),
              onPressed: () {}),
        ],
      ),
      body: const CartProducts(),

      // The Button Navigation Bar to Check Out the orders
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  title: Text('Total:'),
                  subtitle: Text('\$320'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Check Out ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
