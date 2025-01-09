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
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        return Container(
          width: double.infinity,
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF8E00), // Start color
                Color.fromARGB(255, 209, 211, 211), // End color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              _buildHeader(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _buildPage(
                      image: const AssetImage("images/sp3.jpg"),
                      title: "Never miss a payment again",
                      subtitle:
                          "Pay your electricity, internet, and other utility bills quickly and easily from the palm of your hand",
                    ),
                    _buildPage(
                      image: const AssetImage("images/sp2.jpg"),
                      title: "Easy and Secure Payments",
                      subtitle:
                          "Experience seamless and secure transactions with VeloPay",
                    ),
                    _buildPage(
                      image: const AssetImage("images/sp.jpg"),
                      title: "Manage Your Bills Efficiently",
                      subtitle:
                          "Keep track of all your bills in one place with VeloPay",
                    ),
                  ],
                ),
              ),
              _buildPageIndicator(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.only(top: 20), // Move the header down
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25), // Round the logo
          child: Image.asset(
            "images/VP.png", // Replace with your logo's asset path
            height: 50, // Adjust size as needed
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Welcome to VeloPay",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}


  Widget _buildPage({
    required AssetImage image,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            width: 340,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF8E00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: _currentPage == index ? 12 : 8,
          height: _currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color(0xFFFF8E00)
                : const Color(0xFFE0E0E0),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

void main() {
  runApp(const Splashscreen());
}
