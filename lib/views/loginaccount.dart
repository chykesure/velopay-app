import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/createaccount.dart'; // Make sure the path to your CreateAccount page is correct

void main() {
  runApp(const LoginAccount());
}

class LoginAccount extends StatefulWidget {
  const LoginAccount({super.key});

  @override
  _LoginAccountState createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  bool _obscureText = true; // For toggling password visibility

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
                        const SizedBox(height: 40),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                            hintText: 'Enter your email address',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.email),
                            suffixIcon: const Icon(Icons.help_outline),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                            hintText: 'Set password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
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
                            // Navigation to HomePage
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
