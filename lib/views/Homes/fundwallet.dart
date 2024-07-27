import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Make sure this is included
import 'package:velopay/views/Homes/homepage.dart';
// Make sure the path to your CreateAccount page is correct

void main() {
  runApp(const FundWallet());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FundWallet(),
    );
  }
}

class FundWallet extends StatefulWidget {
  const FundWallet({super.key});

  @override
  _FundWalletState createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {
  bool _isBalanceVisible = true;
  int _selectedIndex = 0;
  bool _isQrSelected = false;
  final List<Widget> _pages = [HomePage()];

  void _toggleVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isQrSelected = false;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    // Add more navigation cases if needed
  }


  void _onQrTapped() {
    setState(() {
      _isQrSelected = true;
      _selectedIndex = -1;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fund Wallet'), // Changed from 'Text:' to 'title:'
          backgroundColor: Colors.grey.withOpacity(0.7),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 249, 247, 246),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(1),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20), // Set margin for left and right
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Choose or Add new',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Fund Wallet ',
                      border: OutlineInputBorder(),
                      enabled: false, // Disable the input field
                    ),
                    items: const [
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
                padding: const EdgeInsets.only(top: 2, bottom: 60),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20), // Set margin for left and right
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Choose smart card',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Card ',
                      border: OutlineInputBorder(),
                      enabled: false, // Disable the input field
                    ),
                    items: const [
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
                      const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            const Text(
                              'Add new Payment method',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Expiration date',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  hintText: 'MM/YY',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? value) {
                                // Handle checkbox state change
                              },
                            ),
                            const Expanded(
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
                        const SizedBox(height: 120),
                        ElevatedButton(
                          onPressed: () {
                            // Corrected: Navigation happens here in the onPressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            textStyle: const TextStyle(fontSize: 23),
                            minimumSize:
                                const Size(double.infinity, 60), // Full width
                          ),
                          child: const Text(
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
