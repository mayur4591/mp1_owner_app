import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Models/category.dart';
import '../../Models/productmodel.dart';
import '../Owner/navigation_drawer.dart';
import '../ProductView/productdetail.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

List<Category> category = [];

class _HomeScrenState extends State<HomeScren> {
  Product p1 = Product("assets/images/chair.jpg", "White Chair", "450", 3);
  Product p2 = Product("assets/images/cubured.jpg", "Cupboard", "14,450", 4);
  Product p3 = Product("assets/images/kingchair.jpg", "King Chair", "1450", 5);
  Product p4 = Product("assets/images/sofa.jpg", "Red sofa set", "20,550", 4);
  Product p5 =
      Product("assets/images/sofachair.jpg", "Ocen blue sofa", "3450", 5);
  Product p6 =
      Product("assets/images/swingchair.jpg", "Swing chair", "2450", 3);
  Product p7 = Product("assets/images/table.jpg", "Wooden Table", "7450", 5);
  Product p8 = Product("assets/images/workdesk.jpg", "Working desk", "9450", 4);

  Category c1 = Category("Tables", "assets/images/tablecategorie.jpg");
  Category c2 = Category("Couches", "assets/images/couchcategory.jpg");
  Category c3 = Category("Sofas", "assets/images/sofacategory.jpg");
  Category c4 = Category("Cupboards", "assets/images/cupboardcategory.jpg");
  Category c5 = Category("Chairs", "assets/images/chaircategory.jpg");
  Category c6 = Category("Benches", "assets/images/benchcategory.jpg");

  List<Product> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    category.add(c1);
    category.add(c2);
    category.add(c3);
    category.add(c4);
    category.add(c5);
    category.add(c6);
    productList.add(p1);
    productList.add(p2);
    productList.add(p3);
    productList.add(p4);
    productList.add(p5);
    productList.add(p6);
    productList.add(p7);
    productList.add(p8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
      drawer: const USerDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
        title: const Text(
          'Published Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      productList[index].image,
                                      productList[index ].price,
                                      productList[index].ratings,
                                      productList[index].product_name)));
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: boxes(
                                name: productList[index].product_name,
                                price: productList[index ].price,
                                image: productList[index ].image,
                                ratings: productList[index].ratings)),
                      );
          }),
    );
  }
}

class DivederWidget extends StatelessWidget {
  const DivederWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: const Divider(
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'Featured Products',
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: const Divider(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: (MediaQuery.of(context).size.height * (3.7)) / 27,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return circulars(
              decor: category[index].name, image: category[index].image);
        },
      ),
    );
  }
}

class boxes extends StatelessWidget {
  boxes(
      {required this.name,
      required this.price,
      required this.image,
      required this.ratings});

  final String name;
  final String price;
  final int ratings;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 15.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                image,
              ),
              // height: 120.0,
              width: 120.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Rs." + price + "/-",
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: ratings >= 1 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: ratings >= 2 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: ratings >= 3 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: ratings >= 4 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: ratings >= 5 ? Colors.yellow : Colors.white,
                    size: 15,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}

class circulars extends StatelessWidget {
  circulars({required this.decor, required this.image});

  final String decor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            decor,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
