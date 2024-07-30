import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/cardpage.dart';

class MyPlan extends StatefulWidget {
  const MyPlan({super.key});

  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
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
      case 2:
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

  Widget _buildServiceCard(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
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
                                  text: 'Services ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18),
                                ),
                                TextSpan(
                                  text:
                                      '\n\nExplore our range of services designed to simplify your life.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildServiceCard("Airtime", Icons.phone),
                        _buildServiceCard("Data", Icons.wifi),
                        _buildServiceCard("CableTv", Icons.tv),
                        _buildServiceCard("Electricity", Icons.power),
                        _buildServiceCard("Internet", Icons.public),
                        _buildServiceCard("More", Icons.more_horiz),
                      ],
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
            _buildNavItem(Icons.home, 1),
            _buildNavItem(Icons.miscellaneous_services, 0),
            const SizedBox(width: 48.0),
            _buildNavItem(Icons.payment, 2),
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
