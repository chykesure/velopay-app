import 'package:flutter/material.dart';
import 'package:velopay/views/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Splash(),
        ]),
      ),
    );
  }
}

class Splash extends StatefulWidget {
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
        curve: Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _opacityAnimationP = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );

    _opacityAnimationVeloPay = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1, curve: Curves.easeIn),
      ),
    );

    _positionAnimationV = Tween<double>(begin: 50, end: 169).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    _positionAnimationP = Tween<double>(begin: 50, end: 184).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _positionAnimationVeloPay = Tween<double>(begin: 50, end: 123).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    // Navigate to Splashscreen.dart after 5 seconds
    Future.delayed(Duration(seconds: 15), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Splashscreen()),
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
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFFF8E00)),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    left: _positionAnimationV.value,
                    top: MediaQuery.of(context).size.height / 2 - 32,
                    child: Opacity(
                      opacity: _opacityAnimationV.value,
                      child: Text(
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
                    left: _positionAnimationP.value,
                    top: MediaQuery.of(context).size.height / 2 - 32,
                    child: Opacity(
                      opacity: _opacityAnimationP.value,
                      child: Text(
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
                    left: _positionAnimationVeloPay.value,
                    top: MediaQuery.of(context).size.height / 2 + 16,
                    child: Opacity(
                      opacity: _opacityAnimationVeloPay.value,
                      child: SizedBox(
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
