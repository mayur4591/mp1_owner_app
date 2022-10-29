import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:owner_app/Screens/HomeScreens/homeScreen.dart';

class ProductPublished extends StatefulWidget {
  const ProductPublished({Key? key}) : super(key: key);

  @override
  State<ProductPublished> createState() => _ProductPublishedState();
}

class _ProductPublishedState extends State<ProductPublished> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          // SpinKitPumpingHeart(
          //   color: Colors.blueGrey,
          //   size: 40,
          // ),
          Icon(Icons.rocket_launch_rounded,color: Colors.blueGrey,size: 50,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Congratulations!',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w500,fontSize: 25),),
            ],
          ),
          SizedBox(height: 10,),
          Text('Your have successfully published your product.',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w500,fontSize: 18),),
          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.all(10),
            // margin: EdgeInsets.only(left: 40,right: 40),
            // height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScren()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('My products',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_right_outlined,color: Colors.white,)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
