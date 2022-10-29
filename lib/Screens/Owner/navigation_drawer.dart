import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CartScreen/cartScreen.dart';
import 'OwnerProfile.dart';

class USerDrawer extends StatefulWidget {
  const USerDrawer({Key? key}) : super(key: key);

  @override
  State<USerDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<USerDrawer> {
  String fname="";
  String lname="";
  String email="";
  Future<void> getInfo() async {
    FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}').once().then((value) => {
      setState((){
        Map<dynamic,dynamic> map=value.snapshot.value as Map;
        fname=map['first_name'];
        lname=map['last_name'];
        email=map['email'];
      }),

      print(fname)
    });
  }
  int orderRequest=0;
  Future requestCount() async
  {
      FirebaseDatabase.instance.reference().child('Users/owners/${FirebaseAuth.instance.currentUser!.uid}/order_request').once().then((value) => {
        if(value.snapshot.value!=null)
          {
            setState((){
              orderRequest=value.snapshot.children.length;
            })
          }
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
    requestCount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: const Color.fromRGBO(44, 53, 57, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    '$fname $lname',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle:  Text(
                    email,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const OwnerProfile()));
            },
            child: const ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.person,
                color: Colors.blueGrey,
                size: 18,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.blueGrey,
                size: 15,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OrderRequests()));
            },
            child: ListTile(
                title: const Text(
                  'Order Requests',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: const Icon(
                  Icons.people_alt_outlined,
                  color: Colors.blueGrey,
                  size: 18,
                ),
                trailing: Badge(
                  badgeContent: Text(orderRequest.toString()),
                  badgeColor: Colors.blueGrey.withOpacity(0.7),
                )),
          )
        ],
      ),
    );
  }
}
