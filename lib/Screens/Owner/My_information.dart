import 'package:flutter/material.dart';

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 53, 57, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 53, 57, 1),
        title: Text('My Information'),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.withOpacity(0.3)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  const [
                    SizedBox(height: 10,),
                    Center(
                      child: Text('Personal Information',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                    SizedBox(height: 15,),
                    Text('First name:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 8,),

                    Text('Mayur',style: TextStyle(color: Colors.white,fontSize: 15),),
                    SizedBox(height: 15,),

                    Text('Last name:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 8,),

                    Text('Kamble',style: TextStyle(color: Colors.white,fontSize: 15),),
                    SizedBox(height: 15,),

                    Text('Shop name:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 8,),

                    Text('Infinity furniture',style: TextStyle(color: Colors.white,fontSize: 15)),
                    // SizedBox(height: 15,),
                    //
                    // Text('Address:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    // SizedBox(height: 8,),
                    // Text('Rui,Maharashtra,India',style: TextStyle(color: Colors.white,fontSize: 15)),



                  ],
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.withOpacity(0.3)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  const [
                    SizedBox(height: 10,),
                    Center(
                      child: Text('Contact Information',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                    SizedBox(height: 15,),
                    Text('Phone No:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 8,),

                    Text('+91 9604221742',style: TextStyle(color: Colors.white,fontSize: 15),),
                    SizedBox(height: 15,),

                    Text('Email:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 8,),

                    Text('mayurkamble847@gmail.com',style: TextStyle(color: Colors.white,fontSize: 15)),
                    SizedBox(height: 15,),

                    Text('Address:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 8,),
                    Text('Rui,Maharashtra,India ',style: TextStyle(color: Colors.white,fontSize: 15)),



                  ],
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, right: 38,top: 38),
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0),
                                side: const BorderSide(
                                    color: Colors.white)))),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    onPressed: () {

                    },
                  )),
            ),


          ],
        ),
      ),
    );
  }
}

// Column(
// children: <Widget>[
// SizedBox(height: 20,),
// Row(
// children: <Widget>[
// Expanded(
// child: Container(
// margin: EdgeInsets.only(left: 10.0, right: 20.0),
// child: Divider(
// color: Colors.white,
// ),),
//
// ),
// Text(
// 'Personal Information',
// style: TextStyle(
// color: Colors.white
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.only(left: 20.0, right: 10.0),
// child: Divider(
// color: Colors.white,
// ),),
//
//
// ),
//
//
// ],
// ),
// SizedBox(height: 15.0,),
//
// Row (
// children: <Widget>[
// SizedBox(width: 10.0,),
// Text('Name :',style: TextStyle(color: Colors.white60,
// fontSize: 22.0, fontWeight: FontWeight.w400),),
// Text('    Megha Jivanagi',style: TextStyle(color: Colors.white,
// fontSize: 18.0),)
// ],
// ),
// SizedBox(height: 15.0,),
//
// Row (
// children: <Widget>[
// SizedBox(width: 10.0,),
// Text('Mobile No.:',style: TextStyle(color: Colors.white60,
// fontSize: 22.0, fontWeight: FontWeight.w400),),
// Text('   9665675851',style: TextStyle(color: Colors.white,
// fontSize: 18.0),)
// ],
// ),
// SizedBox(height: 15.0,),
//
// Row (
// children: <Widget>[
// SizedBox(width: 10.0,),
// Text('Address:',style: TextStyle(color: Colors.white60,
// fontSize: 22.0, fontWeight: FontWeight.w400),),
// Text('   Pune',style: TextStyle(color: Colors.white,
// fontSize: 18.0),)
// ],
// ),
// SizedBox(height: 15.0,),
//
// Row (
// children: <Widget>[
// SizedBox(width: 10.0,),
// Text('Email Id:',style: TextStyle(color: Colors.white60,
// fontSize: 22.0, fontWeight: FontWeight.w400),),
// Text('   megha@gmail.com',style: TextStyle(color: Colors.white,
// fontSize: 18.0),)
// ],
// ),
// SizedBox(height: 15.0,),
//
// Row (
// children: <Widget>[
// SizedBox(width: 10.0,),
// Text('Country:',style: TextStyle(color: Colors.white60,
// fontSize: 22.0, fontWeight: FontWeight.w400),),
// Text('   India',style: TextStyle(color: Colors.white,
// fontSize: 18.0),)
// ],
// ),
// SizedBox(height: 20,),
// Row(
// children: <Widget>[
// Expanded(
// child: Container(
// margin: EdgeInsets.only(left: 10.0, right: 20.0),
// child: Divider(
// color: Colors.white,
// ),),
//
//
// ),
// Text(
// 'Shop Details',
// style: TextStyle(
// color: Colors.white
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.only(left: 20.0, right: 10.0),
// child: Divider(
// color: Colors.white,
// ),),
//
//
// ),
//
//
// ],
// ),
// SizedBox(height: 15.0,),
//
// Row (
// children: <Widget>[
// SizedBox(width: 10.0,),
// Text('Shop Name:',style: TextStyle(color: Colors.white60,
// fontSize: 22.0,fontWeight: FontWeight.w400 ),),
// Text('   vijay sales',style: TextStyle(color: Colors.white,
// fontSize: 18.0),)
// ],
// ),
// SizedBox(height: 15.0,),
//
// Row (
// children: <Widget>[
// SizedBox(width: 10.0,),
// Text('Address:',style: TextStyle(color: Colors.white60,
// fontSize: 22.0,fontWeight: FontWeight.w400),),
// Text('   pune',style: TextStyle(color: Colors.white,
// fontSize: 18.0),)
// ],
// ),
//
// SizedBox(height: 20.0,),
// Center(child: Container(
// child: GestureDetector(
// child: Text('Edit Profile', style: TextStyle(
// fontWeight: FontWeight.w900,
// color: Colors.white
// ),),
// // color: Colors.black,
// onTap: (){},
// ),
// ))
//
// ],
// )
