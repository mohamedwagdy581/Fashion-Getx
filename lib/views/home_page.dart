import 'package:fashion/views/all_products.dart';
import 'package:fashion/views/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/horizontal_listview.dart';
import '../widgets/products.dart';
import 'favorites.dart';
import 'shopping_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.home),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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
      ),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () => Get.to(
              () => const ShoppingCart(),
            ),
          ),
        ],
      ),

      // **************************  The Drawer  *******************************
      drawer: Drawer(
        child: ListView(
          children: [
            // The Header of Drawer
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.pink,
              ),
              accountName: const Text('Mohamed Wagdy'),
              accountEmail: const Text('mw41532@gmail.com'),
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // ****************  The Body of Drawer  *****************
            customListTile(
              () => Get.back(),
              'Home Page',
              Icons.home,
              Colors.redAccent,
            ),
            customListTile(
              () {},
              'My Account',
              Icons.person,
              Colors.redAccent,
            ),
            customListTile(
              () => Get.to(() => const AllProductsPage()),
              'My Orders',
              Icons.shopping_basket,
              Colors.redAccent,
            ),
            customListTile(
              () {
                Get.to(() => const ShoppingCart());
              },
              'Shopping Cart',
              Icons.shopping_cart,
              Colors.redAccent,
            ),
            customListTile(
              () => Get.to(() => const FavoritePage()),
              'Favorites',
              Icons.favorite,
              Colors.redAccent,
            ),
            const Divider(),
            customListTile(
              () {},
              'Settings',
              Icons.settings,
              Colors.grey,
            ),
            customListTile(
              () {},
              'About',
              Icons.help,
              Colors.blue,
            ),
          ],
        ),
      ),

      // ************************ The body of Scaffold  ************************
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Fashion Shop',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Get Popular fashion from home',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextfield('Search the clothes you need', Icons.search),
          const SizedBox(
            height: 10,
          ),

          // ****************** Category and See All Row  **********************

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => const AllCategories()),
                child: const Text(
                  'See All',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // ****************  Categories Horizontal ListView  *****************

          const HorizontalListview(),

          // ******************  Popular and See All Row  **********************

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Popular Fashion',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => const AllProductsPage()),
                child: const Text(
                  'See All',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // ************************  Popular Products  ***********************
          const Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }

  // Custom ListTile of the Drawer body
  Widget customListTile(
    VoidCallback onTap,
    String title,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        leading: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
