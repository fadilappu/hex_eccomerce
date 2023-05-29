// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// final _auth = FirebaseAuth.instance;

// String email;, password;
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Future<Widget> build(BuildContext context) async {
// try {
//        final newUser = await _auth.createUserWithEmailAndPassword(
//        email: email, password: password);
//        if (newUser != null) {
//            Navigator.push(context,
//                                   MaterialPageRoute(
//                                                      builder: (context) => MyLoginPage()),
//                                                 );
//          }
//  } 
// catch (e) 
// {
//    print(e);
// }
// }}