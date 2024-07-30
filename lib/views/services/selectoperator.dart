import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/cardpage.dart';
import 'package:velopay/views/services/myplan.dart';

class SelectOperator extends StatefulWidget {
  const SelectOperator({super.key});

  @override
  State<SelectOperator> createState() => _SelectOperatorState();
}

class _SelectOperatorState extends State<SelectOperator> {
  int _selectedIndex = 0;
  String? _selectedNetwork;
  final TextEditingController _phoneController = TextEditingController();
  bool _saveTopup = false;
  bool _scheduleTopup = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyPlan()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CardPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccountPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Center(
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Select Operator ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
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
                    const SizedBox(height: 60),
                    DropdownButtonFormField<String>(
                      value: _selectedNetwork,
                      items: ['MTN', 'GLO', 'AIRTEL']
                          .map((network) => DropdownMenuItem(
                                value: network,
                                child: Container(
                                  color: Colors.transparent,
                                  child: Text(
                                    network,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        labelText: 'Select Mobile Operator',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      dropdownColor: Colors.transparent, // Make the dropdown background transparent
                      onChanged: (value) {
                        setState(() {
                          _selectedNetwork = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Enter phone number',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    SwitchListTile(
                      title: const Text(
                        'Save this topup',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: _saveTopup,
                      onChanged: (value) {
                        setState(() {
                          _saveTopup = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text(
                        'Schedule this airtime topup',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: _scheduleTopup,
                      onChanged: (value) {
                        setState(() {
                          _scheduleTopup = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement the functionality for buying airtime here
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Buy Airtime',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: const Color.fromARGB(255, 244, 239, 239),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.home, 2),
            _buildNavItem(Icons.miscellaneous_services, 0),
            const SizedBox(width: 48.0),
            _buildNavItem(Icons.payment, 1),
            _buildNavItem(Icons.person, 3),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyWallet()),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? Colors.orange : Colors.black,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
