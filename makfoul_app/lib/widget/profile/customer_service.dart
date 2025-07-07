import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.phone_outlined),
              title: Text("0500000000", style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text("Makfoul@gmail.com", style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
