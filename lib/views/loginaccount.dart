import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/createaccount.dart';

class LoginAccount extends StatefulWidget {
  const LoginAccount({super.key});

  @override
  _LoginAccountState createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  // Toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _loginUser() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Validate form inputs before sending request
    if (email.isEmpty || password.isEmpty) {
      _showSnackbar('Please enter both email and password.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    //const String apiUrl = "http://10.0.2.2/myapi/login.php"; // Ensure the correct API URL
    const String apiUrl = "https://swiftsendify.com/velopay_api/login.php";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email, // Ensure that these parameters are included
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Check the response from the API
        if (responseBody['message'] == 'Login successful') {
          _showSnackbar('Login successful. Welcome!');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (responseBody['message'] == 'Invalid password') {
          _showSnackbar('Incorrect password. Please try again.');
        } else if (responseBody['message'] == 'User not found') {
          _showSnackbar('Email not registered. Please create an account.');
        } else {
          _showSnackbar(
              responseBody['message'] ?? 'Login failed. Please try again.');
        }
      } else {
        _showSnackbar('An error occurred. Please try again.');
      }
    } catch (e) {
      _showSnackbar('An error occurred. Please check your connection.');
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to display Snackbar
  void _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
    );

    // Use ScaffoldMessenger to show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
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
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.75),
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          hintText: 'Enter your email address',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.black),
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          hintText: 'Enter your password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _loginUser, // Call actual login function
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccount()),
                          );
                        },
                        child: const Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
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
    );
  }
}
