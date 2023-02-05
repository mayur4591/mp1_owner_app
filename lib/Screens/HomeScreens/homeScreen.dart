import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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

  List<Product> productList = [];
  late Query _ref;
  bool isListEmpty=false;

  Future check() async
  {
        _ref.once().then((value) => {
          if(value.snapshot.value==null)
            {
              setState((){
                isListEmpty=true;
              })
            }
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref=FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/product_list');
    check();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
        drawer: const USerDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
          title: const Text('My Products',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
        ),
        body: isListEmpty==false?buildHome():
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('No data present ',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500),)),
            SizedBox(height: 10,),
            Center(child: Text('Published product will appear here ',style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),)),

          ],
        )
    );
  }


  Widget _buildListView(Map product) {
    print(product.values);
    print(product.length);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(
                    product['image_url'],
                    product['product_price'],
                    product['product_name'],
                    product['product_details'],
                    product['product_materials'],
                    product['glb_file_url']
                                    )));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          child: boxes(
              name: product['product_name'],
              price: product['product_price'],
              image: product['image_url'],
          )),
    );
  }

  Widget buildHome() {
    return FirebaseAnimatedList(
        query: _ref,
        itemBuilder: (BuildContext cotext, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map<dynamic, dynamic>? owners = snapshot.value as Map?;
          return _buildListView(owners!);
        });
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
      });

  final String name;
  final String price;
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
              image: NetworkImage(
                image,
              ),
              // height: 120.0,
              width: 120.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  name,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white,
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
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Icon(
                //       Icons.star,
                //       color: ratings >= 1 ? Colors.yellow : Colors.white,
                //       size: 15,
                //     ),
                //     Icon(
                //       Icons.star,
                //       color: ratings >= 2 ? Colors.yellow : Colors.white,
                //       size: 15,
                //     ),
                //     Icon(
                //       Icons.star,
                //       color: ratings >= 3 ? Colors.yellow : Colors.white,
                //       size: 15,
                //     ),
                //     Icon(
                //       Icons.star,
                //       color: ratings >= 4 ? Colors.yellow : Colors.white,
                //       size: 15,
                //     ),
                //     Icon(
                //       Icons.star,
                //       color: ratings >= 5 ? Colors.yellow : Colors.white,
                //       size: 15,
                //     )
                //   ],
                // )
              ],
            ),
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
