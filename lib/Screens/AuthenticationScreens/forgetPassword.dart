import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.4),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey.withOpacity(0.5),
        title: Text(
          'Reset Passwoerd',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(height: 50,),
              Icon(
                Icons.attach_email_outlined,
                color: Colors.grey,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Center(
                      child: Text(
                        'A link will be sent on given email from there you can reset your password.',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Give email...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.mail_outline_sharp,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
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
                  onPressed: () async {
                    if (emailController.text == '') {
                      Flushbar(
                        message: 'Give email...',
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                      ).show(context);
                    } else {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text)
                          .then((value) {
                        Flushbar(
                          message: 'email sent check your inbox...',
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 3),
                        ).show(context);
                      }).onError((error, stackTrace) {
                        Flushbar(
                          message: '$error',
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ).show(context);
                      });
                    }
                    emailController.text = '';
                  },
                  child: Container(
                    width: 120,
                    child: Center(
                      child: Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}