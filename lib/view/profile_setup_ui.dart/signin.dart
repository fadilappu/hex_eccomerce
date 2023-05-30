// import 'package:flutter/material.dart';
// import '../../model/firebase.dart';

// class ButtonPage extends StatelessWidget {
//   const ButtonPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//         body: Column(
//       children: [
//         const Center(
//           child: TextField(
//               decoration: InputDecoration(
//                   hintText: 'username', border: OutlineInputBorder())),
//         ),
//         const TextField(
//             decoration: InputDecoration(
//                 hintText: 'Password', border: OutlineInputBorder())),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('Login'),
//         ),
//         const Text("newuser?"),
//         ElevatedButton(
//             onPressed: () {
//               signup(context);
//             },
//             child: const Text('SignUP')),
//       ],
//     )

//         //  ElevatedButton(onPressed: (){

//         // }, child: Text("")),
//         );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hex_ecommerce/model/firebase.dart';
import 'package:hex_ecommerce/view/home_page_ui/home_page_ui.dart';
import 'package:hex_ecommerce/view/profile_setup_ui.dart/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 211, 230, 246),
            Color.fromARGB(255, 58, 122, 146)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.1,
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    child: Container(
                      padding: EdgeInsets.all(35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 100),
                              Text(
                                "Welcome back, Hexa",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Welcome back! Please enter your details.",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextField(
                              decoration: InputDecoration(hintText: 'Email')),
                          TextField(
                              decoration:
                                  InputDecoration(hintText: 'Password')),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot password',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration
                                      .underline, // Add an underline below the text
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(250,
                                    38)), // Set the desired size of the button
                                backgroundColor: MaterialStateProperty.all(Colors
                                    .black), // Set the button color to black
                              ),
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            color: Colors.white,
                            // elevation: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Image.asset(
                                //   'assets/google.jpeg', // Replace with your asset image path
                                //   height: 50,
                                //   width: 50,
                                // ),

                                SizedBox(
                                  width: 20,
                                ),
                                Text("Sign In with Google")
                              ],
                            ),
     onPressed: () async {
      signup(context);
  Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => Homepage()),
      );
},



                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: 11),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUp(),));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    // Add an underline below the text
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 1.1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 26, 59, 84),
                          Colors.blue.shade500
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  //  SizedBox(width: 30,)
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
