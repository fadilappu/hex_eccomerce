// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// Future<void> _startPayment() async {
//   // Prepare the payment parameters
//   final orderMap = {
//     'id': '123456', // Replace with your order ID
//     'customer_id': '7890', // Replace with the customer ID
//     'amount': '100.00', // Replace with the payment amount
//     'customer_email': 'example@example.com', // Replace with the customer's email
//     'customer_phone': '1234567890', // Replace with the customer's phone number
//     'callback_url': 'https://example.com/callback', // Replace with the callback URL
//     'checksum': 'ABCD1234', // Replace with the payment checksum
//   };

//   try {
//     // Call the native method to start the payment
//        final platform = MethodChannel('com.example.hex_ecommerce/payment'); // Replace with your channel name
//     final int result = await platform.invokeMethod('startPayment', orderMap);
//     if (result == 1) {
//       // Payment successful
//       Fluttertoast.showToast(msg: 'Payment Successful!');
//       // Additional logic after successful payment
//     } else {
//       // Payment failed or canceled
//       Fluttertoast.showToast(msg: 'Payment Failed!');
//       // Additional logic for failed or canceled payment
//     }
//   } on PlatformException catch (e) {
//     // Error handling for platform exceptions
//     Fluttertoast.showToast(msg: e.toString());
//   }
// }
