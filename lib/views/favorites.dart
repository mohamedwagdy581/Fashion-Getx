import 'package:fashion/views/all_products.dart';
import 'package:fashion/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/favorites.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: InkWell(
          onTap: () => Get.back(),
          child: const Center(
            child: Text(
              'All Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: CustomTextfield(
                  'Search you need',
                  Icons.search,
                ),
              ),

              // ================== custom sort button ====================
              customSortButton(
                () {
                  _bottomSortSheet(context);
                },
                Icons.import_export,
              ),

              // ================== custom Filter button =============
              Padding(
                padding: const EdgeInsets.all(10),
                child: customSortButton(
                  () {
                    _bottomFilterSheetMore(context);
                  },
                  Icons.filter_list,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '200 Products Found',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }

  // Custom Button of Sort and filter
  Widget customSortButton(VoidCallback onPress, IconData icon) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 1,
        primary: Colors.white,
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Icon(
        icon,
      ),
    );
  }
}

// Custom TextFormField used to filter products by Higher and Lower price
Widget customFilterTextField(String hint) {
  return Expanded(
    child: TextFormField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white70,
          ),
        ),
      ),
    ),
  );
}

// Bottom Filter Sheet to show more filter option
void _bottomFilterSheetMore(context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Wrap(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 120),
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //  **************** Price Range Text *******************

                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Price Range',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // **************  Lower and Higher Price TextField **************

                  Row(
                    children: <Widget>[
                      customFilterTextField('Lower Price'),
                      customFilterTextField('Higher Price'),
                    ],
                  ),

                  // ******************  Size Text and Type  *******************

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 105),
                          child: DropdownButtonWidget(),
                        ),
                      ],
                    ),
                  ),

                  // ****************  Categories Colors  ******************

                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: const <Widget>[
                      ColoredButtons(Colors.black),
                      ColoredButtons(Colors.blue),
                      ColoredButtons(Colors.grey),
                      ColoredButtons(Colors.red),
                      ColoredButtons(Colors.pink),
                    ],
                  ),

                  // ****************  Categories Text  ******************

                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // *****************  Categories Types  ******************

                  Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          OutlineButtonWidget('All'),
                          OutlineButtonWidget('Men'),
                          OutlineButtonWidget('Women'),
                        ],
                      ),
                      Row(
                        children: const <Widget>[
                          OutlineButtonWidget('Boys'),
                          OutlineButtonWidget('Girls'),
                        ],
                      ),
                    ],
                  ),

                  //  ***************  Done Button  *********************
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Done > ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}

//  *********************   DropDown Button Choose Type  ***********************

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = 'S';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      items: <String>['S', 'M', 'L', 'XL', 'XXL']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// **********************  OutlineButton  ****************

class OutlineButtonWidget extends StatelessWidget {
  final String hintText;
  const OutlineButtonWidget(this.hintText, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.red,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          hintText,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

//  ****************  Colored Button  *********************

class ColoredButtons extends StatelessWidget {
  final Color color;
  const ColoredButtons(this.color, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color,
      ),
      child: const Text(''),
    );
  }
}

// ******************************   Sort Button  *******************************

void _bottomSortSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                top: 5.0,
                bottom: 5.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Wrap(
                children: const <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Sort',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // ************** Radio ListTile Widget *****************

                  RadioWidget(),
                ],
              ),
            ),
          ],
        );
      });
}

enum FavoriteMethod { Pop, LTH, HTL, NL, D }

class RadioWidget extends StatefulWidget {
  const RadioWidget({Key? key}) : super(key: key);

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  FavoriteMethod _method = FavoriteMethod.Pop;

  Widget customListTile(String title, FavoriteMethod value) {
    return ListTile(
      title: Text(title),
      leading: Radio<FavoriteMethod>(
        value: value,
        groupValue: _method,
        onChanged: (value) {
          setState(() {
            _method = value!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        customListTile('Popularity', FavoriteMethod.Pop),
        customListTile('Lowest Price to Highest Price', FavoriteMethod.LTH),
        customListTile('Highest Price to Lowest Price', FavoriteMethod.HTL),
        customListTile('Newly Listed', FavoriteMethod.NL),
        customListTile('Discount', FavoriteMethod.D),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('SUBMIT'),
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white, primary: Colors.red),
        ),
      ],
    );
  }
}
