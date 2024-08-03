import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/cardpage.dart';
import 'package:velopay/views/services/myplan.dart';
import 'package:velopay/views/services/selectoperator.dart';

class AirtimePage extends StatefulWidget {
  const AirtimePage({super.key});

  @override
  State<AirtimePage> createState() => _AirtimePageState();
}

class _AirtimePageState extends State<AirtimePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 3:
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
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccountPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                                      text: 'Airtime ',
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
                    const SizedBox(height: 50),
                    // Airtime Recharge Section
                    Container(
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectOperator()),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.phone_android,
                                color: Colors.orange, size: 40),
                            SizedBox(width: 15),
                            Text(
                              'Airtime Recharge',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 110),
                    // Recent Top-ups Section
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent Top-ups',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildTopUpItem(
                              'MTN', 'MTN-2346789087645', 'N2,000.00'),
                          _buildTopUpItem(
                              'GLO', 'MTN-2346789087645', 'N7,000.00'),
                          _buildTopUpItem(
                              'MTN', 'MTN-2346789087645', 'N2,000.00'),
                          _buildTopUpItem(
                              'GLO', 'MTN-2346789087645', 'N7,000.00'),
                        ],
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
            _buildNavItem(Icons.home, 3),
            _buildNavItem(Icons.miscellaneous_services, 0),
            const SizedBox(width: 48.0),
            _buildNavItem(Icons.payment, 1),
            _buildNavItem(Icons.person, 2),
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

  Widget _buildTopUpItem(String network, String number, String amount) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.receipt_long, color: Colors.orange, size: 40),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                network,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
