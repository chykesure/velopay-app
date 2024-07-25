import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Make sure this is included
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/createaccount.dart'; // Make sure the path to your CreateAccount page is correct

void main() {
  runApp(FundWallet());
}

class FundWallet extends StatelessWidget {
  FundWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fund Wallet'), // Changed from 'Text:' to 'title:'
          backgroundColor: Colors.grey.withOpacity(0.7),
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 249, 247, 246),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(1),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Set margin for left and right
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Choose or Add new',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Fund Wallet ',
                      border: OutlineInputBorder(),
                      enabled: false, // Disable the input field
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      DropdownMenuItem(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                      DropdownMenuItem(
                        value: 'Add New',
                        child: Text('Add New'),
                      ),
                    ],
                    onChanged: null, // Disable selection
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 60),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20), // Set margin for left and right
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Choose smart card',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Card ',
                      border: OutlineInputBorder(),
                      enabled: false, // Disable the input field
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      DropdownMenuItem(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                      DropdownMenuItem(
                        value: 'Add New',
                        child: Text('Add New'),
                      ),
                    ],
                    onChanged: null, // Disable selection
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  decoration: BoxDecoration(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            Text(
                              'Add new Payment method',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '16 digits number',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintText: '1342 7654 9007 3331',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value == null || value.length != 16) {
                              return 'Please enter a valid 16-digit card number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Expiration date',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  hintText: 'MM/YY',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'CVV',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  hintText: 'XXX',
                                  border: OutlineInputBorder(),
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  if (value == null || value.length != 3) {
                                    return 'Please enter a valid 3-digit CVV';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? value) {
                                // Handle checkbox state change
                              },
                            ),
                            Expanded(
                              child: Text(
                                'Save this payment method',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 120),
                        ElevatedButton(
                          onPressed: () {
                            // Corrected: Navigation happens here in the onPressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            textStyle: TextStyle(fontSize: 23),
                            minimumSize:
                                Size(double.infinity, 60), // Full width
                          ),
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
