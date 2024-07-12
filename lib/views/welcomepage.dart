import 'package:flutter/material.dart';
import 'package:velopay/views/createaccount.dart';
import 'package:velopay/views/loginaccount.dart';

void main() {
  runApp(const WelcomePage());
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
          iconTheme: IconThemeData(
            color: Color(0xFFFF8E00), // Change this color to the desired color
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(''),
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
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: const Color(0xFFD5D7DE)),
          child: Stack(
            children: [
              Positioned(
                left: 3,
                top: 120,
                child: Container(
                  width: 408,
                  height: 685,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 185,
                top: 280,
                child: Container(
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
                            color: const Color(0xFFFF8E00),
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
                            color: const Color(0xFFFF8E00),
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
                child: Container(
                  width: 50,
                  height: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 10,
                        height: 5,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFC8D1E1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 10,
                        height: 5,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFC8D1E1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 5,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF8E00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 788,
                left: 0,
                right: 0,
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Center(
                    child: Container(
                      width: 126,
                      height: 5,
                      margin: const EdgeInsets.only(left: 4.0),
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 16, 16, 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
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
                top: 620,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to sign up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccount()),
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
                    child: Row(
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
                top: 670,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to log in screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginAccount()),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Log in',
                          style: TextStyle(
                            color: const Color(0xFFFF8E00),
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
              Positioned(
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
