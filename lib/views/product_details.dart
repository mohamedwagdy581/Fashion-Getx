import 'package:fashion/views/all_products.dart';
import 'package:fashion/views/favorites.dart';
import 'package:fashion/views/home_page.dart';
import 'package:fashion/widgets/carousel_slider_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetails extends StatefulWidget {
  final dynamic productDetailsNamed;
  final dynamic productDetailsPicture;
  final dynamic productDetailsPrice;
  final dynamic productDetailsOldPrice;
  final dynamic productDetailsBrand;
  const ProductsDetails(
      this.productDetailsNamed,
      this.productDetailsPicture,
      this.productDetailsPrice,
      this.productDetailsOldPrice,
      this.productDetailsBrand,
      {Key? key})
      : super(key: key);
  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  var i = 1;

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
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: InkWell(
          onTap: () => Get.back(),
          child: const Center(
            child: Text(
              'Fashion',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),

      // **************************    Body    ************************

      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 300,
            child: CarouselSliderImages(
                imageLocation: widget.productDetailsPicture),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${widget.productDetailsNamed}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '4.2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('${widget.productDetailsNamed} Details'),
            subtitle: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Item Size',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const <Widget>[
                SizeType('S'),
                SizeType('M'),
                SizeType('L'),
                SizeType('XL'),
                SizeType('XXL'),
              ],
            ),
          ),
          /* Row(
            children: const <Widget>[
              SizeType('XL'),
              SizeType('XXL'),
            ],
          ),*/
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Colors',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const <Widget>[
                ColoredButtons(Colors.brown),
                ColoredButtons(Colors.purple),
                ColoredButtons(Colors.yellow),
                ColoredButtons(Colors.green),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      const Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),

                      // Add Button that decrease the Quantity as we wish
                      customAddAndMinusButton(
                        () {
                          setState(() {
                            if (i > 0) {
                              i--;
                            }
                          });
                        },
                        Icons.remove,
                      ),

                      // The Quantity that changes by buttons to add to the cart
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('$i'),
                      ),

                      // Add Button that increase the Quantity as we wish
                      customAddAndMinusButton(
                        () {
                          setState(() {
                            i++;
                          });
                        },
                        Icons.add,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '\$${widget.productDetailsPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {},
              color: Colors.red,
              textColor: Colors.white,
              elevation: 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.add_shopping_cart),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget customAddAndMinusButton(VoidCallback onPress, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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

class SizeType extends StatelessWidget {
  final String sizeType;
  const SizeType(this.sizeType, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        sizeType,
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class ColoredButtons extends StatelessWidget {
  final Color color;
  const ColoredButtons(this.color, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          shape: const CircleBorder(), backgroundColor: color),
      child: const Text(''),
    );
  }
}
