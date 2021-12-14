import 'package:fashion/views/favorites.dart';
import 'package:fashion/views/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/categories/kids_categories.dart';
import '../widgets/categories/luxury_categories.dart';
import '../widgets/categories/men_categories.dart';
import '../widgets/categories/women_categories.dart';
import 'home_page.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = const [
      Tab(
        child: Text(
          'Man',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      Tab(
        child: Text(
          'Woman',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      Tab(
        child: Text(
          'Kids',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      Tab(
        child: Text(
          'Luxury',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.home),
          onPressed: () => Get.to(() => const HomePage()),
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
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.blueGrey,
                ),
                onPressed: () {},
              ),
              IconButton(
                  icon: const Icon(Icons.shop, color: Colors.deepPurpleAccent),
                  onPressed: () => Get.to(() => const ShopPage())),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.blueAccent),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () => Get.to(
                  () => const FavoritePage(),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.1,
          iconTheme: const IconThemeData(color: Colors.black),
          title: InkWell(
            onTap: () => Get.to(() => const HomePage()),
            child: const Center(
              child: Text(
                ''
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: const TabBarView(
          children: [
            MenProducts(),
            WomenProducts(),
            KidsCategories(),
            LuxuryCategories(),
          ],
        ),
      ),
    );
  }
}
