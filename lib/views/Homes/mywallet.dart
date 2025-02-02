import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/fundwallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/cardpage.dart';
import 'package:velopay/views/services/myplan.dart';
import 'homepage.dart'; // Import the homepage.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWallet(),
    );
  }
}

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  bool _isBalanceVisible = true;
  int _selectedIndex = 0;

  void _toggleVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

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
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyPlan()),
        );
        break;
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CardPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccountPage()),
        );
        break;
    }
  }

  void _onQrTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyWallet()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.7),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: kBottomNavigationBarHeight + 150,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'My Wallet ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18),
                                ),
                                TextSpan(
                                  text:
                                      '\n\nYour central hub managing your funds,\nyour wallet history.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Total Balance',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'NGN ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _isBalanceVisible ? '7,200,000.00' : '***',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: Icon(
                                  _isBalanceVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: _toggleVisibility,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FundWallet()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        width: 500,
                        height: 79,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Fund Wallet',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        width: 500,
                        height: 350,
                      ),
                    )
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
            _buildNavItem(Icons.miscellaneous_services, 2),
            const SizedBox(width: 48.0), // Space for FloatingActionButton
            _buildNavItem(Icons.payment, 0),
            _buildNavItem(Icons.person, 1),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTag', // Added unique hero tag
        backgroundColor: Colors.orange,
        onPressed: _onQrTapped,
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
        color: _selectedIndex == index ? const Color.fromARGB(255, 7, 7, 7) : Colors.black,
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
        _onItemTapped(index);
      },
    );
  }
}
