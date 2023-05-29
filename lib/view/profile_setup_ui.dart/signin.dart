import 'package:flutter/material.dart';
import '../../model/firebase.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
        body: Column(
      children: [
        const Center(
          child: TextField(
              decoration: InputDecoration(
                  hintText: 'username', border: OutlineInputBorder())),
        ),
        const TextField(
            decoration: InputDecoration(
                hintText: 'Password', border: OutlineInputBorder())),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Login'),
        ),
        const Text("newuser?"),
        ElevatedButton(
            onPressed: () {
              signup(context);
            },
            child: const Text('SignUP')),
      ],
    )

        //  ElevatedButton(onPressed: (){

        // }, child: Text("")),
        );
  }
}




// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//   // This widget is the root of your application

// class MyLoginPage extends StatefulWidget {
//   @override
//   _MyLoginPageState createState() => _MyLoginPageState();
// }

// class _MyLoginPageState extends State<MyLoginPage> {
//   final _auth = FirebaseAuth.instance;
//   bool showProgress = false;
//   late String email, password;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Firebase Authentication"),
//       ),
//       body: Center(
//         child: ModalProgressHUD(
//           inAsyncCall: showProgress,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 "Login Page",
//                 style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   email = value; // get value from TextField
//                 },
//                 decoration: InputDecoration(
//                     hintText: "Enter your Email",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(32.0)))),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               TextField(
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   password = value; //get value from textField
//                 },
//                 decoration: InputDecoration(
//                     hintText: "Enter your Password",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(32.0)))),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Material(
//                 elevation: 5,
//                 color: Colors.lightBlue,
//                 borderRadius: BorderRadius.circular(32.0),
//                 child: MaterialButton(
//                   onPressed: () async {
//                     setState(() {
//                       showProgress = true;
//                     });

//                     try {
//                       final newUser = await _auth.signInWithEmailAndPassword(
//                           email: email, password: password);

//                       print(newUser.toString());

//                       if (newUser != null) {
//                         Fluttertoast.showToast(
//                             msg: "Login Successfull",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             timeInSecForIos: 1,
//                             backgroundColor: Colors.blueAccent,
//                             textColor: Colors.white,
//                             fontSize: 16.0);
//                         setState(() {
//                           showProgress = false;
//                         });
//                       }
//                     } catch (e) {}
//                   },
//                   minWidth: 200.0,
//                   height: 45.0,
//                   child: Text(
//                     "Login",
//                     style:
//                         TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
