import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  String _name = 'John Doe';
  String _address = '123 Main Street';

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _addressController.text = _address;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _updateName(String newName) {
    setState(() {
      _name = newName;
    });
  }

  void _updateAddress(String newAddress) {
    setState(() {
      _address = newAddress;
    });
  }

  void _saveChanges() {
    // Save the changes to your data source (e.g., database) here
    print('Name: $_name');
    print('Address: $_address');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Changes saved'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _nameController,
              onChanged: _updateName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Delivery Address',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _addressController,
              onChanged: _updateAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your delivery address',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Save Changes'),
            ),
            ElevatedButton(onPressed: () {
              
            }, child: Text("sighn out"))

          ],
        ),
      ),
    );
  }
}
