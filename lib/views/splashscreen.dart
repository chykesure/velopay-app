// In splashscreen.dart

import 'package:flutter/material.dart';
import 'package:velopay/views/welcomepage.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: Splash2(),
      ),
    );
  }
}

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        return Container(
          width: double.infinity,
          height: screenHeight,
          decoration: const BoxDecoration(color: Colors.white),
          child: PageView(
            controller: _pageController,
            children: [
              _buildPage(
                image: const AssetImage("images/sp1.jpg"),
                title: "Never miss a payment again",
                subtitle: "Pay your electricity, internet, and other utility bills quickly and easily from the palm of your hand",
              ),
              _buildPage(
                image: const AssetImage("images/sp2.jpg"),
                title: "Easy and Secure Payments",
                subtitle: "Experience seamless and secure transactions with VeloPay",
              ),
              _buildPage(
                image: const AssetImage("images/sp2.jpg"),
                title: "Manage Your Bills Efficiently",
                subtitle: "Keep track of all your bills in one place with VeloPay",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPage({required AssetImage image, required String title, required String subtitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100),
          width: 340,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        const SizedBox(height: 20), // Add some spacing between the image and the text
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20, // Increased font size
            fontFamily: 'Manrope',
            fontWeight: FontWeight.bold, // Made text bold
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20), // Add some spacing between the title and the subtitle
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16, // Increased font size
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600, // Made text bolder
            height: 1.5,
          ),
        ),
        const SizedBox(height: 40), // Add some spacing between the subtitle and the button
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WelcomePage()), // Navigate to WelcomePage
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF8E00), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const Splashscreen());
}
