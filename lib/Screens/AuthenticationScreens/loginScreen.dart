import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owner_app/Screens/AuthenticationScreens/forgetPassword.dart';
import 'package:owner_app/Screens/AuthenticationScreens/signUpScreen.dart';

import '../HomeScreens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                const SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Sign in ",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white.withOpacity(0.6),
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: 'Password',
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
                TextButton(
                  onPressed: () {
                    //forgot password screen
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> const ForgetPassword()));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
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
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          print(emailController.text);
                          print(passwordController.text);
                           doSignInUser(emailController.text,passwordController.text);
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomeScren()));
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
                      'Does not have account?',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 15, decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                    )
                  ],
                ),

              ],
            ),
          )),
    );
  }
  String role="";
  Future  doSignInUser(String email, String password) async {
   await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
       FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}').once().then((value)  {
         if(value.snapshot.value!=null)
           {
             Map<dynamic,dynamic> map=value.snapshot.value as Map;
             setState((){
               role=map['role'];
             });
           }

         if(role=="owner")
         {
           Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => const HomeScren()));
         }
         else
         {
           Flushbar(
             title:  "Sign in failed",
             titleColor: Colors.black,
             backgroundColor: Colors.white,
             message:  "You do not have permission for this application",
             messageColor: Colors.black,
             duration:  Duration(seconds: 3),
           ).show(context);

         }
       }), })
       .onError((error, stackTrace) => {
        showError(error)

   });
  }

  showError(Object? error) {
    Flushbar(
      title:  "Sign in failed",
      titleColor: Colors.black,
      backgroundColor: Colors.white,
      message:  error.toString(),
      messageColor: Colors.black,
      duration:  Duration(seconds: 3),
    ).show(context);
  }
}
