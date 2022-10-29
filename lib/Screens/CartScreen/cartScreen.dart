import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owner_app/Screens/CartScreen/orderDetails.dart';

import '../../Models/productmodel.dart';

class OrderRequests extends StatefulWidget {
  const OrderRequests({Key? key}) : super(key: key);

  @override
  State<OrderRequests> createState() => _OrderRequestsState();
}

List<Product> productList = [];
int wishListCount = 0;

class _OrderRequestsState extends State<OrderRequests> {

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
    _ref=FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/order_request');
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      appBar: AppBar(
        title: const Text('Order Request'),
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      ),
      body: isListEmpty==false? buildHome():Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(child: Text('No request yet ',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500),)),
          SizedBox(height: 10,),
          Center(child: Text('Order requests will appear here ',style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),)),

        ],
      )
    );
  }

  Widget _buildListView(Map product) {
    print(product.values);
    print(product.length);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ProductDetails(
        //             product['image_url'],
        //             product['product_price'],
        //             product['product_name'],
        //             product['product_details'],
        //             product['product_materials']
        //         )));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          child: boxes(
            product: product,
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

class boxes extends StatefulWidget {
  boxes(
      {
        required this.product,
        // required this.price,
        // required this.image,
      });

  final Map product;

  @override
  State<boxes> createState() => _boxesState();
}

class _boxesState extends State<boxes> {
  // final String price;
  String name="";
  String price="";
  String image="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductDetails(widget.product['product_id']);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:  const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: image!=''? Row(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Rs." + widget.product['total'].toString() + "/-",
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          Text('Qty- ${widget.product['quantity'].toString()}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),

                        ],
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
            ):Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          const Text('Order From',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          const Text('Name',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),),
          Text(widget.product['customer_name'],style: const TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),),
          const SizedBox(height: 5,),
          const Text('Address',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),),
          Text(widget.product['address'],style: const TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),),
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetails(widget.product)));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('All Details',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500)),
                    SizedBox(width: 5,),
                    Icon(Icons.chevron_right_outlined,color: Colors.white,)
                  ],
                ) ,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future getProductDetails(String id) async {
    await FirebaseDatabase.instance.reference().child('posts/$id').once().then((value) => {
      if(value.snapshot.value!=null)
        {
          setState((){
            Map<dynamic,dynamic> map=value.snapshot.value as Map;
            name=map['product_name'];
            price=map['total'].toString();
            image=map['image_url'];
          })
        }
    });
  }
}

// class _boxesState extends State<boxes> {
//   _boxesState(
//       {required this.name,
//       required this.price,
//       required this.image,
//       required this.ratings,
//       required this.index});
//   final String name;
//   final String price;
//   final int ratings;
//   final String image;
//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(8),
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(5))),
//         child: ListTile(
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image(
//               fit: BoxFit.cover,
//               image: AssetImage(
//                 widget.image,
//               ),
//               // height: 120.0,
//               width: 120.0,
//             ),
//           ),
//           trailing: IconButton(
//               onPressed: () {
//                 productList.removeAt(index);
//                 productList.removeAt(index);
//                 setState(() {});
//                 print(widget.index);
//               },
//               icon: const Icon(
//                 Icons.cancel,
//                 color: Colors.grey,
//                 size: 25,
//               )),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               const SizedBox(
//                 height: 20.0,
//               ),
//               FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(
//                   widget.name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 25,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 "Rs." + widget.price + "/-",
//                 style: const TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Icon(
//                     Icons.star,
//                     color: widget.ratings >= 1 ? Colors.yellow : Colors.white,
//                     size: 15,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: widget.ratings >= 2 ? Colors.yellow : Colors.white,
//                     size: 15,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: widget.ratings >= 3 ? Colors.yellow : Colors.white,
//                     size: 15,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: widget.ratings >= 4 ? Colors.yellow : Colors.white,
//                     size: 15,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: widget.ratings >= 5 ? Colors.yellow : Colors.white,
//                     size: 15,
//                   )
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
