import 'package:flutter/material.dart';
import 'package:velopay/views/createaccount.dart';
import 'package:velopay/views/loginaccount.dart';

void main() {
  runApp(const WelcomePage());
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color(0xFFFF8E00), // Change this color to the desired color
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(''),
        ),
        body: ListView(
          children: const [
            Onboarding(),
          ],
        ),
      ),
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFD5D7DE)),
          child: Stack(
            children: [
              Positioned(
                top: 120,
                left: 13,
                right: 13, // Added right margin
                child: Container(
                  height: screenHeight,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 185,
                top: 280,
                child: SizedBox(
                  width: 56,
                  height: 78,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 1,
                        child: Text(
                          'V',
                          style: TextStyle(
                            color: Color(0xFFFF8E00),
                            fontSize: 64,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 0,
                        child: Text(
                          'P',
                          style: TextStyle(
                            color: Color(0xFFFF8E00),
                            fontSize: 64,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 178,
                top: 365,
                child: SizedBox(
                  width: 50,
                  height: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 5,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC8D1E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          height: 5,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC8D1E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          height: 5,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFF8E00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 120,
                top: 250,
                child: Text(
                  'Welcome to VeloPay!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Abel',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 720,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to sign up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccount()),
                    );
                  },
                  child: Container(
                    width: 336,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFF8E00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Abel',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 770,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to log in screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginAccount()),
                    );
                  },
                  child: Container(
                    width: 336,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Log in',
                          style: TextStyle(
                            color: Color(0xFFFF8E00),
                            fontSize: 16,
                            fontFamily: 'Abel',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                top: 500,
                width: 336,
                child: Text(
                  'By tapping “sign up” or ”Log in”, you agree to our terms. learn more about how we process your data in our privacy policy and cookies policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Abel',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                top: 407,
                width: 336,
                child: Text(
                  'To get started, please log in to your account or sign up for a new one. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Abel',
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
