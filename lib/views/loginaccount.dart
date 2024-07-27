import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/createaccount.dart'; // Make sure the path to your CreateAccount page is correct

void main() {
  runApp(const LoginAccount());
}

class LoginAccount extends StatelessWidget {
  const LoginAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 249, 247, 246)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80, bottom: 40),
                child: Text(
                  'Login Account',
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
                  padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                            suffixIcon: Icon(Icons.help_outline), 
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintText: 'Set password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility_off),
                          ),
                          obscureText: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Add functionality for forgot password here
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 200), // Adjust space as needed
                        TextButton(
                          onPressed: () {
                            // Implement navigation to the CreateAccount page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CreateAccount()),
                            );
                          },
                          child: const Text(
                            'Don’t you have an account? Sign up',
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Corrected: Navigation happens here in the onPressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            textStyle: const TextStyle(fontSize: 23),
                            minimumSize: const Size(double.infinity, 60), // Full width
                          ),
                          child: const Text(
                            'Login',
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
