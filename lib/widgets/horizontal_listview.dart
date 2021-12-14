import 'package:flutter/material.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Category('assets/images/cats/dress.png', 'Dress'),
          Category('assets/images/cats/formal.png', 'Formal'),
          Category('assets/images/cats/informal.png', 'Informal'),
          Category('assets/images/cats/shoe.png', 'shoes'),
          Category('assets/images/cats/accessories.png', 'Accessories'),
          Category('assets/images/cats/jeans.png', 'Jeans'),
          Category('assets/images/cats/tshirt.png', 'T-Shirt'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  const Category(this.imageLocation, this.imageCaption, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 80.0,
            child: ListTile(
              title: Image.asset(
                imageLocation,
                width: 40.0,
                height: 40.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageCaption,
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
