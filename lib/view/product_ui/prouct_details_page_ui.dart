import 'package:flutter/material.dart';
import '../../controller/hive_storing.dart';
import '../../controller/lists.dart';
import '../../model/hive_model_class.dart';
import '../cart_ui/cart_ui.dart';

String? selectedSize;

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage(this.product, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<Product> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hard Ware'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 500,
                  width: 900,
                  child: Image.network(widget.product.imageUrls)),
              Text(
                'Product: ${widget.product.name}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Price: \$${widget.product.price.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
             
              SizedBox(
                height: 62.2,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: selectedSize,
                      onChanged: (String? newSize) {
                        setState(() {
                          // if (selectedSize == 'XL') {
                          //               showSizeSelectionDialog();
                          //             }
                          selectedSize = newSize;
                        });
                      },
                      items: sizeOptions.map((String size) {
                        return DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
               Text('Description:${widget.product.description}'),
            
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 63,
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 70,
              width: 433,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    cartItems.add(widget.product);
                    CartDataStoring().insertProduct(widget.product);
                    // Add the product to the cart
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text("Add to Cart"),
              ),
            ),
            SizedBox(
              height: 70,
              width: 433,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
                child: const Text("Go to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }

// void showSizeSelectionDialog() {
//   showDialog(
//     context: context,
//     builder: (BuildContext dialogContext) {
//       List<String> remainingSizeOptions = List.from(sizeOptions);
//       remainingSizeOptions.remove(selectedSize);

//       String? newSelectedSize;

//       return AlertDialog(
//         title: Text('Select Size Again'),
//         content: StatefulBuilder(
//           builder: (BuildContext builderContext, StateSetter setState) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 DropdownButton<String>(
//                   value: newSelectedSize,
//                   onChanged: (String? newSize) {
//                     setState(() {
//                       newSelectedSize = newSize;
//                     });
//                   },
//                   items: remainingSizeOptions.map((String size) {
//                     return DropdownMenuItem<String>(
//                       value: size,
//                       child: Text(size),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             );
//           },
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(dialogContext).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               if (newSelectedSize != null) {
//                 selectedSize = newSelectedSize;
//                 if (selectedSize == 'L') {
//                   showSizeSelectionDialog();
//                 } else {
//                   Navigator.of(dialogContext).pop();
//                   // Perform further actions or logic with the updated selectedSize
//                 }
//               }
//             },
//             child: Text('Select'),
//           ),
//         ],
//       );
//     },

//   );
// }
}
