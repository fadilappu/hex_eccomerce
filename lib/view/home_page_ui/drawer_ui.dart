import 'package:flutter/material.dart';
import 'home_page_ui.dart';

class HomepageDrawer extends StatelessWidget {
  const HomepageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.deepPurple,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((BuildContext context) => const Homepage())));
              // Handle menu item click
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.deepPurple,
            ),
            title: const Text('Settings'),
            onTap: () {
              // Handle menu item click
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.deepPurple,
            ),
            title: const Text('Profile'),
            onTap: () {
              // Handle menu item click
            },
          ),
        ],
      ),
    );
  }
}
