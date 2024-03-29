import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/newUser.dart';
import 'VerifyUser.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

var newuser;

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController shopNameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController shopAddressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 53, 57, 1),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Sign up ",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: firstnameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'First Name',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                                Colors.white.withOpacity(0.6)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: lastnameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Last Name',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                                Colors.white.withOpacity(0.6)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller:phoneNumberController ,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Phone number',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                            Colors.white.withOpacity(0.6)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: shopNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Shop Name',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                            Colors.white.withOpacity(0.6)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: shopAddressController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Shop address',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                            Colors.white.withOpacity(0.6)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                                Colors.white.withOpacity(0.6)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white.withOpacity(0.6),
                        ), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.white.withOpacity(0.6),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1,
                            color:
                                Colors.white.withOpacity(0.6)), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0, right: 38),
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
                                        color: Colors.blueAccent)))),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          if (firstnameController.text.isEmpty ||
                              lastnameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              confirmPasswordController.text.isEmpty||shopNameController.text.isEmpty || shopAddressController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Fill all the details...',style: TextStyle(color: Colors.black),),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.white,
                            ));
                          } else if (passwordController.text !=
                              confirmPasswordController.text) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Password not matched please check once..',style: TextStyle(color: Colors.black),),
                              behavior: SnackBarBehavior.floating,backgroundColor: Colors.white,
                            ));
                          } else {
                            NewUser user = NewUser(
                                firstnameController.text.toString(),
                                lastnameController.text.toString(),
                                emailController.text.toString(),
                                'owner',shopNameController.text,phoneNumberController.text,shopAddressController.text);
                            newuser = user;
                            registerUser(user);
                          }
                        },
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 15, decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
  showerror(Object? error)
 {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Padding(
     padding: const EdgeInsets.only(bottom: 8.0),
     child: Text(error.toString(),style: const TextStyle(color: Colors.black),),
   ),behavior: SnackBarBehavior.floating,backgroundColor: Colors.white,));

 }
  void registerUser(NewUser user) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email, password: passwordController.text.toString())
        .then((value) => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const VerifyUser()))
            }).onError((error, stackTrace) => {
                showerror(error)
    });
  }

}
