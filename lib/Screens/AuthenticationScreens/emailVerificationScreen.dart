import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owner_app/Screens/AuthenticationScreens/signUpScreen.dart';

import '../../Models/newUser.dart';
import '../HomeScreens/homeScreen.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);
  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;
  Timer? timer;
  // ignore: deprecated_member_use
  final DatabaseReference dataBRef = FirebaseDatabase.instance.reference();
  late FirebaseAuth auth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
    isEmailVerified == FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer!.cancel();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e'),behavior: SnackBarBehavior.floating));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? returnWidget(): Scaffold(
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Verify email',
        ),
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.mark_email_read_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sent',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    'Check  your mail inbox/spam folder and click on link  to verify your email..',
                    style: TextStyle(color: Colors.grey, fontSize: 13))),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5)),
              child: MaterialButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser!;
                  await user.sendEmailVerification().then((value) => {});
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Resend email',
                        style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ));

 Widget returnWidget() {
    insertDate(newuser);
    return const HomeScren();
  }

 Future insertDate(NewUser data) async {
    dataBRef
        .child('Users')
        .child('all_users')
        .child(auth.currentUser!.uid)
        .set({
      'first_name': data.first_name,
      'last_name': data.last_name,
      'email': data.email,
      'role': data.role
    }).onError((error, stackTrace) {
      print(error);
    }).then((value) => {
      dataBRef.child('Users/owners/${auth.currentUser!.uid}').set({
        'first_name': data.first_name,
        'last_name': data.last_name,
        'email': data.email,
        'role': data.role
      })
    });
  }
}
