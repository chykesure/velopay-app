import 'package:flutter/material.dart';
import 'package:velopay/views/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF8E00),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: const Splash(),
          ),
        ),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimationV;
  late Animation<double> _opacityAnimationP;
  late Animation<double> _opacityAnimationVeloPay;
  late Animation<double> _positionAnimationV;
  late Animation<double> _positionAnimationP;
  late Animation<double> _positionAnimationVeloPay;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _opacityAnimationV = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _opacityAnimationP = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );

    _opacityAnimationVeloPay = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1, curve: Curves.easeIn),
      ),
    );

    _positionAnimationV = Tween<double>(begin: 50, end: 169).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    _positionAnimationP = Tween<double>(begin: 50, end: 184).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _positionAnimationVeloPay = Tween<double>(begin: 50, end: 123).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    // Navigate to Splashscreen.dart after 5 seconds
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Splashscreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
      children: [
        Container(
          width: double.infinity,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFFF8E00)),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    left: screenWidth * (_positionAnimationV.value / 375), // Adjust for screen width
                    top: screenHeight / 2 - 140,
                    child: Opacity(
                      opacity: _opacityAnimationV.value,
                      child: const Text(
                        'V',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    left: screenWidth * (_positionAnimationP.value / 375), // Adjust for screen width
                    top: screenHeight / 2 - 140,
                    child: Opacity(
                      opacity: _opacityAnimationP.value,
                      child: const Text(
                        'P',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    left: screenWidth * (_positionAnimationVeloPay.value / 375), // Adjust for screen width
                    top: screenHeight / 2 - 86,
                    child: Opacity(
                      opacity: _opacityAnimationVeloPay.value,
                      child: const SizedBox(
                        width: 149,
                        height: 39,
                        child: Text(
                          'VeloPay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
