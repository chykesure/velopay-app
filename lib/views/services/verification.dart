import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velopay/views/services/transactioncomplete.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Verification Text at the top
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Verification',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Fingerprint Icon
            SizedBox(
              height: iconSize, // Ensure responsiveness
              width: iconSize,
              child: Image.asset(
                'images/finger.jpg', // Replace with your fingerprint icon path
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your PIN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kindly enter your transaction PIN to continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // PIN Code Input Field
            PinCodeTextField(
              appContext: context,
              length: 4, // Number of characters in the PIN
              obscureText: false, // Set to true if you want to hide the input
              animationType: AnimationType.fade, // Animation style
              keyboardType: TextInputType.number, // Numerical input
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle, // Shape of the fields (Circle)
                fieldHeight: 80, // Height of each field
                fieldWidth: 70, // Width of each field
                activeFillColor: Colors.white, // Fill color when active
                selectedFillColor: Colors.white, // Fill color when selected
                inactiveFillColor: Colors.white, // Fill color when inactive
                activeColor: Colors.black, // Border color when active
                selectedColor: Colors.orange, // Border color when selected
                inactiveColor: Colors.black, // Border color when inactive
              ),
              animationDuration:
                  const Duration(milliseconds: 300), // Animation duration
              enableActiveFill: true, // Enable fill color when active
              autoFocus: true, // Automatically focus the field
              textStyle: const TextStyle(
                fontSize: 24, // Set the font size for the PIN text
                color: Colors.black, // Set the text color to black
              ),
              onCompleted: (v) {
                print("Completed"); // Callback when all fields are filled
              },
              onChanged: (value) {
                print(value); // Callback for every change in the field
              },
            ),

            const SizedBox(height: 45),
            // Complete Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionComplete(),
                  ),
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
                'Complete',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
