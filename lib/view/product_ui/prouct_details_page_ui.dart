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
        title: Text(widget.product.name),
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
              Text('Product: ${widget.product.name}',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
              Text('Price: \$${widget.product.price.toStringAsFixed(2)}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              const SizedBox(height: 10,),
      
      // Text('cdsnkcjh vjcksn,ixjnisk c,nx,According to the Sangam classic Purananuru, the Chera king Senkuttuvan conquered the lands between Kanyakumari and the Himalayas.[43] Lacking worthy enemies, he besieged theentury Hindu mythology work Keralolpathi, the lands of Kerala were recovered from the sea by the axe-wielding warrior sage Parasurama, the sixth avatar of Vishnu (hence, Kerala is also called Parasurama Kshetramwhich rose from sea was filled with salt and unsuitable for habitation; so Parasurama invoked the Snake King Vasuki,end was used by Kerala chiefdoms for the legitimation of their rule (most of the major chiefly houses in medieval Kerala traced its origin back to the legendary allocation by the Phe legend, Rayar, the overlord of the Cheraman Perumal in a country east of the Ghats, invaded Kerala during the rule of the last Perumal. To drive back the invading forces the Perumal summoned the militia of his chieftains (like Udaya Varman Kolathiri, Manichchan, and Vikkiran of Eranad). The Cheraman Perumal was assured by the Eradis (chief of Eranad) that they would take a fort established by the  who spat holy poison and converted the soil into fertile lush green land. Out of respect, Vasuki and all snakes were appointed as protectors and guardians of the land. P. T. Srinivasa Iyengar theorised, that Senguttuvan may have been inspired by the Parasurama legendary account, which was brought by early AryAnother much earlier Puranic character associated with Kerala is Mahabali, an Asura and a prototypical just king, who ruled the earth from Kerala. He won the war against the Devas, driving them into exile. The Devas pleaded before Lord Vishnu, who took his fifth incarnation as Vamana and pushed Mahabali down to netherworld to placate the Devas. There is a belief that, once a year during the Onam festival, Mahabali returns to Keral')
      
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
                          selectedSize=newSize;
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