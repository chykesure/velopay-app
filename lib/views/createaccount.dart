import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velopay/views/accountconfirm.dart';
import 'package:velopay/views/loginaccount.dart'; // Ensure this path is correct

void main() {
  runApp(const CreateAccount());
}

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _obscureText = true; // To toggle password visibility

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
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
                  padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 40),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(
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
                            prefixIcon: const Icon(Icons.email),
                            suffixIcon: const Icon(Icons.help_outline),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Phone number',
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            hintText: '+234',
                            border: OutlineInputBorder(
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
                            prefixIcon: const Icon(Icons.phone),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            hintText: 'Set password',
                            border: OutlineInputBorder(
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
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        const SizedBox(height: 150),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginAccount()),
                            );
                          },
                          child: const Text(
                            'Already have an account? Log in',
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AccountConfirm()),
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
                            'Continue',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
