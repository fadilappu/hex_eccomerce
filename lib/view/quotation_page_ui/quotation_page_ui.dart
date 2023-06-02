import 'package:flutter/material.dart';
import 'package:hex_ecommerce/view/cart_ui/cart_ui.dart';

class QuotationPage extends StatefulWidget {
  final List<dynamic>? cartItems;  

     const QuotationPage({super.key, required this.cartItems} ); 
  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
 int rowCount =  cartItems!.length;//Number of Rows

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Order Quotation')),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 80.0),
              Table(
                border: TableBorder(
                    left: BorderSide(), // Border on the left side
                    right: BorderSide(),
                    top: BorderSide()
                    // Border on the right side
                    ),
                columnWidths: const {
                  0: FixedColumnWidth(720.0),
                  // Width of column 0
                  // 1: FixedColumnWidth(750),
                },
                children: [
                  TableRow(
                    children: [
                      SizedBox(
                        height: 200,
                        child: const TableCell(
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Add spacing between the tables
              Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FixedColumnWidth(60.0), // Width of column 0
                  1: FixedColumnWidth(330.0), // Width of column 1
                  2: FixedColumnWidth(330.0), // Width of column 2
                },
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          ' TO          :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          ' ATT        :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          ' REF NO :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          ' E.MAIL  :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Add spacing between the tables
              Table(
                border: TableBorder(
                  left: BorderSide(), // Border on the left side
                  right: BorderSide(),
                  // Border on the right side
                ),
                columnWidths: const {
                  0: FixedColumnWidth(720.0),
                  // Width of column 0
                  // 1: FixedColumnWidth(750),
                },
                children: [
                  TableRow(
                    children: [
                      Container(
                        height: 40,
                        child: const TableCell(
                          child: Center(
                            child: Text(
                              'PURCHASE ORDER',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FixedColumnWidth(60.0), // Width of column 0
                  1: FixedColumnWidth(320.0), // Width of column 1
                  2: FixedColumnWidth(60.0), // Width of column 2
                  3: FixedColumnWidth(100.0), // Width of column 3
                  4: FixedColumnWidth(80.0), // Width of column 4
                  5: FixedColumnWidth(100.0), // Width of column 5
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[
                          200], // Optional: Set background color for the first row
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          height: 60.0, // Increase the height of the first row
                          child: const Center(
                            child: Text(
                              'NO',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60.0,
                          child: const Center(
                            child: Text(
                              'ITEM NAME',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60.0,
                          child: const Center(
                            child: Text(
                              'QTY',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60.0,
                          child: const Center(
                            child: Text(
                              'RATE IN US \$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60.0,
                          child: const Center(
                            child: Text(
                              'UNIT',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60.0,
                          child: const Center(
                            child: Text(
                              'VALUE IN US \$\n(QTY*RATE)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    ...List.generate(rowCount, (index) {
                      //  final product = 'cart-box';
                      return TableRow(
                        children: [
                          TableCell(
                            child: Center(
                            child: Text('Cell ${index+1}'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(widget.cartItems![index].name), // Replace with the relevant product data
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Qty${index+1}'), // Replace with the relevant product data
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rate${index+1}'), // Replace with the relevant product data
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Unit${index+1}'), // Replace with the relevant product data
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Value ${index + 1}'),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
