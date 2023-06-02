import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hex_ecommerce/view/profile_setup_ui.dart/signin.dart';
import 'package:hex_ecommerce/view/profile_setup_ui.dart/signup.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> signup(BuildContext context) async {
//   final GoogleSignIn googleSignIn = GoogleSignIn(clientId: '851113092741-teda4mt4v3e326t38bqge12vd14i5o1q.apps.googleusercontent.com');
//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   if (googleSignInAccount != null) {
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;                                             
//     final AuthCredential authCredential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);

//     // Getting users credential
//     UserCredential result = await auth.signInWithCredential(authCredential);
//     //   bool success = true;
//     // if(success)
//     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage(),));
    
//     // ignore: unnecessary_null_comparison
//     if (result != null) {
//     }
//   }
// }


final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  Future<void> storeData(BuildContext context) async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (name.isEmpty || password.isEmpty || email.isEmpty) {
      // Don't store if either username or password is empty
      return;
    }

    await usersCollection.add({
      'name': name,
      'email':email,
      'password': password,
    });
// ignore: use_build_context_synchronously
Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  LoginPage(),));

  }

Future<void> retrieveData(BuildContext context) async {
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  QuerySnapshot querySnapshot = await usersCollection.get();

  List<QueryDocumentSnapshot> documents = querySnapshot.docs;
  if (documents.isNotEmpty) {
    // Assuming only one document is stored for simplicity
    DocumentSnapshot document = documents.first;

    Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

    if (data != null) {
      String? name = data['name'] as String?;
      String? email = data['email'] as String?;
      String? password = data['password'] as String?;

      // Use the retrieved data as needed
      if (name != null) {
        nameController.text = name;
      }
      if (email != null) {
        emailController.text = email;
      }
      if (password != null) {
        passwordController.text = password;
      }
    }
  }
}


class firebasegoogleauth {
  final _googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
  }
}