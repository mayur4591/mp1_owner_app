import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/productmodel.dart';

class OrderRequests extends StatefulWidget {
  const OrderRequests({Key? key}) : super(key: key);

  @override
  State<OrderRequests> createState() => _OrderRequestsState();
}

List<Product> productList = [];
int wishListCount = 0;

class _OrderRequestsState extends State<OrderRequests> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      appBar: AppBar(
        title: const Text('Order Request'),
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      ),
      body: productList.length != 0
          ? ListView.builder(
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 10, right: 10),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              productList[index].image,
                            ),
                            // height: 120.0,
                            width: 120.0,
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              productList.removeAt(index);
                              wishListCount = productList.length;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.grey,
                              size: 25,
                            )),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 20.0,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                productList[index].product_name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Rs." + productList[index].price + "/-",
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
                                  color: productList[index].ratings >= 1
                                      ? Colors.yellow
                                      : Colors.white,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: productList[index].ratings >= 2
                                      ? Colors.yellow
                                      : Colors.white,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: productList[index].ratings >= 3
                                      ? Colors.yellow
                                      : Colors.white,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: productList[index].ratings >= 4
                                      ? Colors.yellow
                                      : Colors.white,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: productList[index].ratings >= 5
                                      ? Colors.yellow
                                      : Colors.white,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.list_alt_outlined,
                    color: Colors.grey,
                    size: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No requests yet !...',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
    );
  }
}

class boxes extends StatefulWidget {
  boxes(
      {required this.name,
      required this.price,
      required this.image,
      required this.ratings,
      required this.index});

  final String name;
  final String price;
  final int ratings;
  final String image;
  final int index;

  @override
  // ignore: no_logic_in_create_state
  State<boxes> createState() => _boxesState(
      name: name, price: price, image: image, ratings: ratings, index: index);
}

class _boxesState extends State<boxes> {
  _boxesState(
      {required this.name,
      required this.price,
      required this.image,
      required this.ratings,
      required this.index});
  final String name;
  final String price;
  final int ratings;
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                widget.image,
              ),
              // height: 120.0,
              width: 120.0,
            ),
          ),
          trailing: IconButton(
              onPressed: () {
                productList.removeAt(index);
                productList.removeAt(index);
                setState(() {});
                print(widget.index);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.grey,
                size: 25,
              )),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Rs." + widget.price + "/-",
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
                    color: widget.ratings >= 1 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.ratings >= 2 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.ratings >= 3 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.ratings >= 4 ? Colors.yellow : Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.ratings >= 5 ? Colors.yellow : Colors.white,
                    size: 15,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
