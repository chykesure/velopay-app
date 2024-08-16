import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/myplan.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
      case 1:
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
    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Payments',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: TextButton(
              onPressed: () {
                // Action for 'New' button
              },
              child: Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Custom TabBar
          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.orange,
                indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                indicatorPadding: EdgeInsets.all(screenWidth * 0.01),
                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Transactions',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Templates',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add spacing between TabBar and content
          SizedBox(height: screenHeight * 0.02),
          // Expanded widget to fill remaining space with TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTransactionList(screenWidth),
                _buildTemplateList(screenWidth),
              ],
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
            _buildNavItem(Icons.miscellaneous_services, 1),
            const SizedBox(width: 48.0),
            _buildNavItem(Icons.payment, 0),
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
          borderRadius: BorderRadius.circular(screenWidth * 0.075),
        ),
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _buildTransactionList(double screenWidth) {
    return Container(
      color: Colors.white, // Background color for the entire list view
      child: ListView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        children: [
          _buildTransactionItem(Icons.phone, 'Airtime', 'MASTERCARD **** 3241', '\$10.00', screenWidth),
          _buildTransactionItem(Icons.water_drop, 'Water', 'MASTERCARD **** 3241', '\$10.00', screenWidth),
          _buildTransactionItem(Icons.local_fire_department, 'Gas', 'MASTERCARD **** 3241', '\$25.00', screenWidth),
          _buildTransactionItem(Icons.bolt, 'Light', 'MASTERCARD **** 3241', '\$108.00', screenWidth),
          _buildTransactionItem(Icons.wifi, 'Data', 'MASTERCARD **** 3241', '\$18.00', screenWidth),
        ],
      ),
    );
  }

  Widget _buildTemplateList(double screenWidth) {
    return Container(
      color: Colors.white, // Background color for the entire list view
      child: ListView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        children: [
          _buildTransactionItem(Icons.phone, 'Airtime', 'MASTERCARD **** 3241', '\$10.00', screenWidth),
          _buildTransactionItem(Icons.water_drop, 'Water', 'MASTERCARD **** 3241', '\$10.00', screenWidth),
          _buildTransactionItem(Icons.local_fire_department, 'Gas', 'MASTERCARD **** 3241', '\$25.00', screenWidth),
          _buildTransactionItem(Icons.bolt, 'Light', 'MASTERCARD **** 3241', '\$108.00', screenWidth),
          _buildTransactionItem(Icons.wifi, 'Data', 'MASTERCARD **** 3241', '\$15.00', screenWidth),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(IconData icon, String title, String subtitle, String amount, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100], // Light grey background similar to the image
        borderRadius: BorderRadius.circular(screenWidth * 0.025), // Rounded corners
      ),
      margin: EdgeInsets.only(bottom: screenWidth * 0.05), // Spacing between items
      child: ListTile(
        leading: Icon(icon, color: Colors.orange, size: screenWidth * 0.1),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: screenWidth * 0.045)),
        subtitle: Text(subtitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: screenWidth * 0.04)),
        trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05, color: Colors.black)),
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
