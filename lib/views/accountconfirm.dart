import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velopay/views/applicationpassword.dart'; // Make sure to add this package to your pubspec.yaml

void main() {
  runApp(const AccountConfirm());
}

class AccountConfirm extends StatelessWidget {
  const AccountConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          iconTheme: const IconThemeData(
            color: Color.fromARGB(
                255, 250, 249, 248), // Change this color to the desired color
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(''),
        ),
        backgroundColor: Colors.orange, // Adjusted to the orange shade
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80, bottom: 40),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.75),
                  padding:
                      const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Please, enter the OTP code sent to +234 80*** ** 00:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 30),
                        PinCodeTextField(
                          appContext: context,
                          length: 4, // Number of characters in the PIN
                          obscureText:
                              false, // Does not hide the input, set to true to obscure
                          animationType: AnimationType.fade, // Animation style
                          keyboardType: TextInputType
                              .number, // Keyboard type set to number for numerical input
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box, // Shape of the fields
                            borderRadius: BorderRadius.circular(
                                10), // Border radius of each field
                            fieldHeight: 80, // Height of each field
                            fieldWidth: 70, // Width of each field
                            activeFillColor:
                                Colors.white, // Fill color when field is active
                            selectedFillColor: Colors
                                .white, // Fill color when field is selected
                            inactiveFillColor: Colors
                                .white, // Fill color when field is inactive
                            activeColor: Colors
                                .black, // Border color when field is active
                            selectedColor: Colors
                                .orange, // Border color when field is selected
                            inactiveColor: Colors
                                .black, // Border color when field is inactive
                          ),
                          animationDuration: const Duration(
                              milliseconds: 300), // Duration of the animation
                          enableActiveFill:
                              true, // Enable fill color when active
                          autoFocus:
                              true, // Automatically focus the field when the widget is built
                          onCompleted: (v) {
                            print(
                                "Completed"); // Callback when all fields are filled
                          },
                          onChanged: (value) {
                            print(
                                value); // Callback for every change in the field
                          },
                        ),
                        const SizedBox(height: 185),
                        TextButton(
                          onPressed: () {
                            // Pop the current page off the navigation stack
                            Navigator.pop(context);
                            // Immediately push the same page back onto the navigation stack
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccountConfirm()));
                          },
                          child: const Text(
                            'Resend code',
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            // Corrected: Navigation happens here in the onPressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ApplicationPassword()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            textStyle: const TextStyle(fontSize: 23),
                            minimumSize:
                                const Size(double.infinity, 60), // Full width
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
