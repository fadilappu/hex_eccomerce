import 'package:flutter/material.dart';
import 'package:hex_ecommerce/controller/lists.dart';
import 'package:hex_ecommerce/view/quotation_page_ui/quotation_page_ui.dart';
import '../../controller/cart_total_price_calculator.dart';
import '../../controller/hive_storing.dart';
import '../../model/hive_model_class.dart';
import '../product_ui/prouct_details_page_ui.dart';

//  double _calculateTotalPrice() {
//     double totalPrice = 0;
//     for (final entry in selectedQuantities.entries) {
//       final product = entry.key;
//       final quantity = entry.value;
//       totalPrice += product.price * quantity;
//     }
//     return totalPrice;
//   }

final TotalPriceCalculator cartprice = TotalPriceCalculator();

final CartDataStoring cartData = CartDataStoring();
 Map<Product, int> selectedQuantities = {};

class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: cartData.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cartItems = snapshot.data!;
            return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: ( (BuildContext context) => ProductDetailsPage(product))));
                    },
                    child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.network(product.imageUrls),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(onPressed: (){
                            cartData.removeProduct(product);
                          },icon: const Icon(Icons.delete),)
                        ],
                      ),
                    ],
                                  ),
                              ]
                      )  ),
                  );
              }
                );
          } else if (snapshot.hasError) {
            return const Text('Error loading cart items');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),


     bottomNavigationBar: 
    //  Container(
    //     padding: const EdgeInsets.all(16),
    //     color: Colors.grey[200],
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
            // const Text(
            //   'Total Price:',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   '\$${_calculateTotalPrice().toStringAsFixed(2)}',
            //   style: const TextStyle(
            //     fontSize: 18,
            //   ),
            // ),
            ElevatedButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (((context) => QuotationPage(cartItems: cartItems)))));

            }, child: const Text('Order Now'))
          
        );
    
    

    // )

  }


}

//  double _calculateTotalPrice() {
//     double totalPrice = 0;
//     for (final entry in selectedQuantities.entries) {
//       final product = entry.key;
//       final quantity = entry.value;
//       totalPrice += product.price * quantity;
//     }
//     return totalPrice;
//   }
