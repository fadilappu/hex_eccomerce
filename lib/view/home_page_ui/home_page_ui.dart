import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hex_ecommerce/view/profile_setup_ui.dart/profile_section_ui.dart';
import '../cart_ui/cart_ui.dart';
import '../profile_setup_ui.dart/signin.dart';
import 'drawer_ui.dart';
import 'home_product_view_ui.dart';

String searchbarvalue = "";
bool isLoggedIn = false; // Add a boolean variable to track login status

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLoginStatus(); // Check the login status when the widget is initialized
    searchController.addListener(() {
      setState(() {
        searchbarvalue = searchController.text;
      });
    });
  }

  void checkLoginStatus() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Container(
          height: 45,
          width: 300,
          child: TextField(
            controller: searchController,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => searchController.clear(),
              ),
              hintStyle: const TextStyle(color: Colors.black),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        actions: [
     IconButton(
  icon: const Icon(Icons.shopping_cart),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const CartPage(),
      ),
    );
  },
),
  // ElevatedButton(
  //   onPressed: () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => LoginPage(),
  //       ),
  //     );
  //     // .then((result) {
  //     //   if (result == true) {
  //     //     Navigator.push(
  //     //       context,
  //     //       MaterialPageRoute(
  //     //         builder: (BuildContext context) => UserProfilePage(),
  //     //       ),
  //     //     );
  //     //   }
  //     // }
    
  //   },
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: Colors.transparent,
  //   ),
  //   child: Text('Sign In/Sign Up'),
  // ),
isLoggedIn == true?
  IconButton(
    icon: const Icon(Icons.person),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => UserProfilePage(),
        ),
      );
    },
  ):ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
    ),
    child: Text('Sign In/Sign Up'),
  ),
  ],
      ),
      drawer: HomepageDrawer(),
      body: SafeArea(
        child: HomeProductView(searchQuery: searchbarvalue),
      ),
    );
  }
}