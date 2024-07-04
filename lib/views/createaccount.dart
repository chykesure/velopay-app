import 'package:flutter/material.dart';

void main() {
  runApp(CreateAccount());
}

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF8E00),
          iconTheme: IconThemeData(
            color: Colors.white, // Change this color to the desired color
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
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 812,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: const Color(0xFFFF8E00)),
                  child: Stack(
                    children: [
                      Positioned(
                        left: -1,
                        top: 182,
                        child: Container(
                          width: 414,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                            bottom: 50,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 63),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 335,
                                            height: 71,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Email',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF010202),
                                                    fontSize: 14,
                                                    fontFamily: 'Abel',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                Container(
                                                  width: 335,
                                                  height: 49,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: const Color(
                                                              0xFFC8D1E1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Enter your email address',
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xFFC8D1E1),
                                                          fontSize: 14,
                                                          fontFamily: 'Abel',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Container(
                                                        width: 24,
                                                        height: 24,
                                                        child: FlutterLogo(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          Container(
                                            width: 335,
                                            height: 71,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Phone number',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF010202),
                                                    fontSize: 14,
                                                    fontFamily: 'Abel',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                Container(
                                                  width: 335,
                                                  height: 49,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: const Color(
                                                              0xFFC8D1E1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '+234',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xFFC8D1E1),
                                                          fontSize: 14,
                                                          fontFamily: 'Abel',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          Container(
                                            width: 335,
                                            height: 71,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Password',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF010202),
                                                    fontSize: 14,
                                                    fontFamily: 'Abel',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                Container(
                                                  width: 335,
                                                  height: 49,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: const Color(
                                                              0xFFC8D1E1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Set password',
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xFFC8D1E1),
                                                          fontSize: 14,
                                                          fontFamily: 'Abel',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Container(
                                                        width: 24,
                                                        height: 24,
                                                        child: FlutterLogo(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 78),
                              Container(
                                width: 336,
                                height: 87,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 39,
                                      top: 0,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Already have an account? ',
                                              style: TextStyle(
                                                color: const Color(0xFF010202),
                                                fontSize: 16,
                                                fontFamily: 'Abel',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Log in',
                                              style: TextStyle(
                                                color: const Color(0xFF010202),
                                                fontSize: 16,
                                                fontFamily: 'Abel',
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.underline,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 37,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Add functionality here
                                        },
                                        child: Container(
                                          width: 336,
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFFF8E00),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Continue',
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 99,
                        child: SizedBox(
                          width: 335,
                          child: Text(
                            'Create account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Abel',
                              fontWeight: FontWeight.w400,
                              height: 0.07,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 778,
                        child: Container(
                          height: 34,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 414,
                                height: 34,
                                padding: const EdgeInsets.only(
                                  top: 21,
                                  left: 134,
                                  right: 134,
                                  bottom: 8,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 126,
                                      height: 5,
                                      margin: const EdgeInsets.only(left: 4.0),
                                      decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 375,
                          height: 50.49,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 78,
                                top: -2,
                                child: Container(
                                    width: 219, height: 30, child: Stack()),
                              ),
                              Positioned(
                                left: 293.67,
                                top: 8,
                                child: Container(
                                  width: 66.66,
                                  height: 20.67,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 42.33,
                                        top: 9.33,
                                        child: Container(
                                          width: 24.33,
                                          height: 11.33,
                                          child: Stack(),
                                        ),
                                      ),
                                      Positioned(
                                        left: 22.03,
                                        top: 9.33,
                                        child: Container(
                                          width: 15.27,
                                          height: 10.97,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/15x11"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 9.67,
                                        child: Container(
                                          width: 17,
                                          height: 10.67,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/17x11"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 4.33,
                                        top: 0,
                                        child: Container(
                                          width: 6,
                                          height: 6,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFFF9500),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 7,
                                top: 12,
                                child: Container(
                                  width: 54,
                                  height: 21,
                                  padding: const EdgeInsets.only(
                                    top: 5.17,
                                    left: 12.45,
                                    right: 13.12,
                                    bottom: 4.74,
                                  ),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

