import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/loginaccount.dart';
import 'package:velopay/views/services/myplan.dart';
import 'package:velopay/views/services/cardpage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/personaldetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  bool _isBalanceVisible = true;
  int _selectedIndex = 0;
  int _tappedIndex = -1; // Track the tapped item index for animation
  late AnimationController _controller;
  late Animation<double> _scaleAnimation; // For scaling effect

  @override
  void initState() {
    super.initState();
    // Initialize the controller here before it's used
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      case 1:
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
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CardPage()),
        );
        break;
      case 0:
        // No action needed for AccountPage as it's the current page
        break;
    }
  }

  void _onMenuItemTapped(int index) {
    setState(() {
      _tappedIndex = index; // Update the tapped item
    });
    _controller.reset();
    _controller.forward(); // Start the scaling animation
  }

  @override
  Widget build(BuildContext context) {
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
          Positioned.fill(
            top: 0,
            bottom: kBottomNavigationBarHeight + 150,
            child: Container(
              color: Colors.orange,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Profile Avatar Section
              const Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueAccent,
                    backgroundImage: AssetImage(
                        'images/pas.jpg'), // Placeholder for user profile picture
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.blueAccent,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // User Name and Balance
              const Text(
                'Pascal Polycarp',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
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
              const SizedBox(height: 40),
              // Menu Buttons Section
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors
                        .white, // Background color for the overall container
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      _buildMenuItem(Icons.person, "Personal details", 0, () {
                        print("Personal details methods pressed");
                      }),
                      _buildMenuItem(Icons.payment, "Payment methods", 1, () {
                        print("Payment methods pressed");
                        // You can also call your modal or navigation to another screen
                      }),
                      _buildMenuItem(Icons.history, "Transactions", 2, () {
                        print("Transactions pressed");
                      }),
                      _buildMenuItem(Icons.notifications, "Notifications", 3,
                          () {
                        print("Notifications pressed");
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Sign Out Button Section
          Positioned(
            left: 16.0,
            bottom: 40.0,
            child: GestureDetector(
              onTap: () {
                // Handle sign out action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginAccount()), // Navigate to the login page on sign out
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.logout,
                      color: Colors.orange, size: 35), // Increased size here
                  SizedBox(width: 8.0),
                  Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.orange, fontSize: 22),
                  ),
                ],
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
            _buildNavItem(Icons.miscellaneous_services, 1),
            const SizedBox(width: 48.0),
            _buildNavItem(Icons.payment, 3),
            _buildNavItem(Icons.person, 0),
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

  // Menu Item Builder with Scaling and Background Animation
  Widget _buildMenuItem(
      IconData icon, String title, int index, Function onTap) {
    bool isTapped = _tappedIndex == index;

    return GestureDetector(
      onTap: () {
        onTap();
        _onMenuItemTapped(index);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: isTapped ? _scaleAnimation.value : 1.0,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: isTapped
                    ? Colors.orangeAccent.withOpacity(0.8)
                    : const Color.fromARGB(255, 192, 193, 193),
                borderRadius: BorderRadius.circular(10),
                boxShadow: isTapped
                    ? [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ]
                    : [], // Add shadow on tap
              ),
              child: ListTile(
                leading: Icon(icon, color: Colors.white),
                title: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }



  // Navigation Item Builder
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
