// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../cart_ui/cart_ui.dart';
import '../profile_setup_ui.dart/signin.dart';
import 'drawer_ui.dart';
import 'home_product_view_ui.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

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
          title: SizedBox(
            height: 45,
            width: 300,
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black38,
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const CartPage()));
              },
            ),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((BuildContext context) => const ButtonPage())));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: const Text('SignIn/Signup'),
            )
          ],
        ),
        drawer: HomepageDrawer(),
        body: SafeArea(
          child:HomeProductView(),

        ));
  }
}
