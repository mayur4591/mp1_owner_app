import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Or',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 20),
                )),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28, top: 10),
                  child: Divider(
                    height: 4,
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide(
                                        color:
                                            Colors.white.withOpacity(0.7))))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: SvgPicture.asset(
                                  'assets/images/googleIcon.svg'),
                            ),
                            const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                            //Text('Sign in',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        onPressed: () {
                          print(emailController.text);
                          print(passwordController.text);
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Fill all the details'),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.white,
                            ));
                          } else {
                            doSignInUser(
                                emailController.text, passwordController.text);
                          }
                        },
                      )),
                ),
              ],
            ),
          )),
    );
  }

  Future  doSignInUser(String email, String password) async {
   await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScren()))
            });
  }
}
