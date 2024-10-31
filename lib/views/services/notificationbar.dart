import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/cardpage.dart';
import 'package:velopay/views/services/myplan.dart';

class NotificationBar extends StatefulWidget {
  const NotificationBar({super.key});

  @override
  State<NotificationBar> createState() => _NotificationBarState();
}

class _NotificationBarState extends State<NotificationBar> {
  int _selectedIndex = 0;
  late List<bool> _isTapped;  // For tap state tracking

  @override
  void initState() {
    super.initState();
    // Initialize tap states for each notification
    _isTapped = List<bool>.filled(4, false);  // Adjust the length based on the number of notifications
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
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

  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Notifications", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.grey),
            onPressed: () {
              // Add functionality for the settings button if necessary
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Add notification cards
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(screenWidth * 0.05),
              children: [
                buildTappableNotificationCard(
                  context,
                  "Smart card’s balance is about to get to 0. Please, make your payment.",
                  "today",
                  Icons.credit_card,
                  0,
                ),
                buildTappableNotificationCard(
                  context,
                  "Smart card’s balance is about to get to 0. Please, make your payment.",
                  "today",
                  Icons.credit_card,
                  1,
                ),
                buildTappableNotificationCard(
                  context,
                  "Your balance has been increased.",
                  "1 week ago",
                  null,
                  2,
                ),
                buildTappableNotificationCard(
                  context,
                  "Your payment has been processed.",
                  "12/12/21",
                  null,
                  3,
                ),
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
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.miscellaneous_services, 1),
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
          borderRadius: BorderRadius.circular(30),  // Fixed radius
        ),
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget buildTappableNotificationCard(BuildContext context, String message, String time, IconData? icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped[index] = !_isTapped[index];  // Toggle the tap state
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _isTapped[index] ? Matrix4.translationValues(-10, 0, 0) : Matrix4.identity(),  // Swipe effect on tap
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),  // Light grey background
          borderRadius: BorderRadius.circular(15),
          boxShadow: _isTapped[index]
              ? [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(5, 5),  // Shadow on tap
                  )
                ]
              : [],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),  // Light grey text
                  ),
                  const SizedBox(height: 10),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),  // Lighter grey for time
                  ),
                ],
              ),
            ),
            if (icon != null)
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? Colors.orange : Colors.grey[600],  // Use grey for inactive items
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
