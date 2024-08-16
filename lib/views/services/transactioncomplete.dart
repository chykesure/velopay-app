import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';

class TransactionComplete extends StatelessWidget {
  const TransactionComplete({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate screen size to ensure responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.3; // Icon size relative to screen width

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Success Icon
                SizedBox(
                  height: iconSize, // Ensure responsiveness
                  width: iconSize,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: iconSize,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Transaction Successful!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your transaction was completed successfully.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Home Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    textStyle: const TextStyle(fontSize: 23),
                    minimumSize: const Size(double.infinity, 60), // Full width
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
