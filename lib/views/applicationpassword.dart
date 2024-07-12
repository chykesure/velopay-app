import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velopay/views/loginaccount.dart';


void main() {
  runApp(ApplicationPassword());
}

class ApplicationPassword extends StatelessWidget {
  ApplicationPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 250, 249, 248)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(''),
        ),
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80, bottom: 40),
                child: Text(
                  'Application Password',
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
                  padding: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Please, set password for the application for security purposes:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(height: 30),
                        PinCodeTextField(
                          appContext: context,
                          length: 4,
                          obscureText: true,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 60,
                            fieldWidth: 60,
                            activeFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            inactiveColor: Colors.black,
                            activeColor: Colors.black,
                            selectedColor: Colors.orange,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: Duration(milliseconds: 300),
                          textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          autoFocus: true,
                          onCompleted: (value) {
                            // Navigate to LoginAccount page once the pin is complete
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginAccount()),
                            );
                          },
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        SizedBox(height: 290),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Continue without password',
                            style: TextStyle(color: Colors.black, decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 18),
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
