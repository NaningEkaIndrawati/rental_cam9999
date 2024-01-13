import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  final String Fullname;
  final String phoneNumber;
  final String productName;
  final String pricePerHour;
  final String quantity;
  final String date;
  final bool verified;

  Second({
    required this.Fullname,
    required this.phoneNumber,
    required this.productName,
    required this.pricePerHour,
    required this.quantity,
    required this.date,
    required this.verified,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Reservasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Full Name: $Fullname'),
                Text('Phone Number: $phoneNumber'),
                Text('Product Name: $productName'),
                Text('Price per Hour: $pricePerHour'),
                Text('Quantity: $quantity'),
                Text('Date: $date'),
                Text('Verify: ${verified ? 'Verified' : 'Not Verified'}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
